local inputSide = "left"
local throughputSide = "right"
local redstoneSide = "front"
local arrowSide = "back"

local input = peripheral.wrap(inputSide)
local throughput = peripheral.wrap(throughputSide)

while true do
	local rsIn = redstone.getAnalogInput(redstoneSide)
	if rsIn > 0 then
		for slot, item in pairs(input.list()) do
			input.pushItems(peripheral.getName(throughput), slot)
		end
		
		sleep(0.5)
		
		redstone.setAnalogOutput(arrowSide, 15)
		
		sleep(1)
		
		redstone.setAnalogOutput(arrowSide, 0)
		
		sleep(2)
	else
		os.pullEvent("redstone")
	end
end
