local tubeSide = "right"
local redstoneSide = "left"
local maxPressure = 4.91

local tube = peripheral.wrap(tubeSide)
local restoneSide = peripheral.wrap(redstoneSide)

while true do
	if tube.getPressure() >= maxPressure then
		redstone.setAnalogOutput(redstoneSide, 15)
	else
		redstone.setAnalogOutput(redstoneSide, 0)
	end
	
	sleep(1)
end
