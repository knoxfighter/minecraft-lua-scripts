local inputSide = "left"
local workSide = "back"
local outputSide = "top"
local redstoneSide = "front"

local input = peripheral.wrap(inputSide)
local output = peripheral.wrap(outputSide)
local work = peripheral.wrap(workSide)

while true do
	local rsIn = redstone.getAnalogInput(redstoneSide)
	if rsIn > 0 then
		print("move all items into orb")
		local currentSlot = 2
		for slot, item in pairs(input.list()) do
			for i=1,item.count do
				input.pushItems(peripheral.getName(work), slot, 1, currentSlot)
				currentSlot = currentSlot + 1
			end
		end
		
		print("wait for output")
		while true do
			local res = work.getItemDetail(1)
			if res then
				print("output found")
				work.pushItems(peripheral.getName(output), 1)
				break
			end
		end
	else
		print("waiting for next thing to do")
		os.pullEvent("redstone")
		print("yai, something to do")
	end
end