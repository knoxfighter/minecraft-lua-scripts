require("defines")
require("conf")

rednet.open(modemSide)

while true do
    local id, message = rednet.receive(protocol)
    if id then
        if message == activateMessage then
            redstone.setOutput(redstoneSide, true)
            sleep(1)
            redstone.setOutput(redstoneSide, false)
        elseif message == nameMessage then
            print("received name request from #" .. id)
            rednet.send(id, {protocol = nameMessage, id = os.getComputerID(), name = name}, protocol)
        end
    end
end
