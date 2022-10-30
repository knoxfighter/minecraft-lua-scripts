local inputChestName = "right"
local clayOutputName = "top"
local clickOutputName = "bottom"
local redstoneSide = "back"

---@type PeripheralInventory
local inputChest = peripheral.wrap(inputChestName)
---@type PeripheralInventory
local clayOutput = peripheral.wrap(clayOutputName)
---@type PeripheralInventory
local clickOutput = peripheral.wrap(clickOutputName)

---@return number,number
function getItems()
    local first = 0
    for slot, item in pairs(inputChest.list()) do
        if first == 0 then
            first = slot
        else
            return first, slot
        end
    end
end

while true do
    local rsIn = redstone.getAnalogInput(redstoneSide)
    if rsIn > 0 then
        -- get first and second item
        local first, second = getItems()

        print(first .. " -- " .. second)

        -- move first item (clay) into output
        inputChest.pushItems(clayOutputName, first, 1)

        -- move second item into router
        --inputChest.pushItems(peripheral.getName(clickOutput), second, 1)
        clickOutput.pullItems(inputChestName, second, 1)

        sleep(30)
    else
        os.pullEvent("redstone")
    end
end
