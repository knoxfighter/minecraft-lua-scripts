local drawerSide = "right"
local chatBoxSide = "top"

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
            if perc >= 0.85 then
                -- show warning
                chatBox.sendFormattedMessage('{"text":"' .. item.displayName .. ' is now over 85% full", "color":"#F2B233"}', "Metal Storage")
                sleep(1.5)
            elseif perc >= 0.98 then
                -- show error
                chatBox.sendFormattedMessage('{"text":"' .. item.displayName .. ' is now over 98% full", "color":"red"}', "Metal Storage")
                sleep(1.5)
            end
        end
    end

    sleep(10 * 60) -- sleep for 10 minutes
end
