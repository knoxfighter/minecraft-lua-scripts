-- redstone colour codes:
-- orange: input chest
-- yellow: output chest
local redstoneName = "top"

local inputName = "immersiveengineering:woodencrate_4"

---@type string[]
local abraItems = {
    "atum:godshards",
    "atum:linen_bandage",
    "forge:heads",
    "atum:nebu_ingot",
    "atum:golden_date_enchanted",
}
local abraMiddleItem = "occultism:book_of_binding_bound_afrit"
---@type string[]
local abraBowls = {
    "occultism:sacrificial_bowl_36",
    "occultism:sacrificial_bowl_37",
    "occultism:sacrificial_bowl_38",
    "occultism:sacrificial_bowl_39",
    "occultism:sacrificial_bowl_40",
    "occultism:sacrificial_bowl_41",
    "occultism:sacrificial_bowl_42",
    "occultism:sacrificial_bowl_43",
    "occultism:sacrificial_bowl_44",
    "occultism:sacrificial_bowl_45",
    "occultism:sacrificial_bowl_46",
    "occultism:sacrificial_bowl_47",
}
local abraMiddleBowl = "entangled:tile_9"

---@type string[]
local strigeorItems = {
    "botania:gaia_ingot",
    "botania:gaia_spreader",
    "mythicbotany:helheim_rune",
    "mythicbotany:niflheim_rune",
    "mythicbotany:joetunheim_rune",
    "mythicbotany:vanaheim_rune",
    "mythicbotany:alfheim_rune",
    "mythicbotany:asgard_rune",
    "mythicbotany:muspelheim_rune",
    "mythicbotany:nidavellir_rune",
}
local strigeorMiddleItem = "mythicbotany:midgard_rune"
---@type string[]
local strigeorBowls = {
    "occultism:sacrificial_bowl_48",
    "occultism:sacrificial_bowl_49",
    "occultism:sacrificial_bowl_50",
    "occultism:sacrificial_bowl_51",
    "occultism:sacrificial_bowl_52",
    "occultism:sacrificial_bowl_53",
    "occultism:sacrificial_bowl_54",
    "occultism:sacrificial_bowl_55",
    "occultism:sacrificial_bowl_56",
    "occultism:sacrificial_bowl_57",
    "occultism:sacrificial_bowl_58",
    "occultism:sacrificial_bowl_59",
}
local strigeorMiddleBowl = "entangled:tile_11"

local tankName = "industrialforegoing:common_black_hole_tank_1"
---@type PeripheralFluidStorage
local tank = peripheral.wrap(tankName)
local spawnerName = "entangled:tile_10"

---@type PeripheralInventory
local input = peripheral.wrap(inputName)

---@param name string
---@param list string[]
---@return boolean
local function checkItemTag(name, list)
    for _, expected in ipairs(list) do
        if expected == name then
            return true
        end
    end

    return false
end

---@param item PeripheralInventoryComplexItem
---@param list string[]
---@return boolean
local function checkItem(item, list)
    if checkItemTag(item.name, list) then
        return true
    end

    for tag, _ in pairs(item.tags) do
        if checkItemTag(tag, list) then
            return true
        end
    end

    return false
end

---@param slots number[]
---@param bowls string[]
local function putItemsIntoBowls(slots, bowls)
    local j = 1
    for _, slot in ipairs(slots) do
        ---@type PeripheralInventoryComplexItem
        local inputItem = input.getItemDetail(slot)
        for i = 1, inputItem.count do
            input.pushItems(bowls[j], slot, 1)
            j = j + 1
        end
    end
end

while true do
    local rsIn = redstone.testBundledInput(redstoneName, colours.orange)
    if rsIn then
        print("yai, something to do")

        -- sort all items by slot
        ---@type number[]
        local abraSlots = {}
        ---@type number
        local abraMiddleSlot
        ---@type number[]
        local strigeorSlots = {}
        ---@type number
        local strigeorMiddleSlot

        for i = 1, input.size() do
            local itemDetail = input.getItemDetail(i)
            if itemDetail then
                if checkItem(itemDetail, abraItems) then
                    table.insert(abraSlots, i)
                elseif checkItem(itemDetail, { abraMiddleItem }) then
                    abraMiddleSlot = i
                elseif checkItem(itemDetail, strigeorItems) then
                    table.insert(strigeorSlots, i)
                elseif checkItem(itemDetail, { strigeorMiddleItem }) then
                    strigeorMiddleSlot = i
                end
            end
        end
        -- pharaoh ritual
            -- place items into outer bowls
        print("place " .. #abraSlots .. " items into " .. #abraBowls .. " bowls.")
        putItemsIntoBowls(abraSlots, abraBowls)

            -- place item into modular router
        input.pushItems(abraMiddleBowl, abraMiddleSlot, 1)

            -- spawn villager
        tank.pushFluid(spawnerName, 240)

        -- mana collector ritual
            -- place items into outer bowls
        putItemsIntoBowls(strigeorSlots, strigeorBowls)

            -- place item into modular router
        input.pushItems(strigeorMiddleBowl, strigeorMiddleSlot, 1)

        sleep(10)
    else
        print("waiting for next thing to do")
        print("--------------")
        os.pullEvent("redstone")
    end
end
