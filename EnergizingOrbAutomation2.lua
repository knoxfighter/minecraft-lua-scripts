require("Logger")

local redstoneSide = "front"
local redstoneOutput = "right"

local inputName = "quark:variant_chest_9"
local outputName = "minecraft:chest_1"
---@type string[]
local orbNames = {
    "powah:energizing_orb_0",
    "powah:energizing_orb_1",
}

---@type PeripheralInventory
local input = peripheral.wrap(inputName)

---@type PeripheralInventory
local output = peripheral.wrap(outputName)

---@type PeripheralInventory[]
local orbs = {
    peripheral.wrap("powah:energizing_orb_0"),
    peripheral.wrap("powah:energizing_orb_1"),
}

local function unlockCrafter()
	log("unlockCrafter")
    redstone.setOutput(redstoneOutput, true)
    sleep(0.3)
    redstone.setOutput(redstoneOutput, false)
    sleep(0.05)
end

unlockCrafter()

---@type table<number, boolean>
local inProgress = {}

while true do
    local active = false
    for orb, val in pairs(inProgress) do
        local text = "false"
        if val then
            active = true
            text = "true"
        end
        log("[" .. orb .. "] = " .. text)
    end
    local rsIn = redstone.getAnalogInput(redstoneSide)
    if rsIn > 0 or active then
        -- check for outputs
        for i, orb in ipairs(orbs) do
            local res = orb.getItemDetail(1)
            if res then
                log("output found: " .. i)
                orb.pushItems(outputName, 1)
                inProgress[i] = false
            end
        end

        -- check if any orb is empty
        local inputItems = input.list()
        for orbNum, orb in ipairs(orbs) do
            if not inProgress[orbNum] and #inputItems > 0 then
                -- move all items into the orb
                local targetSlot = 2
                for slot, item in pairs(inputItems) do
                    log("move " .. item.count .. " items")
                    for i = 1, item.count do
                        orb.pullItems(inputName, slot, 1, targetSlot)
                        targetSlot = targetSlot + 1
                    end
                end

                inProgress[orbNum] = true
                unlockCrafter()
            end
        end
    else
        log("waiting for next thing to do")
        log("--------------")
        os.pullEvent("redstone")
        log("yai, something to do")
    end
end
