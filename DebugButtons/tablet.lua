require("defines")

peripheral.find("modem", rednet.open)

rednet.broadcast(nameMessage, protocol)

---@shape Button
---@field id number
---@field name string

---@type Button[] id to name table
local buttons = {}

print("loading available debug buttons ...")
while true do
    local id, message = rednet.receive(protocol, 2)
    if id and message.protocol and message.protocol == nameMessage then
        ---@type Button
        local button = {id = message.id, name = message.name}
        table.insert(buttons, button)
    else
        break
    end
end

term.clear()
term.setCursorPos(1,1)
for _, button in ipairs(buttons) do
    print(button.name)
end

while true do
    local event, button, x, y = os.pullEvent("mouse_click")
    local button = buttons[y]
    if button then
        rednet.send(button.id, activateMessage, protocol)
    end
end
