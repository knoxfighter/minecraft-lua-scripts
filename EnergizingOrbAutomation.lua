local inputSide = "left"
local workSide = "back"
local outputSide = "top"
local redstoneSide = "front"
local redstoneOutput = "right"

---@type PeripheralInventory
local input = peripheral.wrap(inputSide)
---@type PeripheralInventory
local output = peripheral.wrap(outputSide)
---@type PeripheralInventory
local work = peripheral.wrap(workSide)

function unlockCrafter()
	redstone.setOutput(redstoneOutput, true)
	sleep(0.3)
	redstone.setOutput(redstoneOutput, false)
	sleep(0.3)
end

unlockCrafter()

while true do
	local rsIn = redstone.getAnalogInput(redstoneSide)
	if rsIn > 0 then
		-- move all items into the orb
		local targetSlot = 2
		for slot, item in pairs(input.list()) do
			print(item.count)
			for i = 1, item.count do
				print("move item from ", slot, " to ", targetSlot)
				input.pushItems(workSide, slot, 1, targetSlot)
				targetSlot = targetSlot + 1
			end
		end

		unlockCrafter()
		
		print("wait for output ...")
		while true do
			local res = work.getItemDetail(1)
			if res then
				print("output found")
				work.pushItems(outputSide, 1)
				break
			end
		end
	else
		print("waiting for next thing to do")
		print("--------------")
		os.pullEvent("redstone")
		print("yai, something to do")
	end
end
