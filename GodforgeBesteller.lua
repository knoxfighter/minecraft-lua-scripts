local bridge = peripheral.wrap("back")

local honeyname = "resourcefulbees:dusty_mummbee_honeycomb"
local honeyCount = 192
local nebuName = "atum:nebu_ingot"
local nebuCount = 256
local godforgedName = "atum:godforged_block"
local godforgedTarget = 2048
local godshardAmount = 128

local godshards = {
	["atum:anput_godshard"] = 0,
	["atum:anubis_godshard"] = 0,
	["atum:atem_godshard"] = 0,
	["atum:geb_godshard"] = 0,
	["atum:horus_godshard"] = 0,
	["atum:isis_godshard"] = 0,
	["atum:montu_godshard"] = 0,
	["atum:nepthys_godshard"] = 0,
	["atum:nuit_godshard"] = 0,
	["atum:osiris_godshard"] = 0,
	["atum:ptah_godshard"] = 0,
	["atum:ra_godshard"] = 0,
	["atum:seth_godshard"] = 0,
	["atum:shu_godshard"] = 0,
	["atum:tefnut_godshard"] = 0
}

while true do
	term.clear()
	term.setCursorPos(1,1)
	
	-- update currect status
	for shardName, _ in pairs(godshards) do
		local item = bridge.getItem{name=shardName}
		godshards[shardName] = item.amount
	end
	
	-- print current status
	for shardName, amount in pairs(godshards) do
		print(shardName .. " : " .. amount)
	end
	
	-- check if any shard is below threshold
	local belowThreshold = false
	local highestAmount = nil
	for shardName, amount in pairs(godshards) do
		if amount < godforgedTarget then
			belowThreshold = true
		end
		if highestAmount == nil then
			highestAmount = {}
			highestAmount.name = shardName
			highestAmount.amount = amount
		elseif highestAmount.amount < amount then
			highestAmount.name = shardName
			highestAmount.amount = amount
		end
	end
	
	if belowThreshold then
		-- check if godforged blocks are still in the system
		local item = bridge.getItem{name=godforgedName}
		if item == nil or item.amount == 0 then
			print("use " .. highestAmount.name .. " to craft new ones")
			-- check if there is enough to craft 64 blocks
			if highestAmount.amount < godshardAmount then
				-- critical error
				print("ERROR !!!!! not enough resources to craft godforged blocks !!!!")
				print("highestAmount.amount >= godforgedTarget -- " ..  highestAmount.amount .. " >= " .. godshardAmount)
				return
			end
			
			local honeyItem = bridge.getItem{name=honeyname}
			local nebuItem = bridge.getItem{name=nebuName}
			if honeyItem and honeyItem.amount >= honeyCount and nebuItem and nebuItem.amount >= nebuCount then
				-- export everything
				print(bridge.exportItem({name = honeyname, count = honeyCount}, "down"))
				print(bridge.exportItem({name = nebuName, count = nebuCount}, "down"))
				print(bridge.exportItem({name = highestAmount.name, count = godshardAmount}, "down"))
			else
				print("not enough resources to craft godforged blocks")
			end
		end
	end
	
	
	sleep(600)
end
