---@type string[]
local woodenStandNames = {
    "entangled:tile_0",
    "entangled:tile_1",
    "entangled:tile_2",
    "entangled:tile_3",
    "entangled:tile_4",
    "entangled:tile_5",
    "entangled:tile_6",
    "entangled:tile_7",
}
local drawerName = "immersiveengineering:woodencrate_2"
local inputChestName = "quark:variant_chest_4"
local redstoneSide = "back"

---@type PeripheralInventory
local inputChest = peripheral.wrap(inputChestName)

---@type PeripheralInventory
local drawer = peripheral.wrap(drawerName)

---@param item PeripheralInventoryComplexItem
---@return boolean
function isSapling(item)
    return item.tags["minecraft:saplings"]
end

while true do
    local rsIn = redstone.getAnalogInput(redstoneSide)
    if rsIn > 0 then
        print("yai, something to do")

        local nextStand = 1
        for slot, _ in pairs(inputChest.list()) do
            ---@type PeripheralInventoryComplexItem
            local item = inputChest.getItemDetail(slot)
            if isSapling(item) then
                inputChest.pushItems(drawerName, 1, 1)
            else
                for i = 1, item.count do
                    inputChest.pushItems(woodenStandNames[nextStand], slot, 1)
                    nextStand = nextStand + 1
                end
            end
        end
    else
        print("waiting for next thing to do")
        print("--------------")
        os.pullEvent("redstone")
    end
end
