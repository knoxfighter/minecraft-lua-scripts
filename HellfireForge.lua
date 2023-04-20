-- Hellfire forge slots:
-- 1 - top-left
-- 2 - top-right
-- 3 - bottom-left
-- 4 - bottom-right
-- 5 - Tartaric Gem
-- 6 - middle (output)

local inputSide = "quark:variant_chest_6"
local workSide = "bloodmagic:soulforge_0"
local outputSide = "abnormals_core:chest_1"
local redstoneSide = "back"
local redstoneOutput = "left"
local outputSlot = 6

---@type PeripheralInventory
local input = peripheral.wrap(inputSide)
---@type PeripheralInventory
local output = peripheral.wrap(outputSide)
---@type PeripheralInventory
local work = peripheral.wrap(workSide)

function pulse( _nSide,  _nTime )
  redstone.setOutput( _nSide, true)
  sleep(_nTime)
  redstone.setOutput( _nSide, false)
end


while true do
	local rsIn = redstone.getAnalogInput(redstoneSide)
	if rsIn > 0 then
		-- move all items into the orb
		local targetSlot = 1
		for slot, item in pairs(input.list()) do
			print(item.count)
			for i = 1, item.count do
				print("move item from ", slot, " to ", targetSlot)
				input.pushItems(workSide, slot, 1, targetSlot)
				targetSlot = targetSlot + 1
			end
		end
		
		print("wait for output ...")
		while true do
			local res = work.getItemDetail(outputSlot)
			if res then
				print("output found")
				work.pushItems(outputSide, outputSlot)
				
				-- unlock crafter
				pulse(redstoneOutput, 0.5)
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
