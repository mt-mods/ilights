local light = {}

light.types = {
	{"white",      "White"},
	{"grey",       "Grey"},
	{"black",      "Black"},
	{"red",        "Red"},
	{"yellow",     "Yellow"},
	{"green",      "Green"},
	{"cyan",       "Cyan"},
	{"blue",       "Blue"},
	{"magenta",    "Magenta"},
	{"orange",     "Orange"},
	{"violet",     "Violet"},
	{"dark_grey",  "Dark Grey"},
	{"dark_green", "Dark Green"},
	{"pink", "Pink", "pink"},
	{"brown", "Brown", "brown"},
}
for _, row in ipairs(light.types) do
	local name = row[1]
	local desc = row[2]
	-- Node Definition
	minetest.register_node("ilights:light_"..name, {
	    drawtype = "nodebox",
		description = desc.." Industrial Light",
		tiles = {"ilight_"..name.."_top.png",
		         "ilight_base.png",
		         "ilight_"..name.."_side.png"},
		groups = {cracky=3},
	    paramtype = "light",
	    paramtype2 = "facedir",
	    light_source = 15,
	    node_box = {
		    type = "fixed",
		    fixed = {
			    {-4/16,-7/16,-4/16,4/16,3/16,4/16}, --Bulb
			    {-6/16,-8/16,-6/16,6/16,-7/16,6/16}, --Base
			    {-3/16,-7/16,-5/16,-2/16,4/16,5/16}, --Wire
			    {2/16,-7/16,-5/16,3/16,4/16,5/16}, --Wire
			    {-5/16,-7/16,-3/16,5/16,4/16,-2/16}, --Wire
			    {5/16,-7/16,2/16,-5/16,4/16,3/16}, --Wire
			    {-5/16,0/16,-5/16,5/16,1/16,5/16}, --Side Wire
			    {-5/16,-5/16,-5/16,5/16,-4/16,5/16}, --Side Wire
		    },
	    },
	})
	if name then
		--Choose craft material
		minetest.register_craft({
			output = "ilights:light_"..name.." 2",
			recipe = {
			{"dye:"..name},
			{"default:torch"} },
		})
	end
end
