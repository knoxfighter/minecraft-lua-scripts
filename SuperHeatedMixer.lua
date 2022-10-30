local mixerSide = "right"
local outputSide = "back"
local requestSide = "left"

---@alias HeatState 0 | 1
HeatState = {
    Cold = 0,
    Heated = 1
}

local status
local lastChangedOutput = false

while true do
    if redstone.getAnalogInput(requestSide) > 0 then
        if status == Cold then
            redstone.setOutput(outputSide, true)
            status = Heated
            lastChangedOutput = true
        end
    end

    if redstone.getInput(mixerSide) then
        if lastChangedOutput then
            redstone.setOutput(outputSide, false)
            lastChangedOutput = false
        else
            status = Cold
        end
    end

    os.pullEvent("redstone")
end
