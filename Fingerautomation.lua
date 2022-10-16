local inputSide = "back"
local throughputSide = "right"
local outputSide = "top"
local redstoneSide = "left"

local input = peripheral.wrap(inputSide)
local output = peripheral.wrap(outputSide)
local throughput = peripheral.wrap(throughputSide)

while true do
	local rsIn = redstone.getAnalogInput(redstoneSide)
	if rsIn > 0 then
		for slot, item in pairs(input.list()) do
			if item.name == "kubejs:partial_building_materials" then
				input.pushItems(peripheral.getName(throughput), slot)
			else
				input.pushItems(peripheral.getName(output), slot)
			end
		end
	else
		os.pullEvent("redstone")
	end
end
