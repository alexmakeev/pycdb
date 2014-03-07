# -*- coding: utf-8 -*-
import re
import sys
import os
from graph_db.configurations.cxv2_config import CXV2Config
from portal.utils.array_helpers import *

EnumConfigObjects = dict()
"""
Enumerator of supported attribute types
"""
# Лучше cname_to_cids использовать
EnumConfigObjects["C_BUS"] = 1
EnumConfigObjects["C_BUS_TYPE"] = 2
EnumConfigObjects["C_BUS_CONTROLLER"] = 3
EnumConfigObjects["C_BUS_CONTROLLER_TYPE"] = 4
EnumConfigObjects["C_DEVICE"] = 5
EnumConfigObjects["C_DEVICE_TYPE"] = 6
EnumConfigObjects["C_DEVICE_CHANNEL"] = 7
EnumConfigObjects["C_DEVICE_CHANNEL_GROUP"] = 8
EnumConfigObjects["C_SERVER"] = 9

EnumConfigObjects["M_COMPONENTS"] = 1001
EnumConfigObjects["M_TYPES"] = 1002
EnumConfigObjects["M_PHYSICAL_CONNECTIONS"] = 1003
EnumConfigObjects["M_RESPONSIBILITIES"] = 1004

LETTERS = { 1 : 'A', 2 : 'B', 3 : 'C', 4 : 'D', 5 : 'E', 6 : 'F' }
LETTERS_TRIPLE = { 1 : 'ABC', 2 : 'DEF'}
processed_server_devices = {}

filename_expression = r"blklist-(?P<server_name>.+?)\.lst"
filename_re = re.compile(filename_expression, re.I)

channel_groups_expression = r"((r(?P<readable_count>\d+))|(w(?P<writable_count>\d+)))"
channel_groups_re = re.compile(channel_groups_expression, re.I)

blk_row_expression = r"^((\s*)|(\#.*)|(\s*(?P<filename>.+?)\s+(?P<driver>.+?)\s+(?P<bus_id>.+?)\s+(?P<main_info>.+?)\s+(?P<bigc_info>.+?)((\s*?)|(\s+(?P<aux_info>.+?)))))$"
blk_row_re = re.compile(blk_row_expression, re.I and re.M)


def get_bus_controller_config_format(row_info):
    """
    Get bus controller config format string
    """
    to_return = "%d\t%d\t%b\t%c\t%z\t%a"
    if ("sktcankoz" == row_info["filename"]):
        to_return = "sktcankoz\t%d\t%b\t%c\t%z\t%a"
    return to_return

def get_bus_type_name(driver_filename):
    """
    Get Bus Type Name to identify the bus type
    """
    to_return = driver_filename
    if ("sktcankoz" == driver_filename): to_return = "CAN"
    if ("adc200me" == driver_filename): to_return = "PCI"
    if ("dl200me" == driver_filename): to_return = "PCI"
    if ("adc812me" == driver_filename): to_return = "PCI"
    if ("kshd485" == driver_filename): to_return = "RS232"
    return to_return

def get_bus_name(driver_filename, server_name):
    """
    Get Bus Name to identify the bus
    """
    return get_bus_type_name(driver_filename) + " of " + server_name

def get_bus_controller_type_name(driver_filename):
    """
    Get Bus Name to identify the bus
    """
    return get_bus_type_name(driver_filename) + " Controller"

def get_bus_controller_name(driver_filename, server_name):
    """
    Get Bus Name to identify the bus
    """
    return get_bus_controller_type_name(driver_filename) + " of " + server_name

def GetCreateEntity(request, results, c_name, filter_dict):

    if c_name == 'type' or c_name == 'logical' or c_name == 'responsibilities' or c_name == 'physical':
#        sys.stdout.write(' !!! Edge !!! \n\n')
        edges = request.configuration.getAllRelations(filter_dict['to'], c_name)
        for edge in edges:
            if edge.from_id[1] == filter_dict['from'].id and edge.to_id[1] == filter_dict['to'].id:
                return edge

#        sys.stdout.write(' !!! Edges of the entity:'+ str(edges) +' !!! \n\n')
        edge = request.configuration.makeRelation(c_name, filter_dict['from'], filter_dict['to'])
        edge.save()
        return edge

    else:
#        sys.stdout.write(' !!! Entity!!! \n\n')
        entity = getFirstOrNone(request.configuration.getAllEntities(c_name, filter_func, True, filter_dict))
        if entity:
            results.append("Already exists " + str(entity.cid))
        else:
            entity = request.configuration.makeEntity(c_name)
            for key in filter_dict.keys():
                entity.attributes[key] = filter_dict[key]
#            sys.stdout.write('FILTER_DICT: '+str(filter_dict)+' \n')


            entity.save()
            entity.attributes['readable_name'] = c_name + str(entity.id)
            entity.attributes['c_name'] = c_name
            results.append("Created " + str(entity.cid))

        return entity

def filter_func(params):
    filter_dict = params['filter_dict']
    cnames_to_cids = params['cnames_to_cids']
