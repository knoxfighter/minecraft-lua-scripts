---@type string[]
local pedestalNames = {
    "ars_nouveau:arcane_pedestal_1",
    "ars_nouveau:arcane_pedestal_2",
    "ars_nouveau:arcane_pedestal_3",
    "ars_nouveau:arcane_pedestal_4",
    "ars_nouveau:arcane_pedestal_5",
    "ars_nouveau:arcane_pedestal_6",
    "ars_nouveau:arcane_pedestal_7",
    "ars_nouveau:arcane_pedestal_8"
}

local apparatusName = "ars_nouveau:enchanting_apparatus_1"
local inputChestName = "quark:variant_chest_3"
local outputChestName = "quark:variant_chest_2"
local redstoneSide = "front"

---@type PeripheralInventory[]
local pedestals = {}

for i, name in pairs(pedestalNames) do
    pedestals[i] = peripheral.wrap(name)
end

---@type PeripheralInventory
local apparatus = peripheral.wrap(apparatusName)
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
    ["botania:gaia_ingot"] = {
        [1] = "botania:life_essence",
        [2] = "atum:seth_godshard",
        [3] = "botania:life_essence",
        [4] = "atum:seth_godshard",
        [5] = "atum:seth_godshard",
        [6] = "botania:life_essence",
        [7] = "atum:seth_godshard",
        [8] = "botania:life_essence"
    }
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

while true do
    local rsIn = redstone.getAnalogInput(redstoneSide)
    if rsIn > 0 then
        -- TODO: check if there is manual crafting in place

        -- get recipe
        local slot, itemName, recipe = findRecipeInChest(inputChest)

        -- put items into spots
        for i, itemName in pairs(recipe) do
            local slot = findItemInChest(inputChest, itemName)
            if inputChest.pushItems(pedestalNames[i], slot, 1) == 0 then
                error("item in slot '" .. slot .. "' wasn't moved into pedestal '" .. i .. "'")
            end
        end

        -- put last item
        if inputChest.pushItems(apparatusName, slot, 1) == 0 then
            error("item in slot '" .. slot .. "' wasn't moved into the apparatus")
        end

        -- wait for output item and move it out
        while true do
            local item = apparatus.getItemDetail(1)
            if item ~= nil and item.name ~= itemName then
                outputChest.pullItems(apparatusName, 1, 1)
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
