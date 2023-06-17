local batterySide = "top"
local redstoneSide = "front"
local chatBoxSide = "bottom"

local battery = peripheral.wrap(batterySide)
local chatBox = peripheral.wrap(chatBoxSide)

function enableRedstoneOut(side, colour)
	local curOut = redstone.getBundledOutput(side)
	redstone.setBundledOutput(side, colours.combine(curOut, colour))
end

function disableRedstoneOut(side, colour)
	local curOut = redstone.getBundledOutput(side)
	redstone.setBundledOutput(side, colours.subtract(curOut, colour))
end

while true do
	local batteryPerc = battery.getEnergyFilledPercentage()
	
	print("Aktueller Füllstand: " .. batteryPerc*100)
	
	-- turn ON nuclear reactor
	if batteryPerc < 0.5 then
		enableRedstoneOut(redstoneSide, colours.green)
	end
	-- turn OFF nuclear reactor
	if batteryPerc > 0.8 then
		disableRedstoneOut(redstoneSide, colours.green)
	end
	-- turn ON Antimatter production
	if batteryPerc > 0.95 then
		enableRedstoneOut(redstoneSide, colours.pink)
	end
	-- turn OFF Antimatter production
	if batteryPerc < 0.3 then
		disableRedstoneOut(redstoneSide, colours.pink)
	end
	
	-- send warning!
	if batteryPerc < 0.1 then
		chatBox.sendFormattedMessage('{"text":"Low on Power, only '.. batteryPerc*100 ..'% left!!", "color":"#FF0000"}', "Metal Storage")
	end
	
	sleep(300)
end
