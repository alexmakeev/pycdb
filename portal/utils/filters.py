__author__ = 'alexmak'

def getFilterNeighboursByClassName(configuration, cname):
    def ret_func(ent):
        return ent.cid==configuration.cnames_to_cids[cname]
    return ret_func