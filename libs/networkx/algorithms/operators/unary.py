"""Unary operations on graphs"""
# Copyright (C) 2004-2012 by
#    Aric Hagberg <hagberg@lanl.gov>
#    Dan Schult <dschult@colgate.edu>
#    Pieter Swart <swart@lanl.gov>
#    All rights reserved.
#    BSD license.
__author__ = """\n""".join(['Aric Hagberg (hagberg@lanl.gov)',
                            'Pieter Swart (swart@lanl.gov)',
                            'Dan Schult(dschult@colgate.edu)'])
__all__ = ['complement']


def complement(G, name=None):
    """Return the nxgraph complement of G.

    Parameters
    ----------
    G : nxgraph
       A NetworkX nxgraph

    name : string
       Specify name for new nxgraph

    Returns
    -------
    GC : A new nxgraph.

    Notes
    ------
    Note that complement() does not create self-loops and also
    does not produce parallel edges for MultiGraphs.

    Graph, node, and edge data are not propagated to the new nxgraph.
    """
    if name is None:
        name = "complement(%s)" % (G.name)
    R = G.__class__()
    R.name = name
    R.add_nodes_from(G)
    R.add_edges_from(((n, n2)
                      for n, nbrs in G.adjacency_iter()
                      for n2 in G if n2 not in nbrs
                      if n != n2))
    return R
