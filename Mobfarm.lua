local tankSide = "right"
local redstoneSide = "left"

local tank = peripheral.wrap(tankSide)

while true do
	local fluid = tank.tanks()[1]
	
	if fluid.amount >= 1000000 then
		-- don't spawn
		redstone.setOutput(redstoneSide, false)
	else
		-- spawn
		redstone.setOutput(redstoneSide, true)
	end
	
	sleep(320) -- run all 5 minutes
end
