import logging
logger = logging.getLogger(__name__)

def makeAttribute(name, readable_name, description, data_type, default_value):
    ret = {
        "name" : name,
        "readable_name" : readable_name,
        "description" : description,
        "data_type" : data_type,
        "default_value" : default_value,
    }
    return ret

def makeAllowedRelation(descr_from, descr_to):
    ret = {
        "from" : descr_from,
        "to" : descr_to,
    }
    return ret

class ConfigurationObject:
    def __init__(self, configuration=None, cname_or_cid=-1, id=-1):
        self.configuration = configuration
        self.attributes = {}
        self.cid = self.configuration.convertCNameIfNeeded(cname_or_cid)
        self.id = id
        self.is_loaded = False

    def getId(self):
        return (self.cid, self.id)

    def __getitem__(self, item):
        return self.attributes[item]

    def __setitem__(self, key, value):
        self.attributes[key] = value

class Entity(ConfigurationObject):

    def save(self):
        return self.configuration.saveEntityAttributes(self)

    def load(self):
        return self.configuration.loadEntityAttributes(self)

    def delete(self):
        return self.configuration.deleteEntity(self)

    def getNeighbours(self, relation_cname_or_cid, filter=None):
        return self.configuration.getAllRelations(self, relation_cname_or_cid, filter=filter)

    def getNeighboursFrom(self, relation_cname_or_cid, filter=None):
        return self.configuration.getAllRelations(self, relation_cname_or_cid, filter=filter, role="from")

    def getNeighboursTo(self, relation_cname_or_cid, filter=None):
        return self.configuration.getAllRelations(self, relation_cname_or_cid, filter=filter, role="to")

    def getTitle(self, length=None):
        ret_arr =  []
        attributes = self.configuration.classes[self.cid]["attributes"]
        for attr in attributes[:1]:
            attr_name = attr["name"]
            ret_arr += [self.attributes[attr_name]]
        ret = " ".join(ret_arr)
        if length and len(ret)>length: ret = ret[:(length-3)] + "..."
        return ret

    def getDescription(self, length=None):
        ret_arr =  []
        attributes = self.configuration.classes[self.cid]["attributes"]
        for attr in attributes[1:]:
            attr_name = attr["name"]
            ret_arr += [str(self.attributes[attr_name])]
        ret = " ".join(ret_arr)
        if length and len(ret)>length: ret = ret[:(length-3)] + "..."
        return ret

    def __str__(self):
        ret = "%s %s: " % (self.configuration.classes[self.cid]["name"], self.id)
        if self.is_loaded:
            ret += "%s" % self.attributes
        else:
            ret += "[Not loaded]"
        return ret

class Relation(ConfigurationObject):
    def __init__(self, configuration, cname_or_cid=-1, ent_from_id=None, ent_to_id=None, id=-1):
        ConfigurationObject.__init__(self, configuration, cname_or_cid, id)
        self.from_id = ent_from_id
        self.to_id = ent_to_id

    def getFromEntity(self):
        return self.configuration.loadEntityByEntityId(self.from_id)

    def getToEntity(self):
        return self.configuration.loadEntityByEntityId(self.to_id)

    def save(self):
        return self.configuration.saveRelationAttributes(self)

    def load(self):
        return self.configuration.loadRelationAttributes(self)

    def delete(self):
        return self.configuration.deleteRelation(self)

