local batterySide = "right"
local redstoneSide = "left"

local battery = peripheral.wrap(batterySide)

while true do
	local batteryPerc = battery.getEnergyFilledPercentage()
	
	print("Aktueller Füllstand: " .. batteryPerc*100)
	
	if batteryPerc < 0.3 then
		redstone.setAnalogOutput(redstoneSide, 15)
	end
	if batteryPerc > 0.8 then
		redstone.setAnalogOutput(redstoneSide, 0)
	end
	
	sleep(300)
end
