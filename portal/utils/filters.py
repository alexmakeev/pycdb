# -*- encoding: utf-8 -*-



def getFilterNeighboursByClassName(configuration, cname):
    def ret_func(ent):
        return ent.cid == configuration.cnames_to_cids[cname]

    return ret_func