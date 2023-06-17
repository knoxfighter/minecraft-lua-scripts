local drawerSide = "right"
local chatBoxSide = "left"
local lowWarnings = true

---@type PeripheralInventory
local drawer = peripheral.wrap(drawerSide)
---@type Chat_Box
local chatBox = peripheral.wrap(chatBoxSide)

while true do
    for i = 1, drawer.size() do
        ---@type PeripheralInventoryComplexItem
        local item = drawer.getItemDetail(i)
        if item then
            local maxCount = drawer.getItemLimit(i)
            local perc = item.count / maxCount
			
			--print("check", item.name, " -- ", perc)
			
			if item.name == "minecraft:quartz"
			  or item.name == "quark:elder_prismarine"
			  or item.name == "minecraft:prismarine"
			  or item.name == "astralsorcery:aquamarine"
			  or item.name == "minecraft:oak_log"
			  then
				-- continue
			else
				if perc >= 0.98 then
					-- show error
					chatBox.sendFormattedMessage('{"text":"' .. item.displayName .. ' is now over 98% full", "color":"#FF0000"}', "Metal Storage")
					sleep(1.5)
				elseif perc >= 0.85 then
					-- show warning
					chatBox.sendFormattedMessage('{"text":"' .. item.displayName .. ' is now over 85% full", "color":"#F2B233"}', "Metal Storage")
					sleep(1.5)
				elseif lowWarnings and item.count < 250 then
					-- show low warning
					chatBox.sendFormattedMessage('{"text":"' .. item.displayName .. ' is running out (<250)!!!", "color":"#FF0000"}', "Metal Storage")
					sleep(1.5)
				elseif lowWarnings and item.count < 750 then
					-- show low warning
					chatBox.sendFormattedMessage('{"text":"' .. item.displayName .. ' is running out (<750)!", "color":"#F2B233"}', "Metal Storage")
					sleep(1.5)
				end
			end
        end
    end

    sleep(10 * 60) -- sleep for 10 minutes
end