class Configuration:
    MUL_ZERO_OR_ONE = "zero_or_one"
    MUL_ONE = "one"
    MUL_ONE_OR_MORE = "one_or_more"
    MUL_ZERO_OR_MORE = "zero_or_more"

    TYPE_INTEGER = "int"
    TYPE_DOUBLE = "double"
    TYPE_STRING = "string"
    TYPE_DICTIONARY = "dict"

    def __init__(self):
        self.classes = {} ## cid to class header dict
        self.cnames_to_cids = {}

    def initialize(self, storage):
        self.storage = storage
        return True

    def __del__(self):
        del self.storage

    def addEntityClass(self, cid, name, readable_name, description, attributes_list):
        if cid in self.classes: logger.warning('Entity Class cid has been redefined: %s.%s = %s!' % (__name__, name, cid))
        self.classes[cid] = {
            "type" : "entity_class",
            "name" : name,
            "readable_name" : readable_name,
            "description" : description,
            "attributes" : attributes_list,
            }
        if name in self.cnames_to_cids: logger.warning('Entity Class name has been redefined: %s.%s = %s!' % (__name__, name, cid))
        self.cnames_to_cids[name] = cid
        return True

    def addRelationClass(self, cid, name, readable_name, description, attributes_list, allowed_relations):
        if cid in self.classes: logger.warning('Relation Class cid has been redefined: %s.%s = %s!' % (__name__, name, cid))
        for allowed_rel in allowed_relations:
            for role, cfg in allowed_rel.iteritems():
                if cfg["cname"] not in self.cnames_to_cids: logger.warning('Entity Class name has not been found: %s!' % (cfg["cname"]))
                cfg["cid"] = self.cnames_to_cids[cfg["cname"]]

        self.classes[cid] = {
            "type" : "relation_class",
            "name" : name,
            "readable_name" : readable_name,
            "description" : description,
            "attributes" : attributes_list,
            "allowed_relations" : allowed_relations,
            }
        if name in self.cnames_to_cids: logger.warning('Relation Class name has been redefined: %s.%s = %s!' % (__name__, name, cid))
        self.cnames_to_cids[name] = cid
        return True

    def convertCNameIfNeeded(self, cname_or_cid):
        cid = cname_or_cid
        if type(cid) == str: cid = self.cnames_to_cids[cname_or_cid]
        return cid

    def __writeAttributesByClassInfo(self, configuration_object):
        cid = configuration_object.cid
        class_info = self.classes[cid]
        for attr in class_info["attributes"]:
            configuration_object[attr["name"]] = attr["default_value"]

    ################## ENTITIES

    def makeEntity(self, cname_or_cid, id=-1):
        ret = Entity(self, cname_or_cid, id)
        self.__writeAttributesByClassInfo(ret)
        return ret

    def loadEntity(self, cname_or_cid, id):
        ret = self.makeEntity(cname_or_cid, id)
        ret.load()
        return ret

    def loadEntityByEntityId(self, ent_id):
        ret = self.makeEntity(ent_id[0], ent_id[1])
        ret.load()
        return ret

    def deleteEntity(self, entity):
        eid = entity.getId()
        self.storage.nxgraph.remove_node(eid) # All edges will be deleted also

    def saveEntityAttributes(self, entity):
        if entity.id == -1:
            max_ids = self.storage.nxgraph.graph["max_ids"]
            if entity.cid not in max_ids: max_ids[entity.cid] = 1
            entity.id = max_ids[entity.cid]
            max_ids[entity.cid] += 1

        self.storage.nxgraph.add_node(entity.getId(), attr_dict=entity.attributes)
        return True

    def loadEntityAttributes(self, entity, data=None):
        id = entity.getId()
        # TODO: check for existence
        if (not data):
            if id not in self.storage.nxgraph.node: raise Exception("Object %s not found in the storage" % str(id))
            data = self.storage.nxgraph.node[id]
        entity.attributes = {}
        self.__writeAttributesByClassInfo(entity)
        for (key, value) in data.iteritems():
            entity.attributes[key] = value
        entity.is_loaded = True
        return True

    ################### RELATIONS

    def makeRelation(self, cname_or_id, ent_or_id_from=None, ent_or_id_to=None, id=-1):
        if isinstance(ent_or_id_from, ConfigurationObject): ent_or_id_from = ent_or_id_from.getId()
        if isinstance(ent_or_id_to, ConfigurationObject): ent_or_id_to = ent_or_id_to.getId()
        ret = Relation(self, cname_or_id, ent_or_id_from, ent_or_id_to, id)
        self.__writeAttributesByClassInfo(ret)
        return ret

    def findRelations(self, cname_or_cid, ent1, ent2):
        cid = self.convertCNameIfNeeded(cname_or_cid)
        ents = [ent1, ent2]
        ret = []
        for i in (0,1):
            t_ent1 = ents[i]
            t_ent2 = ents[1-i]
            t_eid1 = t_ent1.getId()
            t_eid2 = t_ent2.getId()
            if t_eid2 not in self.storage.nxgraph[t_eid1]: continue
            relations = self.storage.nxgraph[t_eid1][t_eid2]
            for rel in relations.keys():
                if rel[0] == cid:
                    ret += [self.makeRelation(cid, t_ent1, t_ent2, rel[1])]
        return ret

    def loadRelation(self, cname_or_cid, id):
        cid = self.convertCNameIfNeeded(cname_or_cid)
        rid = (cid, id)
        (eid1,eid2) =  self.storage.nxgraph.graph["edges_by_ids"][rid]
        rel = self.makeRelation(cid, eid1, eid2, id)
        rel.load()
        return rel

    def deleteRelation(self, relation):
        rid = relation.getId()
        (eid1, eid2) =  self.storage.nxgraph.graph["edges_by_ids"][rid]
        self.storage.nxgraph.remove_edge(eid1, eid2, key=rid)

    def saveRelationAttributes(self, relation):
        (cid,id) = relation.getId()
        if id == -1:
            max_ids = self.storage.nxgraph.graph["max_ids"]
            if cid not in max_ids: max_ids[cid] = 1
            id = max_ids[cid]
            max_ids[cid] += 1
            self.storage.nxgraph.graph["edges_by_ids"][(cid, id)] = (relation.from_id, relation.to_id)
        # TODO: check for existence
        self.storage.nxgraph.add_edge(relation.from_id, relation.to_id, key=(cid,id), attr_dict=relation.attributes)
        return True

    def loadRelationAttributes(self, relation, data=None):
        rid = relation.getId()
        (eid1,eid2) =  self.storage.nxgraph.graph["edges_by_ids"][rid]
        # TODO: check for existence relation.entity_from, relation.entity_to, key=rid
        if (data == None):
            if eid1 not in self.storage.nxgraph \
                or eid2 not in self.storage.nxgraph[eid1] \
                or rid not in self.storage.nxgraph[eid1][eid2]:
                raise Exception("Edge %s = %s -> %s not found in the storage" % (rid, eid1, eid2))
            data = self.storage.nxgraph[eid1][eid2][rid]
        relation.attributes = {}
        self.__writeAttributesByClassInfo(relation)
        for (key, value) in data.iteritems():
            relation.attributes[key] = value
        relation.is_loaded = True
        return True

    ################### QUERIES

    def getAllEntities(self, cname_or_cid=None, filter_func=None, load_instances=True):
        #TODO: make optimization by creating indexes by cid at initial configuration load
        if (not cname_or_cid and not filter_func and not load_instances): return self.storage.nxgraph.nodes(data=False)
        nodes = self.storage.nxgraph.nodes(data=True)
        ret = []
        cid = self.convertCNameIfNeeded(cname_or_cid)
        for node in nodes:
            will_add = True
            if cname_or_cid: will_add = will_add and node[0][0] == cid
            if filter_func:
                params = {"cid" : node[0][0], "id" : node[0][1]} # Make a copy of dict for lame storage protection
                params.update(node[1])
                will_add = will_add and filter_func(params)
            if (will_add):
                if (not load_instances): ret += [node[0]]
                else: # Load instance without querying storage
                    instance = self.makeEntity(node[0][0], node[0][1])
                    self.loadEntityAttributes(instance, node[1])
                    ret += [instance]
        return ret

    def getAllRelations(self, entity, relation_cname_or_cid=None, filter_func=None, load_instances=True):
        edges = self.storage.nxgraph.in_edges(entity.getId(), keys=True, data=True) + self.storage.nxgraph.out_edges(entity.getId(), keys=True, data=True)
        ret = []
        rcid = self.convertCNameIfNeeded(relation_cname_or_cid)

        for edge in edges:
            (from_id, to_id, rel_id, data) = edge
            will_add = True
            if relation_cname_or_cid: will_add = will_add and rel_id[0] == rcid
            if filter_func:
                params = {"from_cid" : from_id[0], "from_id" : from_id[1],"to_cid" : to_id[0], "to_id" : to_id[1], "cid" : rel_id[0], "id" : rel_id[1]} # Make a copy of dict for lame storage protection
                params.update(data)
                will_add = will_add and filter_func(params)
            if (will_add):
                if (not load_instances): ret += [(rel_id, from_id, to_id)] # Rel_id, Ent1_id, Rnt2_id
                else: # Load instance without querying storage
                    relation = self.makeRelation(rel_id[0], from_id, to_id, rel_id[1])
                    self.loadRelationAttributes(relation, data)
                    ret += [relation]
        return ret

    def getAllNeighbours(self, entity, relation_cname_or_cid=None, filter_func=None, load_instances=True):
        return

    def getAllAllowedNeighboursPatternsByRelationsClassesIds(self, entity, relation_cname_or_cid=None):
        ret = {}
        cids = self.classes.keys()
        cids.sort()
        rcid = self.convertCNameIfNeeded(relation_cname_or_cid)
        for cid in cids:
            if rcid and rcid != cid: continue
            if (self.classes[cid]["type"]!="relation_class"): continue
            t_cls = self.classes[cid]
            allowed_relations = t_cls["allowed_relations"]
            for allowed_rel in allowed_relations:
                for role_pair in [("from", "to"), ("to", "from")]:
                    will_add = True
                    if allowed_rel[role_pair[0]]["cid"] != entity.getId()[0]:
                        will_add = False
                    if will_add:
                        if cid not in ret: ret[cid] = []
                        ret[cid] += [{"entity_role" : role_pair[0], "neighbour_role" : role_pair[1], "neighbour" : allowed_rel[role_pair[1]]}]
        return ret
