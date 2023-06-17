local djinnInput = "enderstorage:ender_chest_1"
local djinnOutput = "entangled:tile_13"
local output = "immersiveengineering:woodencrate_5"

local minItemDamage = 3

function table_size(t)
	local count = 0
	for _ in pairs(t) do count = count + 1 end
	return count
end

---@type PeripheralInventory[]
local mineshafts = {peripheral.find("occultism:dimensional_mineshaft")}
local djinnChest = peripheral.wrap(djinnInput)

print("Working with", #mineshafts, "mineshafts")

while true do
	for _, mineshaft in pairs(mineshafts) do
		-- check djinni health
		---@type PeripheralInventoryComplexItem
		local item = mineshaft.getItemDetail(1)
		if item and item.maxDamage - item.damage <= minItemDamage then
			-- move item away
			mineshaft.pushItems(djinnOutput, 1)
		end
		
		-- place djinni into mineshaft
		if mineshaft.getItemDetail(1) == nil then
			for chestSlot, chestItem in pairs(djinnChest.list()) do
				if chestItem then
					--local chestItemComplex = djinnChest.getItemDetail(chestSlot)
					--if chestItemComplex.maxDamage - chestItemComplex.damage > minItemDamage then
						mineshaft.pullItems(djinnInput, chestSlot, 1, 1)
					--end
				end
			end
		end
		
		-- get everything from the output
		for i=2, mineshaft.size() do
			mineshaft.pushItems(output, i)
		end
	end
	
	sleep(20)
end
