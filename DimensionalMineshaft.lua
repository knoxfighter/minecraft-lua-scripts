local djinnChest = "minecraft:chest_0"
local output = "immersiveengineering:woodencrate_3"

---@type string[]
local mineshaftNames = {
	"occultism:dimensional_mineshaft_0",
	"occultism:dimensional_mineshaft_1",
	"occultism:dimensional_mineshaft_2",
	"occultism:dimensional_mineshaft_3",
}

---@type PeripheralInventory[]
local mineshafts = {}
for _, mineshaftName in ipairs(mineshaftNames) do
	table.insert(mineshafts, peripheral.wrap(mineshaftName))
end

while true do
	for _, mineshaft in pairs(mineshafts) do
		-- check djinni health
		---@type PeripheralInventoryComplexItem
		local item = mineshaft.getItemDetail(1)
		if item and item.maxDamage - item.damage <= 3 then
			-- move item away
			mineshaft.pushItems(djinnChest, 1)
		end
		
		-- get everything from the output
		for i=2, mineshaft.size() do
			mineshaft.pushItems(output, i)
		end
	end
	
	sleep(20)
end