##    sys.stdout.write('\n PARAMS: '+str(params)+' \n')
    filter_keys = filter_dict.keys()
    if params['cid'] == cnames_to_cids['server']:
        if 'name' in filter_keys:
            if filter_dict['name'] == params['name']:
#                sys.stdout.write(' ACCESS TO CREATE:  server \n')
                return True


    if params['cid'] == cnames_to_cids['device']:
        if 'addr' in filter_keys and 'init_str' in filter_keys:
            if filter_dict['addr'] == params['addr'] and filter_dict['init_str'] == params['init_str']:
#                sys.stdout.write('ACCESS TO CREATE:  device \n')
                return True


    if params['cid'] == cnames_to_cids['device_type']:
        if 'name' in filter_keys and 'bigc_info' in filter_keys and 'description' in filter_keys:
            if filter_dict['name'] == params['name'] and filter_dict['bigc_info'] == params['bigc_info'] and filter_dict['description'] == params['description']:
#                sys.stdout.write(' ACCESS TO CREATE:  device_type \n')
                return True


    if params['cid'] == cnames_to_cids['device_channel_group']:
        if 'name' in filter_keys and 'group_number' in filter_keys:
            if filter_dict['name'] == params['name'] and filter_dict['group_number'] == params['group_number']:
#                sys.stdout.write('ACCESS TO CREATE:  device_channel_group \n')
                return True


    if params['cid'] == cnames_to_cids['bus']:
        if 'name' in filter_keys:
            if filter_dict['name'] == params['name']:
#                sys.stdout.write('ACCESS TO CREATE:  bus \n')
                return True


    if params['cid'] == cnames_to_cids['bus_type']:
        if 'name' in filter_keys:
            if filter_dict['name'] == params['name']:
#                sys.stdout.write('ACCESS TO CREATE:  bus_type \n')
                return True


    if params['cid'] == cnames_to_cids['bus_controller']:
        if 'name' in filter_keys:
            if filter_dict['name'] == params['name']:
#                sys.stdout.write('ACCESS TO CREATE:  bus_controller \n')
                return True


    if params['cid'] == cnames_to_cids['bus_controller_type']:
        if 'name' in filter_keys and 'config_format' in filter_keys:
            if filter_dict['name'] == params['name'] and filter_dict['config_format'] == params['config_format']:
#                sys.stdout.write('ACCESS TO CREATE:  bus_controller_type \n')
                return True

    return False


def SaveEntity(request, results, entity):
    """
    Save Entity helper
    """
    controller = request.config_header.GetConfigController(entity.GetControllerId())
    if (not controller.GetStorage().Save(entity)):
#        session.flash = "Couldn't save " + str(entity.GetInstanceId()) + " entity:" + entity.ToString() + " - see logs for details"
#        redirect(URL("index"))
        results.append("Couldn't save " + str(entity.GetInstanceId()) + " entity:" + entity.ToString() + " - see logs for details")
    results.append("Saved " + controller.ToString() + " " + entity.ToString())
    return True



def my_blk_row_processor(request, results, matchobj, cur_server, sequence_number):
    """
    Blk Row data processor
    """


    row_data = matchobj.groupdict()
#    sys.stdout.write('ROW_DATA: '+ str(row_data) +' \n')
    if (None == row_data["filename"]): return False
    server_name = cur_server.attributes["name"]
    if (None == row_data["aux_info"]): row_data["aux_info"] = ""

    name = row_data["driver"]
    list_letters = ["panov_ubs", "adc200me"]
    list_letters_triple = ["adc812me"]
    if (row_data["driver"].lower() in list_letters+list_letters_triple):
        if (not server_name in processed_server_devices): processed_server_devices[server_name] = {}
        if (not row_data["driver"] in processed_server_devices[server_name]): processed_server_devices[server_name][row_data["driver"]] = 1
        if (row_data["driver"].lower() in list_letters):
            name = row_data["driver"] + "_" + LETTERS[processed_server_devices[server_name][row_data["driver"]]]
        if (row_data["driver"].lower() in list_letters_triple):
            name = row_data["driver"] + "_" + LETTERS_TRIPLE[processed_server_devices[server_name][row_data["driver"]]]
        processed_server_devices[server_name][row_data["driver"]] += 1
    device = GetCreateEntity(request, results, "device", {"addr" : row_data["bus_id"], "init_str" : row_data["aux_info"], "description" : row_data["driver"] + "served by " + server_name})
    device.attributes["sequence_number"] = sequence_number
    device.attributes["name"] = name


    ####################### Get/Create device type
    cur_device_type = GetCreateEntity(request, results, "device_type", {"name" : row_data["driver"], "description" : "Channel groups: %s" % row_data["main_info"], "bigc_info" : row_data["bigc_info"]})

    ####################### Create channel groups
    saved_groups = 0
    for t_matchobj in re.finditer(channel_groups_re, row_data["main_info"]):
        group_counts = t_matchobj.groupdict()
        group_description = "Owned by " + row_data["driver"]
        device_cg = GetCreateEntity(request, results, "device_channel_group", {"name": t_matchobj.group(0), "group_number": saved_groups * 10, "description": group_description})
        if (None != group_counts["readable_count"]):
            device_cg.attributes["quantity"] = group_counts["readable_count"]
            device_cg.attributes["is_writable"] = False
        if (None != group_counts["writable_count"]):
            device_cg.attributes["quantity"] = group_counts["writable_count"]
            device_cg.attributes["is_writable"] = True
        saved_groups += 1

        ####################### Save the channel as the component of the device
