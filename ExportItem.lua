local rsBridgeName = "right"
local outputChestName = "left"

local rsBridge = peripheral.wrap(rsBridgeName)

args = {...}

local itemName = args[1]
local amount = tonumber(args[2])

local currentItem = rsBridge.getItem{name=itemName}
if currentItem == nil then
	print("Item nicht vorhanden, erstelle Rezept oder crafte von Hand")
	return
end

if currentItem.amount >= amount then
	print("export ", amount, "of", itemName)
	local exportedAmount = rsBridge.exportItemToPeripheral({name=itemName, count=amount}, "left")
	print("exported: ", exportedAmount)
	return
end

local missingAmount = amount - currentItem.amount+1

print("not enough of that resource available, missing [", missingAmount, "]")

if 
  currentItem.isCraftable 
  --and not rsBridge.isItemCrafting(itemName) 
  then
	write("Do you want to craft it? [y/n]")
	local input = read()
	if input == "" or input == "y" or input == "Y" then
		local craftRes = rsBridge.craftItem{name=itemName, count=missingAmount}
		if craftRes then
			print("Crafting Rezept bestellt")
		else
			print("konnte crafting nicht bestellen, mache es bitte von Hand")
		end
	end
end


--architects_palette:algal_lamp
