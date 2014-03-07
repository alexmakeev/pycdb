from graph_db.configuration import Configuration, makeAttribute, makeAllowedRelation

class CXV2Config(Configuration):
    def __init__(self):
        Configuration.__init__(self)



        ############ NODES #############
        base_attributes_top = [
            makeAttribute("readable_name", "Readable Name", "For rapid people understanding", self.TYPE_STRING, ""),
            makeAttribute("name", "Unique API Name", "For automated scripts, should be permanent", self.TYPE_STRING, ""),
            makeAttribute("description", "Description", "Additional information and comments", self.TYPE_STRING, "No description"),
            ]
        base_attributes_bottom = [
            makeAttribute("note", "Note", "For people, for example, some errors history notes", self.TYPE_TEXT, ""),
            ]



        # addEntityClass(cid, name, readable_name, description, attributes_list)
        self.addEntityClass(1, "bus", "Bus", "", base_attributes_top + [
            ] + base_attributes_bottom)

        self.addEntityClass(2, "bus_controller", "Bus Controller", "", base_attributes_top + [
            ] + base_attributes_bottom)

        self.addEntityClass(3, "bus_controller_type", "Bus Controller Type", "", base_attributes_top + [
            makeAttribute("config_format", "Configuration String Format",
                          "Format of the configuration string to be used by driver", self.TYPE_STRING, ""),
            ] + base_attributes_bottom)

        self.addEntityClass(4, "bus_type", "Bus Type", "", base_attributes_top + [
            ] + base_attributes_bottom)

        self.addEntityClass(5, "device", "Device", "", base_attributes_top + [
            makeAttribute("addr", "Address", "Address of the Device at the Bus", self.TYPE_STRING, ""),
            makeAttribute("init_str", "Initialize String", "String to initialize the Device by the driver", self.TYPE_STRING, ""),
            makeAttribute("sequence_number", "Sequence Number", "Sequence number for sorting devices during export", self.TYPE_INTEGER, ""),
            ] + base_attributes_bottom)

        self.addEntityClass(6, "device_channel", "Device Channel", "", base_attributes_top + [
            makeAttribute("group_num", "Group Number", "Address of Channel group at Device channel groups (by its Device Type)",
                          self.TYPE_INTEGER, ""),
            makeAttribute("needs_init", "Needs Initialization", "Is the initialization required by the channel or not", self.TYPE_INTEGER, ""),
            makeAttribute("init_value", "Initialization Value", "The Value to be used if initialization is needed", self.TYPE_TEXT, ""),
            ] + base_attributes_bottom)


        self.addEntityClass(7, "device_channel_group", "Device Channel Group", "", base_attributes_top + [
            makeAttribute("is_writable", "Writable", "If channels of the group is writable", self.TYPE_INTEGER, ""),
            makeAttribute("quantity", "Quantity", "The number of channels in the group", self.TYPE_INTEGER, ""),
            makeAttribute("group_number", "Group Number", "The priority for group sorting", self.TYPE_INTEGER, ""),
            ] + base_attributes_bottom)

        self.addEntityClass(8, "device_type", "Device Type", "", base_attributes_top + [
            makeAttribute("bigc_info", "Big Channel Info", "Big channel information [should be temporal]", self.TYPE_TEXT, ""),
            ] + base_attributes_bottom)

        self.addEntityClass(9, "server", "Server", "", base_attributes_top + [
            ] + base_attributes_bottom)


        
	    ############ EDGES #############
        # addRelationClass(cid, name, readable_name, description, attributes_list, allowed_relations)
        self.addRelationClass(101, "physical", "Physical", "Physical connections", [
            ], [
            makeAllowedRelation(
                {"cname":"server", "multiplicity" : self.MUL_ONE},
                {"cname":"bus_controller", "multiplicity" : self.MUL_ZERO_OR_MORE}
            ),
            makeAllowedRelation(
                {"cname":"bus_controller", "multiplicity" : self.MUL_ONE},
                {"cname":"bus", "multiplicity" : self.MUL_ZERO_OR_MORE}
            ),
#            makeAllowedRelation(
#                {"cname":"bus", "multiplicity" : self.MUL_ONE},
#                {"cname":"bus_device", "multiplicity" : self.MUL_ZERO_OR_MORE}
#            ),
            ])

        self.addRelationClass(102, "type", "Types", "Typification links", [
        ], [
            makeAllowedRelation(
                {"cname":"bus", "multiplicity" : self.MUL_ONE},
                {"cname":"bus_type", "multiplicity" : self.MUL_ZERO_OR_MORE}
            ),
            makeAllowedRelation(
                {"cname":"bus_controller", "multiplicity" : self.MUL_ONE},
                {"cname":"bus_controller_type", "multiplicity" : self.MUL_ZERO_OR_MORE}
            ),
            makeAllowedRelation(
                {"cname":"device", "multiplicity" : self.MUL_ONE},
                {"cname":"device_type", "multiplicity" : self.MUL_ZERO_OR_MORE}
            ),
            ])


        self.addRelationClass(103, "logical", "Logical", " Logical links", [
        ], [
            makeAllowedRelation(
                {"cname":"device", "multiplicity" : self.MUL_ONE},
                {"cname":"device_channel", "multiplicity" : self.MUL_ZERO_OR_MORE}
            ),
            makeAllowedRelation(
                {"cname":"device_type", "multiplicity" : self.MUL_ONE},
                {"cname":"device_channel_group", "multiplicity" : self.MUL_ZERO_OR_MORE}
            ),
            ])

        self.addRelationClass(104, "responsibilities", "Responsibilities", "Responsibilities", [
        ], [
            # Dev-Connection-Dev
            makeAllowedRelation(
                {"cname":"server", "multiplicity" : self.MUL_ZERO_OR_MORE},
                {"cname":"device", "multiplicity" : self.MUL_ONE}
            ),

            ])


