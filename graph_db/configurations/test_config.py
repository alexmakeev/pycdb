# -*- encoding: utf-8 -*-

from graph_db.configuration import Configuration, makeAttribute, makeAllowedRelation


class TestConfig(Configuration):
    def __init__(self):
        Configuration.__init__(self)
        self.addEntityClass(1, "human", "Human", "Homo Sapiens", [
            makeAttribute("name", "Name", "Name of a human", self.TYPE_STRING, ""),
            makeAttribute("age", "Age", "Age of a human", self.TYPE_INTEGER, 0),
            makeAttribute("weight", "Weight", "Weight of a human", self.TYPE_DOUBLE, 0.0),
        ])
        self.addEntityClass(2, "animal", "Animal", "Just animals", [
            makeAttribute("name", "Name", "Name of an animal", self.TYPE_STRING, ""),
            makeAttribute("weight", "Weight", "Weight of an animal", self.TYPE_DOUBLE, 0),
        ])

        self.addRelationClass(101, "friendship", "Friendship", "Friendship relations", [
            makeAttribute("strength", "Strength", "Strength of friendship", self.TYPE_DOUBLE, 0.0),
        ], [
                                  makeAllowedRelation(
                                      {"cname": "human", "multiplicity": self.MUL_ONE},
                                      {"cname": "human", "multiplicity": self.MUL_ZERO_OR_MORE}
                                  ),
                                  makeAllowedRelation(
                                      {"cname": "human", "multiplicity": self.MUL_ZERO_OR_MORE},
                                      {"cname": "animal", "multiplicity": self.MUL_ZERO_OR_MORE}
                                  ),
                              ])