#        GetCreateEntity(request, results, "M_COMPONENTS", {"Unit" : cur_device_type, "Part" : device_cg})

        ####################### Save the type of the device
    GetCreateEntity(request, results, "type", {"from": cur_device_type, "to": device})

    ####################### Prepare bus attributes
    bus_name = get_bus_name(row_data["filename"], server_name)
    bus_type_name = get_bus_type_name(row_data["filename"])
    bus_controller_name = get_bus_controller_name(row_data["filename"], server_name)
    bus_controller_type_name = get_bus_controller_type_name(row_data["filename"])
    bus_controller_type_config_format = get_bus_controller_config_format(row_data)
    bus_description = "Assigned to " + server_name

    ####################### Get/Create bus
    cur_bus = GetCreateEntity(request, results, "bus", {"name": bus_name})

    ####################### Get/Create the type of the bus
    cur_bus_type = GetCreateEntity(request, results, "bus_type", {"name": bus_type_name})

    ####################### Save the type of the bus
    GetCreateEntity(request, results, "type", {"from": cur_bus_type, "to": cur_bus})

    ####################### Get/Create the bus controller
    cur_bus_controller = GetCreateEntity(request, results, "bus_controller", {"name": bus_controller_name})

    ####################### Get/Create the type of the bus controller
    cur_bus_controller_type = GetCreateEntity(request, results, "bus_controller_type", {"name" : bus_controller_type_name, "config_format" : bus_controller_type_config_format})

    ####################### Save the type of the bus controller
    GetCreateEntity(request, results, "type", {"from" : cur_bus_controller_type, "to" : cur_bus_controller})

    ####################### Connect server to the bus_controller
    GetCreateEntity(request, results, "physical", {"from": cur_server, "to": cur_bus_controller})

    ####################### Connect bus_controller to the bus
    GetCreateEntity(request, results, "physical", {"from": cur_bus_controller, "to": cur_bus})

    ####################### Connect device to the bus
    GetCreateEntity(request, results, "physical", {"from": cur_bus, "to": device})

    ####################### Link the responsible server to the device
    GetCreateEntity(request, results, "responsibilities", {"from": cur_server, "to": device})


    return True



def process_data(request, results, file_name, data):
    """
    Process data of a single file
    """
    #parser
    # file driver bus_id main_info bigc_info auxinfo

    results.append("")
    results.append("-------")
    results.append(str(file_name))
    results.append("-------")

    server_name = file_name
    for t_matchobj in re.finditer(filename_re, file_name):
        server_name = t_matchobj.groupdict()["server_name"]
        server_name = server_name.replace("-", ":")
    results.append("Server: " + server_name)

    cur_server = GetCreateEntity(request, results, "server", {"name": server_name})
    cur_server.attributes['name'] = server_name
#    cur_server = GetCreateEntity(request, results, "C_SERVER", {"name" : server_name})
    sequence_number = 0
    for matchobj in re.finditer(blk_row_re, data):
        if (my_blk_row_processor(request, results, matchobj, cur_server, sequence_number)):
            sequence_number += 1

    return results


def exportAllConfigFiles(request):
    status = 'exportAllConfigFiles'
    ser_cid = request.configuration.cnames_to_cids['server']
    lines = []

    sorted_neighbours = {}
    servers = request.configuration.getAllEntities(ser_cid)
    for serv in servers:
        neighbours = request.configuration.getAllNeighbours(serv)

        #Create dict{dict} to make a file with lines order like original one
        for neighbour in neighbours:
            if 'sequence_number' in neighbour.attributes:
                sorted_neighbours[neighbour.attributes['sequence_number']] = neighbour

        neighbours_keys = sorted_neighbours.keys()
        neighbours_keys.sort()
        for key in neighbours_keys:
            device_type = {}
            the_neighbour = sorted_neighbours[key].attributes

            #Get part of information from type of the device
            the_neighbours = request.configuration.getAllNeighbours(sorted_neighbours[key])
            for item in the_neighbours:
                if item.attributes['c_name'] == 'device_type':
                    device_type = item.attributes

            bigc_info = device_type['bigc_info']
            if bigc_info == '':
                bigc_info = '-'

            lines.append( the_neighbour['name'] + '\t' + the_neighbour['name'] + '\t' + the_neighbour['addr'] + '\t' + device_type['description'].split(':')[1] + '\t' + bigc_info + '\t'+ the_neighbour['init_str'])

        lines.insert(0,"# " + serv.attributes['name'] + "\n #file\tdriver\tbus_id\tmain_i\tbig_i\tauxinfo ")

        #Create a file and write to one
        homeDir = os.path.expanduser("~")
        w_f = open(homeDir +'/blklist-'+ serv.attributes["name"].replace(':', '-') + '.lst', 'w')
        w_f.writelines("%s\n" % i for i in lines)
        w_f.close()

    return status