local inputSide = "left"
local workSide = "back"
local outputSide = "top"
local redstoneSide = "front"

local input = peripheral.wrap(inputSide)
local output = peripheral.wrap(outputSide)
local work = peripheral.wrap(workSide)

local supportedRecipes = {
	{"undergarden:froststeel_block", "emendatusenigmatica:electrum_block"},
	{"ars_nouveau:blaze_fiber", "resourcefulbees:blaze_honeycomb"},
	{"botania:ender_eye_block", "powah:dielectric_casing", "pneumaticcraft:spawner_core"},
	{"emendatusenigmatica:dimensional_block", "minecraft:ender_pearl", "integrateddynamics:crystalized_chorus_lock"},
	{"atum:osiris_godshard", "emendatusenigmatica:uranium_dust"},
	{"ars_nouveau:wixie_charm", "refinedstorage:raw_advanced_processor"},
	{"astralsorcery:resonating_gem", "astralsorcery:stardust"},
	{"emendatusenigmatica:dimensional_block", "minecraft:diamond", "integrateddynamics:crystalized_menril_block"},
	{"rftoolsbase:machine_base", "powah:capacitor_blazing"},
	{"powah:crystal_blazing", "bloodmagic:weakbloodshard", "minecraft:nether_star"}
}

function getRecipe(item)
	for _, recipe in pairs(supportedRecipes) do
		for _, val in pairs(recipe) do
			if val == item.name then
				return recipe
			end
		end
	end
end

function contains(tab, val)
	for _, v in pairs(tab) do
		if v == val then
			return true
		end
	end
	return false
end

while true do
	local rsIn = redstone.getAnalogInput(redstoneSide)
	if rsIn > 0 then
		print("move all items into orb")
		local currentSlot = 2
		local recipe = nil
		for slot, item in pairs(input.list()) do
			if recipe == nil then
				recipe = getRecipe(item)
			end
			
			for i=1,item.count do
				if contains(recipe, item.name) then
					input.pushItems(peripheral.getName(work), slot, 1, currentSlot)
					currentSlot = currentSlot + 1
				end
			end
		end
		
		print("wait for output")
		while true do
			local res = work.getItemDetail(1)
			if res then
				print("output found")
				work.pushItems(peripheral.getName(output), 1)
				break
			end
		end
	else
		print("waiting for next thing to do")
		print("--------------")
		os.pullEvent("redstone")
		print("yai, something to do")
	end
end