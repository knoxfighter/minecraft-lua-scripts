local pedestalType = "ars_nouveau:arcane_pedestal"
local apparatusType = "ars_nouveau:enchanting_apparatus"

local inputChestName = "minecraft:chest_4"
local outputChestName = "minecraft:chest_3"
local redstoneSide = "back"

---@type PeripheralInventory[]
local pedestals = {peripheral.find(pedestalType)}

---@type PeripheralInventory
local apparatus = peripheral.find(apparatusType)
---@type PeripheralInventory
local inputChest = peripheral.wrap(inputChestName)
---@type PeripheralInventory
local outputChest = peripheral.wrap(outputChestName)

---define recipes
---key is the main ingredient (placed on the apparatus)
---value is an array for the outer pedestals (from 1 (top-left) to 8 (bottom-right))
---@type table<string, table<number, string> >
local recipes = {
    ["ars_nouveau:wixie_shards"] = {
        [1] = "eidolon:arcane_gold_nugget",
        [2] = "ars_nouveau:glyph_craft",
        [3] = "eidolon:arcane_gold_nugget",
        [4] = "architects_palette:twisted_sapling",
        [5] = "minecraft:brewing_stand",
        [6] = "eidolon:arcane_gold_nugget",
        [7] = "thermal:electrum_coin",
        [8] = "eidolon:arcane_gold_nugget"
    },
    ["pedestals:coin/default"] = {
        [1] = "botania:pixie_dust",
        [2] = "minecraft:piston",
        [3] = "botania:pixie_dust",
        [4] = "naturesaura:token_joy",
        [5] = "botania:rune_sloth",
        [6] = "botania:pixie_dust",
        [7] = "ars_nouveau:glyph_pickup",
        [8] = "botania:pixie_dust"
    },
    ["botania:terrasteel_ingot"] = {
        [1] = "botania:life_essence",
        [2] = "atum:seth_godshard",
        [3] = "botania:life_essence",
        [4] = "atum:seth_godshard",
        [5] = "atum:seth_godshard",
        [6] = "botania:life_essence",
        [7] = "atum:seth_godshard",
        [8] = "botania:life_essence"
    },
    ["botania:mana_diamond"] = {
        [1] = "botania:pixie_dust",
        [2] = "integratedterminals:chorus_glass",
        [3] = "botania:pixie_dust",
        [4] = "naturesaura:token_fear",
        [5] = "botania:rune_mana",
        [6] = "botania:pixie_dust",
        [7] = "integratedterminals:chorus_glass",
        [8] = "botania:pixie_dust"
    },
    ["emendatusenigmatica:sulfur_dust"] = {
        [1] = "emendatusenigmatica:silver_dust",
        [2] = "emendatusenigmatica:silver_dust",
        [3] = "emendatusenigmatica:silver_dust",
        [4] = "emendatusenigmatica:silver_dust",
    },
	["occultism:wormhole_frame"] = {
		[1] = "atum:nebu_drop",
		[2] = "atum:nebu_drop",
		[3] = "atum:nebu_drop",
		[4] = "atum:nebu_drop",
		[5] = "naturesaura:upright_on_belt",
		[6] = "naturesaura:upright_on_belt",
		[7] = "naturesaura:upright_on_belt",
		[8] = "naturesaura:upright_on_belt",
	},
	["occultism:otherstone_frame"] = {
		[1] = "atum:nebu_drop",
		[2] = "atum:nebu_drop",
		[3] = "atum:nebu_drop",
		[4] = "atum:nebu_drop",
		[5] = "naturesaura:aura_bottle",
		[6] = "naturesaura:aura_bottle",
		[7] = "naturesaura:aura_bottle",
		[8] = "naturesaura:aura_bottle",
	},
	["botania:livingwood"] = {
		[1] = "bloodmagic:blankslate",
		[2] = "bloodmagic:blankslate",
		[3] = "bloodmagic:blankslate",
		[4] = "bloodmagic:blankslate",
		[5] = "bloodmagic:blankslate",
		[6] = "bloodmagic:blankslate",
		[7] = "eidolon:ender_calx",
		[8] = "eidolon:ender_calx",
	},
	["atum:atem_godshard"] = {
		[1] = "betterendforge:ender_shard",
		[2] = "betterendforge:ender_shard",
		[3] = "betterendforge:ender_shard",
		[4] = "betterendforge:ender_shard",
		[5] = "betterendforge:crystal_shards",
		[6] = "betterendforge:crystal_shards",
		[7] = "betterendforge:crystal_shards",
		[8] = "betterendforge:crystal_shards",
	}
}
---@type string[]
--[[local centerItems = {
	"ars_nouveau:wixie_shards",
	"pedestals:coin/default",
	"botania:terrasteel_ingot",
	"botania:mana_diamond",
	"emendatusenigmatica:sulfur_dust",
	"occultism:wormhole_frame",
	"occultism:otherstone_frame",
	"botania:livingwood",
	"atum:atem_godshard",
	"betterendforge:eternal_crystal",
	"minecraft:conduit",
	"minecraft:netherite_ingot",
	"betterendforge:silk_fiber",
	"farmersdelight:cooking_pot",
	"betterendforge:terminite_boots",
	"betterendforge:terminite_chestplate",
	"betterendforge:terminite_leggings",
	"betterendforge:terminite_helmet",
	"atum:relic_non_dirty/ring"
}]]--
local centerItems = {
	"naturesaura:aura_bottle"
}

