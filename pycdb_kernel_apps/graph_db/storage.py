import networkx as nx
import os

class Storage:
    def __init__(self, graph_file):
        self.graph_file = graph_file
        if os.path.exists(self.graph_file):
            self.nxgraph = nx.read_gpickle(self.graph_file)
            #print "Loaded"
        else:
            self.nxgraph = nx.MultiDiGraph(max_id=1)
            self.nxgraph.graph["max_ids"] = {}
            self.nxgraph.graph["edges_by_ids"] = {}
            #print "Created"

    def persist(self):
        #print "Persisted"
        prefixes = ["", ".reserve.01",  ".reserve.02", ".reserve.03", ".reserve.04", ".reserve.05"]

        for i in range(len(prefixes)-2, -1, -1):
            if os.path.exists(self.graph_file + prefixes[i]):
                os.rename(self.graph_file + prefixes[i], self.graph_file + prefixes[i+1])
        nx.write_gpickle(self.nxgraph, self.graph_file + prefixes[0]) # "/home/alexmak/test.pickle")#

    def __del__(self):
        #print "Deleted"
        self.persist()

