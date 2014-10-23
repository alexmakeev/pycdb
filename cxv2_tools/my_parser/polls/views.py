# -*- encoding: utf-8 -*-



import re

filename_expression = r"blklist-(?P<server_name>.+?)\.lst"
filename_re = re.compile(filename_expression, re.I)

blk_row_expression = r"^((\s*)|(\#.*)|(\s*(?P<filename>.+?)\s+(?P<driver>.+?)\s+(?P<bus_id>.+?)\s+(?P<main_info>.+?)\s+(?P<bigc_info>.+?)((\s*?)|(\s+(?P<aux_info>.+?)))))$"
blk_row_re = re.compile(blk_row_expression, re.I and re.M)


def index(request):
    file_name = 'blklist-linac1-1.lst'

    results = []

    results.append("-------")
    results.append(str(file_name))
    results.append("-------")
    f = open('/home/xukum/Documents/Nikita/configs/' + file_name, 'r')
    w_f = open('/home/xukum/Documents/Nikita/configs/my_blk.lst', 'w')
    data = ''.join(str(e) for e in f.readlines())

    server_name = file_name
    for t_matchobj in re.finditer(filename_re, file_name):
        server_name = t_matchobj.groupdict()["server_name"]
        server_name = server_name.replace("-", ":")
    results.append("# " + server_name)

    results.append("# file	driver	bus_id	main_i  big_i   auxinfo")

    for t_matchobj in re.finditer(blk_row_re, data):
        line = t_matchobj.groupdict()
        t_str = str(line.pop('driver')) + " " + str(line.pop('bus_id')) + " " + str(line.pop('main_info')) + " " + str(
            line.pop('bigc_info')) + " " + str(line.pop('aux_info'))
        if t_str.find('None') < 0:
            results.append(t_str)

    w_f.writelines("%s\n" % i for i in results)

    f.close()
    w_f.close()
    context = {'results': results}
    # return render(request, 'cxv2_tools/index.html', context)
