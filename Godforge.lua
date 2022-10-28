local forgeSide = "back"
local outputSide = "bottom"

local forge = peripheral.wrap(forgeSide)
local output = peripheral.wrap(outputSide)

while true do
	local bucket = forge.getItemDetail(2)
	if bucket ~= nil and bucket.name == "minecraft:bucket" then
		forge.pushItems(outputSide, 2)
		print("moved bucket")
	end
	
	sleep(10)
end
