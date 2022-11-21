local altarName = "top"
local outputName = "right"
local inputName = "left"
local redstoneSide = "back"

---@type PeripheralInventory
local input = peripheral.wrap(inputName)

---@type PeripheralInventory
local output = peripheral.wrap(outputName)

---@type PeripheralInventory
local altar = peripheral.wrap(altarName)

---@return number
function getFirstItem()
    for slot, item in pairs(input.list()) do
        return slot
    end
end

while true do
    local rsIn = redstone.getAnalogInput(redstoneSide)
    if rsIn > 0 then
        print("yai, something to do")

        -- move orb from altar into outputChest
        altar.pushItems(outputName, 1, 1, 27)

        -- move item to craft in (save it)

        local slot = getFirstItem()
        local placedItemName = input.getItemDetail(slot).name
        input.pushItems(altarName, slot, 1, 1)

        -- wait for item to be transformed
        while true do
            local item = altar.getItemDetail(1)
            if item.name ~= placedItemName then
                break
            end
        end

        -- move transformed item out
        altar.pushItems(outputName, 1)

        -- move orb back into the altar
        output.pushItems(altarName, 27)
    else
        print("waiting for next thing to do")
        print("--------------")
        os.pullEvent("redstone")
    end
end
