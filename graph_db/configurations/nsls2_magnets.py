# -*- encoding: utf-8 -*-

from graph_db.configuration import Configuration, makeAttribute, makeAllowedRelation

class NSLS2Magnets(Configuration):
    def __init__(self):
        Configuration.__init__(self)





        ############ NODES #############
        base_attributes_top = [
            makeAttribute("readable_name", "Readable Name", "For rapid people understanding", self.TYPE_STRING, ""),
            makeAttribute("name", "Unique API Name", "For automated scripts, should be permanent", self.TYPE_STRING, ""),
            ]
        base_attributes_bottom = [
            makeAttribute("note", "Note", "For people, for example, some errors history notes", self.TYPE_TEXT, ""),
            ]

        # addEntityClass(cid, name, readable_name, description, attributes_list)
        self.addEntityClass(1, "server", "Server", "", base_attributes_top + [
            makeAttribute("address", "IP or Domain Name", "", self.TYPE_STRING, "0.0.0.0"),
            ] + base_attributes_bottom)

        self.addEntityClass(2, "ioc", "IOC", "", base_attributes_top + [
            makeAttribute("template", "Template", "Template file for generating IOC's config", self.TYPE_STRING, "ioc.tmpl"),
            ] + base_attributes_bottom)

        self.addEntityClass(3, "device", "Device", "", base_attributes_top + [
            makeAttribute("params", "Parameters", "A set of device parameters", self.TYPE_DICTIONARY, {}),
            ] + base_attributes_bottom)

        self.addEntityClass(4, "device_type", "Device Type", "", base_attributes_top + [
            makeAttribute("params", "Parameters", "A set of device type parameters", self.TYPE_DICTIONARY, {"PSy" : "BR"}),
            makeAttribute("template", "Template", "Template dir name to use for generating IOC's config", self.TYPE_STRING, ""),
            ] + base_attributes_bottom)

        self.addEntityClass(5, "channel", "Channel", "", base_attributes_top + [
            makeAttribute("default_value", "Default Value", "Default value of the channel", self.TYPE_DOUBLE, 0.0),
            ] + base_attributes_bottom)

        self.addEntityClass(6, "link", "Link", "", base_attributes_top + [
            ] + base_attributes_bottom)

        # Tiny class without base attributes
        self.addEntityClass(7, "connection", "Connection", "", [])

        self.addEntityClass(8, "connection_type", "Connection Type", "", base_attributes_top + [
            ] + base_attributes_bottom)

        # Tiny class without base attributes
        self.addEntityClass(9, "connection_type_part", "Connection Type Part", "", [])

        self.addEntityClass(10, "channel_type", "Channel Type", "", base_attributes_top + [
            makeAttribute("type", "Type", "Type of the Channel", self.TYPE_STRING, ""),
            ] + base_attributes_bottom)




        ############ EDGES #############
        # addRelationClass(cid, name, readable_name, description, attributes_list, allowed_relations)
        #self.addRelationClass(101, "physical", "Physical", "Physical connections", [
        #    ], [
        #    makeAllowedRelation(
        #        {"cname":"server", "multiplicity" : self.MUL_ONE},
        #        {"cname":"ioc", "multiplicity" : self.MUL_ZERO_OR_MORE}
        #    ),
        #    makeAllowedRelation(
        #        {"cname":"ioc", "multiplicity" : self.MUL_ONE},
        #        {"cname":"device", "multiplicity" : self.MUL_ZERO_OR_MORE}
        #    ),
        #    ])

        self.addRelationClass(102, "type", "Types", "Typification links", [
        ], [
            makeAllowedRelation(
                {"cname":"device", "multiplicity" : self.MUL_ZERO_OR_MORE},
                {"cname":"device_type", "multiplicity" : self.MUL_ONE}
            ),
            makeAllowedRelation(
                {"cname":"connection", "multiplicity" : self.MUL_ZERO_OR_MORE},
                {"cname":"connection_type", "multiplicity" : self.MUL_ONE}
            ),
            makeAllowedRelation(
                {"cname":"channel", "multiplicity" : self.MUL_ZERO_OR_MORE},
                {"cname":"channel_type", "multiplicity" : self.MUL_ONE}
            ),
            ])

        self.addRelationClass(103, "composition", "Compositions", "Compositions links", [
        ], [
            makeAllowedRelation(
                {"cname":"device_type", "multiplicity" : self.MUL_ONE},
                {"cname":"link", "multiplicity" : self.MUL_ZERO_OR_MORE}
            ),
            makeAllowedRelation(
                {"cname":"device_type", "multiplicity" : self.MUL_ONE},
                {"cname":"channel", "multiplicity" : self.MUL_ZERO_OR_MORE}
            ),
            # ConnectionT-ConnectionTP
            makeAllowedRelation(
                {"cname":"connection_type", "multiplicity" : self.MUL_ZERO_OR_ONE},
                {"cname":"connection_type_part", "multiplicity" : self.MUL_ONE}
            ),
            ])

        self.addRelationClass(104, "logical", "Logical", "Logical connections", [
        ], [
            makeAllowedRelation(
                {"cname":"server", "multiplicity" : self.MUL_ONE},
                {"cname":"ioc", "multiplicity" : self.MUL_ZERO_OR_MORE}
            ),
            makeAllowedRelation(
                {"cname":"ioc", "multiplicity" : self.MUL_ONE},
                {"cname":"device", "multiplicity" : self.MUL_ZERO_OR_MORE}
            ),

            # Dev-Connection-Dev
            makeAllowedRelation(
                {"cname":"device", "multiplicity" : self.MUL_ONE},
                {"cname":"connection", "multiplicity" : self.MUL_ZERO_OR_MORE}
            ),
            makeAllowedRelation(
                {"cname":"connection", "multiplicity" : self.MUL_ZERO_OR_ONE},
                {"cname":"device", "multiplicity" : self.MUL_ONE}
            ),

            # DevT-ConnectionT-DevT
            makeAllowedRelation(
                {"cname":"device_type", "multiplicity" : self.MUL_ONE},
                {"cname":"connection_type", "multiplicity" : self.MUL_ZERO_OR_MORE}
            ),
            makeAllowedRelation(
                {"cname":"connection_type", "multiplicity" : self.MUL_ZERO_OR_ONE},
                {"cname":"device_type", "multiplicity" : self.MUL_ONE}
            ),

            # TODO: make it     L -> CTP -> Ch
            # Link-ConnectionTP-channel
            makeAllowedRelation(
                {"cname":"connection_type_part", "multiplicity" : self.MUL_ZERO_OR_MORE},
                {"cname":"link", "multiplicity" : self.MUL_ONE}
            ),
            makeAllowedRelation(
                {"cname":"connection_type_part", "multiplicity" : self.MUL_ZERO_OR_MORE},
                {"cname":"channel", "multiplicity" : self.MUL_ONE}
            ),
            ])

