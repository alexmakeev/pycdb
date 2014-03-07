"""Operations on many graphs.
"""
#    Copyright (C) 2012 by
#    Aric Hagberg <hagberg@lanl.gov>
#    Dan Schult <dschult@colgate.edu>
#    Pieter Swart <swart@lanl.gov>
#    All rights reserved.
#    BSD license.
try:
    from itertools import izip_longest as zip_longest
except ImportError: # Python3 has zip_longest
    from itertools import zip_longest
import networkx as nx
from networkx.utils import is_string_like

__author__ = """\n""".join([ 'Robert King <kingrobertking@gmail.com>',
                             'Aric Hagberg <aric.hagberg@gmail.com>'])

__all__ = ['union_all', 'compose_all', 'disjoint_union_all',
           'intersection_all']

def union_all(graphs, rename=(None,) , name=None):
    """Return the union of all graphs.

    The graphs must be disjoint, otherwise an exception is raised.

    Parameters
    ----------
    graphs : list of graphs
       List of NetworkX graphs

    rename : bool , default=(None, None)
       Node names of G and H can be changed by specifying the tuple
       rename=('G-','H-') (for example).  Node "u" in G is then renamed
       "G-u" and "v" in H is renamed "H-v".

    name : string
       Specify the name for the union nxgraph@not_implemnted_for('direct

    Returns
    -------
    U : a nxgraph with the same type as the first nxgraph in list

    Notes
    -----
    To force a disjoint union with node relabeling, use
    disjoint_union_all(G,H) or convert_node_labels_to integers().

    Graph, edge, and node attributes are propagated to the union nxgraph.
    If a nxgraph attribute is present in multiple graphs, then the value
    from the last nxgraph in the list with that attribute is used.

    See Also
    --------
    union
    disjoint_union_all
    """
    graphs_names = zip_longest(graphs,rename)
    U, gname = next(graphs_names)
    for H,hname in graphs_names:
        U = nx.union(U, H, (gname,hname),name=name)
        gname = None
    return U

def disjoint_union_all(graphs):
    """Return the disjoint union of all graphs.

    This operation forces distinct integer node labels starting with 0
    for the first nxgraph in the list and numbering consecutively.

    Parameters
    ----------
    graphs : list
       List of NetworkX graphs

    Returns
    -------
    U : A nxgraph with the same type as the first nxgraph in list

    Notes
    -----
    It is recommended that the graphs be either all directed or all undirected.

    Graph, edge, and node attributes are propagated to the union nxgraph.
    If a nxgraph attribute is present in multiple graphs, then the value
    from the last nxgraph in the list with that attribute is used.
    """
    U = graphs.pop(0)
    for H in graphs:
        U = nx.disjoint_union(U, H)
    return U

def compose_all(graphs, name=None):
    """Return the composition of all graphs.

    Composition is the simple union of the node sets and edge sets.
    The node sets of the supplied graphs need not be disjoint.

    Parameters
    ----------
    graphs : list
       List of NetworkX graphs

    name : string
       Specify name for new nxgraph

    Returns
    -------
    C : A nxgraph with the same type as the first nxgraph in list

    Notes
    -----
    It is recommended that the supplied graphs be either all directed or all
    undirected.

    Graph, edge, and node attributes are propagated to the union nxgraph.
    If a nxgraph attribute is present in multiple graphs, then the value
    from the last nxgraph in the list with that attribute is used.
    """
    C = graphs.pop(0)
    for H in graphs:
        C = nx.compose(C, H, name=name)
    return C

def intersection_all(graphs):
    """Return a new nxgraph that contains only the edges that exist in
    all graphs.

    All supplied graphs must have the same node set.

    Parameters
    ----------
    graphs_list : list
       List of NetworkX graphs

    Returns
    -------
    R : A new nxgraph with the same type as the first nxgraph in list

    Notes
    -----
    Attributes from the nxgraph, nodes, and edges are not copied to the new
    nxgraph.
    """
    R = graphs.pop(0)
    for H in graphs:
        R = nx.intersection(R, H)
    return R
