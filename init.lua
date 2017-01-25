-- Industrial lights mod by DanDuncombe
-- License: CC-By-Sa

ilights = {}

-- Boilerplate to support localized strings if intllib mod is installed.
local S
if minetest.get_modpath("intllib") then
	S = intllib.Getter()
else
	S = function(s) return s end
end

if minetest.get_modpath("unified_inventory") or not minetest.setting_getbool("creative_mode") then
	ilights.expect_infinite_stacks = false
else
	ilights.expect_infinite_stacks = true
end

ilights.modpath = minetest.get_modpath("ilights")

-- The important stuff!

ilights.types = {
	{"white",		"White",		0xffffffff },
	{"grey",		"Grey",			0xffa0a0a0 },
	{"black",		"Black",		0xff000000 },
	{"red",			"Red",			0xffff0000 },
	{"yellow",		"Yellow",		0xffffff00 },
	{"green",		"Green",		0xff00ff00 },
	{"cyan",		"Cyan",			0xff00ffff },
	{"blue",		"Blue",			0xff0000ff },
	{"magenta",		"Magenta",		0xffff00ff },
	{"orange",		"Orange",		0xffff8000 },
	{"violet",		"Violet",		0xff8000ff },
	{"dark_grey",	"Dark Grey",	0xff404040 },
	{"dark_green",	"Dark Green",	0xff008000 },
	{"pink",		"Pink",			0xffffb0ff },
	{"brown",		"Brown",		0xff604000 },
}

local lamp_cbox = {
	type = "fixed",
	fixed = { -11/32, -8/16, -11/32, 11/32, 4/16, 11/32 }
}

for _, row in ipairs(ilights.types) do
	local name =     row[1]
	local desc =     row[2]
	local colordef = row[3]

	-- Node Definition

	minetest.register_node("ilights:light_"..name, {
		description = desc.." Industrial Light",
	    drawtype = "mesh",
		mesh = "ilights_lamp.obj",
		tiles = {
			"ilights_lamp_base.png",
			"ilights_lamp_cage.png",
			{ name = "ilights_lamp_bulb.png", color = colordef },
			"ilights_lamp_bulb_base.png",
			{ name = "ilights_lamp_lens.png", color = colordef }
		},
		use_texture_alpha = true,
		groups = {cracky=3},
	    paramtype = "light",
	    paramtype2 = "facedir",
	    light_source = 14,
		selection_box = lamp_cbox,
		collision_box = lamp_cbox,
		on_place = minetest.rotate_node
	})

	if name then

		--Choose craft material
		minetest.register_craft({
			output = "ilights:light_"..name.." 3",
			recipe = {
				{ "",                     "default:steel_ingot",  "" },
				{ "dye:"..name,           "default:glass",        "dye:"..name },
				{ "default:steel_ingot",  "default:torch",        "default:steel_ingot" }
			},
		})

	end
end