---@param item string
---@return boolean, table<number, string>
function findRecipeForItem(item)
    for k, recipe in pairs(recipes) do
        if k == item then
            return true, recipe
        end
    end

    return false, nil
end

---@param chest PeripheralInventory
---@return number, string, table<number, string>
function findRecipeInChest(chest)
    for slot, item in pairs(chest.list()) do
        local found, recipe = findRecipeForItem(item.name)
        if found then
            return slot, item.name, recipe
        end
    end
end

---@param chest PeripheralInventory
---@param item string
---@return number the slot where the item is in
function findItemInChest(chest, item)
    for slot, it in pairs(chest.list()) do
        if it.name == item then
            return slot
        end
    end
end

---@generic T
---@param tab T[]
---@param val T
local function contains(tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end

    return false
end

local function itemHasTagOrName(item)
	if contains(centerItems, item.name) then
		return true
	end
	
	for tag, _ in pairs(item.tags) do
		if contains(centerItems, tag) then
			return true
		end
	end
	
	return false
end

function findCenterItemInChest()
	for slot, item in pairs(inputChest.list()) do
		local complexItem = inputChest.getItemDetail(slot)
        if itemHasTagOrName(complexItem) and item.count == 1 then
            return slot
        end
    end
end

while true do
    local rsIn = redstone.getAnalogInput(redstoneSide)
    if rsIn > 0 then
        -- TODO: check if there is manual crafting in place

        -- get recipe
        local centerSlot = findCenterItemInChest()
		if centerSlot == nil then
			error("centerSlot item not found!")
		end

        -- put all other items into spots
		local j = 1
		for slot, item in pairs(inputChest.list()) do
			if slot ~= centerSlot then
				for i=1,item.count do
					if inputChest.pushItems(peripheral.getName(pedestals[j]), slot, 1) == 0 then
						error("item in slot '" .. slot .. "' wasn't moved into pedestal '" .. i .. "'")
					end
					j = j + 1
				end
			end
		end

        -- put last item
        if inputChest.pushItems(peripheral.getName(apparatus), centerSlot, 1) == 0 then
            error("item in slot '" .. centerSlot .. "' wasn't moved into the apparatus")
        end

        -- wait for output item and move it out
        while true do
            local item = apparatus.getItemDetail(1)
            if item ~= nil and item.name ~= itemName then
				print("move item out of apparatus")
                local num = outputChest.pullItems(peripheral.getName(apparatus), 1)
				print("amount of items moved out: ", num)
                break
            end
        end
    else
        print("Waiting for something to do")
        print("--------------------")
        os.pullEvent("redstone")
        print("yai, something to do")
    end
end
