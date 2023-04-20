local drawerSide = "right"
local chatBoxSide = "left"

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
			
			if item.name == "minecraft:quartz" or item.name == "quark:elder_prismarine" then
				-- continue
			else
				if perc >= 0.85 and perc < 0.98 then
					-- show warning
					chatBox.sendFormattedMessage('{"text":"' .. item.displayName .. ' is now over 85% full", "color":"#F2B233"}', "Metal Storage")
					sleep(1.5)
				elseif perc >= 0.98 then
					-- show error
					chatBox.sendFormattedMessage('{"text":"' .. item.displayName .. ' is now over 98% full", "color":"#FF0000"}', "Metal Storage")
					sleep(1.5)
				--elseif perc < 0.05 then
					-- show low warning
				--	chatBox.sendFormattedMessage('{"text":"' .. item.displayName .. ' is running out!", "color":"#F2B233"}', "Metal Storage")
				end
			end
        end
    end

    sleep(10 * 60) -- sleep for 10 minutes
end
