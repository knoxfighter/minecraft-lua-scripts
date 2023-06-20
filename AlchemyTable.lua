function table_size(t)
    local count = 0
    for _ in pairs(t) do
        count = count + 1
    end
    return count
end

---@shape AlchemyTable
---@field inventory PeripheralInventory
---@field locked boolean

local alchemytableType = "bloodmagic:alchemytable"
local inputChestName = "immersiveengineering:woodencrate_8"
local outputChestName = "immersiveengineering:woodencrate_9"
local redstoneSide = "back"

---@type PeripheralInventory
local inputChest = peripheral.wrap(inputChestName)

---@type PeripheralInventory[]
local alchemytablesTemp = { peripheral.find(alchemytableType) }

---@type AlchemyTable[]
local alchemytables = {}

for _, alchemytable in pairs(alchemytablesTemp) do
    table.insert(alchemytables, { inventory = alchemytable, locked = false })
end

local function checkInputEmpty()
    return table_size(inputChest.list()) == 0
end

local function isAnyTableLocked()
    for _, alchemytable in pairs(alchemytables) do
        if alchemytable.locked then
            return true
        end
    end
    return false
end

while true do
    local rsIn = redstone.getAnalogInput(redstoneSide)
    if rsIn > 0 or isAnyTableLocked() then
        for k, alchemytable in pairs(alchemytables) do
            print("check table", k)

            -- check if items are in chest
            if not checkInputEmpty() and not alchemytable.locked then
                -- lock
                alchemytable.locked = true

                print("locked table", k)

                -- move items out of chest
                local targetSlot = 1
                for slot, item in pairs(inputChest.list()) do
                    for i = 1, item.count do
                        inputChest.pushItems(peripheral.getName(alchemytable.inventory), slot, 1, targetSlot)
                        targetSlot = targetSlot + 1
                    end
                end
            else
                -- check for output
                local item = alchemytable.inventory.getItemDetail(7)
                if item then
                    -- move item
                    alchemytable.inventory.pushItems(outputChestName, 7)

                    -- unlock
                    alchemytable.locked = false

                    print("unlocked table", k)
                end
            end
        end

        sleep(1)
    else
        os.pullEvent("redstone")
    end
end
