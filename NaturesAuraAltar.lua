local redstoneSide = "back"
local inputSide = "left"
local altarSide = "right"
local outputSide = "top"

---@type PeripheralInventory
local input = peripheral.wrap(inputSide)
---@type PeripheralInventory
local altar = peripheral.wrap(altarSide)

while true do
    local rsIn = redstone.getAnalogInput(redstoneSide)
    if rsIn > 0 then
        -- get first item in chest
        for slot, item in pairs(input.list()) do
            print("process next item")
            -- save item name
            local savedName = item.name

            -- move item
            altar.pullItems(inputSide, slot, 1)

            -- wait for item to be changed
            print("wait for output ...")
            while true do
                local newItem = altar.getItemDetail(1)
                if newItem.name ~= savedName then
                    -- move item into output
                    print("output found")
                    altar.pushItems(outputSide, 1)
                    break
                end
            end

            break
        end
    else
        print("Waiting for something to do")
        print("--------------------")
        os.pullEvent("redstone")
        print("yai, something to do")
    end
end
