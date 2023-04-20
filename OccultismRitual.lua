local redstoneInput = "front"
local workChest = "quark:variant_chest_5"
---@type string[]
local bowl_names = {
    "occultism:sacrificial_bowl_0",
    "occultism:sacrificial_bowl_1",
    "occultism:sacrificial_bowl_2",
    "occultism:sacrificial_bowl_3",
    "occultism:sacrificial_bowl_4",
    "occultism:sacrificial_bowl_5",
	"occultism:sacrificial_bowl_30",
	"occultism:sacrificial_bowl_31",
	"occultism:sacrificial_bowl_32",
	"occultism:sacrificial_bowl_33",
	"occultism:sacrificial_bowl_34",
	"occultism:sacrificial_bowl_35"
}
local main_bowl = "modularrouters:item_router_2"

---@type PeripheralInventory
local input = peripheral.wrap(workChest)

while true do
	local rsIn = redstone.getAnalogInput(redstoneInput)
	if rsIn > 0 then
		-- move all items except the book into bowls
		-- move all items into the orb
		local targetBowl = 1
		bookSlot = 0
		for slot, item in pairs(input.list()) do
			if (item.name == "occultism:book_of_binding_bound_foliot") then
				bookSlot = slot
				print("bookSlot is now", bookSlot)
			else
				for i = 1, item.count do
					input.pushItems(bowl_names[targetBowl], slot, 1, 1)
					targetBowl = targetBowl + 1
				end
			end
		end
		
		-- move the book into the center bowl
		print("bookSlot is now", bookSlot)
		input.pushItems(main_bowl, bookSlot, 1, 1)
		
		sleep(1)
	else
		print("waiting for next thing to do")
		print("--------------")
		os.pullEvent("redstone")
		print("yai, something to do")
	end
end
