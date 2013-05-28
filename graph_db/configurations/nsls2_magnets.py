from graph_db.configuration import Configuration, makeAttribute, makeAllowedRelation

class NSLS2Magnets(Configuration):
    def __init__(self):
        Configuration.__init__(self)

        ############ NODES #############
        base_attributes = [
            makeAttribute("readable_name", "Readable Name", "", self.TYPE_STRING, ""),
            makeAttribute("name", "Unique Name", "", self.TYPE_STRING, ""),
        ]

        # addEntityClass(cid, name, readable_name, description, attributes_list)
        self.addEntityClass(1, "server", "Server", "", base_attributes + [
            makeAttribute("addr", "Address", "", self.TYPE_DICTIONARY, {}),
            ])
        self.addEntityClass(2, "ioc", "IOC", "", base_attributes + [
            ])
        self.addEntityClass(3, "device", "Device", "", base_attributes + [
            ])
        self.addEntityClass(4, "device_type", "Device Type", "", base_attributes + [
            ])
        self.addEntityClass(5, "channel", "Channel", "", base_attributes + [
            ])
        self.addEntityClass(6, "link", "Link", "", base_attributes + [
            ])
        self.addEntityClass(7, "connection", "Connection", "", base_attributes + [
            ])
        self.addEntityClass(8, "connection_type", "Connection Type", "", base_attributes + [
            ])
        self.addEntityClass(9, "connection_type_part", "Connection Type Part", "", base_attributes + [
            ])

        ############ EDGES #############
        # addRelationClass(cid, name, readable_name, description, attributes_list, allowed_relations)
        self.addRelationClass(101, "physical", "Physical", "Physical connections", [
            ], [
            makeAllowedRelation(
                {"cname":"server", "multiplicity" : self.MUL_ONE},
                {"cname":"ioc", "multiplicity" : self.MUL_ZERO_OR_MORE}
            ),
            makeAllowedRelation(
                {"cname":"ioc", "multiplicity" : self.MUL_ONE},
                {"cname":"device", "multiplicity" : self.MUL_ZERO_OR_MORE}
            ),
            makeAllowedRelation(
                {"cname":"device", "multiplicity" : self.MUL_ZERO_OR_MORE},
                {"cname":"device", "multiplicity" : self.MUL_ZERO_OR_MORE}
            ),
            ])

        self.addRelationClass(102, "logical", "Logical", "Logical connections", [
        ], [
            makeAllowedRelation(
                {"cname":"server", "multiplicity" : self.MUL_ONE},
                {"cname":"ioc", "multiplicity" : self.MUL_ZERO_OR_MORE}
            ),
            makeAllowedRelation(
                {"cname":"ioc", "multiplicity" : self.MUL_ONE},
                {"cname":"device", "multiplicity" : self.MUL_ZERO_OR_MORE}
            ),
            makeAllowedRelation(
                {"cname":"device", "multiplicity" : self.MUL_ZERO_OR_MORE},
                {"cname":"device", "multiplicity" : self.MUL_ZERO_OR_MORE}
            ),
            ])

#        self.addRelationClass(102, "logical", "Logical", "Logical connections", [
#        ], [
#            makeAllowedRelation(
#                {"cname":"device", "multiplicity" : self.MUL_ONE},
#                {"cname":"devi", "multiplicity" : self.MUL_ZERO_OR_MORE}
#            ),
#            makeAllowedRelation(
#                {"cname":"ioc", "multiplicity" : self.MUL_ONE},
#                {"cname":"device", "multiplicity" : self.MUL_ZERO_OR_MORE}
#            ),
#            makeAllowedRelation(
#                {"cname":"device", "multiplicity" : self.MUL_ZERO_OR_MORE},
#                {"cname":"device", "multiplicity" : self.MUL_ZERO_OR_MORE}
#            ),
#            ])
#
#        self.addRelationClass(103, "type", "Types", "Typing connections", [
#        ], [
#            makeAllowedRelation(
#                {"cname":"device", "multiplicity" : self.MUL_ONE},
#                {"cname":"device_type", "multiplicity" : self.MUL_ZERO_OR_MORE}
#            ),
#            makeAllowedRelation(
#                {"cname":"connection", "multiplicity" : self.MUL_ONE},
#                {"cname":"connection_type", "multiplicity" : self.MUL_ZERO_OR_MORE}
#            ),
#            ])
#
