local partAmount = 3

local mainMonitor = peripheral.find("monitor")

mainMonitor.clear()
mainMonitor.setTextScale(1)

local monitorX, monitorY = mainMonitor.getSize()
print("Monitor: {", monitorX, ", ", monitorY, "}")
local monitorXPart = monitorX/partAmount
local monitorParts = {}
for i=1,partAmount do
	local width = math.floor(monitorX / partAmount)
	local startPos = width * (i - 1) + 1
	monitorPart = window.create(mainMonitor, startPos, 1, width, monitorY)
	table.insert(monitorParts, monitorPart)
end

local x,y
local row = 0
local monitor
local currentMonitor = 1

local function setNextMonitor()
	monitor = monitorParts[currentMonitor]
	x, y = monitor.getSize()
	row = 0
	currentMonitor = currentMonitor + 1
	monitor.setCursorPos(1, 1)
end

function newRow()
	row = row + 1
	return row
end

function colouredTextCentered(colour, text)
	monitor.setCursorPos(x/2 - string.len(text)/2, newRow())
	colouredText(colour, text)
end

function colouredText(colour, text)
	if colour == colours.black then
		colour = colours.grey
	end
	monitor.setTextColour(colour)
	monitor.write(text)
end

function writeColours(colour1, colour2, colour3)
	local text1 = getTextFromColour(colour1)
	local text2 = getTextFromColour(colour2)
	local text3 = getTextFromColour(colour3)
	
	local textSize = string.len(text1) + 1 + string.len(text2) + 1 + string.len(text3)
	
	monitor.setCursorPos(x/2 - textSize/2, newRow())
	
	colouredText(colour1, text1)
	colouredText(colours.white, "/")
	colouredText(colour2, text2)
	colouredText(colours.white, "/")
	colouredText(colour3, text3)
end

function getTextFromColour(colour)
	if colour == colours.white then return "White" end
	if colour == colours.orange then return "Orange" end
	if colour == colours.magenta then return "Magenta" end
	if colour == colours.lightBlue then return "LightBlue" end
	if colour == colours.yellow then return "Yellow" end
	if colour == colours.lime then return "Lime" end
	if colour == colours.pink then return "Pink" end
	if colour == colours.grey then return "Grey" end
	if colour == colours.lightGray then return "LightGray" end
	if colour == colours.cyan then return "Cyan" end
	if colour == colours.purple then return "Purple" end
	if colour == colours.blue then return "Blue" end
	if colour == colours.brown then return "Brown" end
	if colour == colours.green then return "Green" end
	if colour == colours.red then return "Red" end
	if colour == colours.black then return "Black" end
end

setNextMonitor()

-- centered to 29
-- 29/2 = 14.5

-- Milk
colouredTextCentered(colours.white, "Milk")
writeColours(colours.cyan, colours.black, colours.blue) -- length: 15

-- Menril Resin
newRow()
colouredTextCentered(colours.lightBlue, "Menril Resin") -- length: 12
writeColours(colours.blue, colours.blue, colours.blue) -- length: 14

-- Liquid Chorus
newRow()
colouredTextCentered(colours.purple, "Liquid Chorus") -- length: 13
writeColours(colours.pink, colours.pink, colours.pink) -- length: 14

-- Latex
newRow()
colouredTextCentered(colours.white, "Latex") -- length: 5
writeColours(colours.white, colours.white, colours.black) -- length: 17

-- resin
newRow()
colouredTextCentered(colours.yellow, "Resin")
writeColours(colours.orange, colours.orange, colours.white)

-- skyslime
newRow()
colouredTextCentered(colours.lightBlue, "Skyslime") -- length: 8
writeColours(colours.blue, colours.blue, colours.white) -- length: 15

-- ether gas
newRow()
colouredTextCentered(colours.lightBlue, "Ether Gas")
writeColours(colours.lightBlue, colours.white, colours.lightBlue)

-- Wheat
newRow()
colouredTextCentered(colours.yellow, "Wheat") -- length: 5
writeColours(colours.purple, colours.orange, colours.red) -- length: 17

-- Wool
newRow()
colouredTextCentered(colours.white, "Wool") -- length: 4
writeColours(colours.brown, colours.yellow, colours.red) -- length: 16

-- Atum Excavator
newRow()
colouredTextCentered(colours.yellow, "Nebu Excavator")
writeColours(colours.yellow, colours.brown, colours.yellow)

-- Beryl Excavator
newRow()
colouredTextCentered(colours.blue, "Beryl Excavator")
writeColours(colours.blue, colours.yellow, colours.blue)

-- Nether Excavator
newRow()
colouredTextCentered(colours.red, "Nether Excavator")
writeColours(colours.red, colours.red, colours.red)

-- Enderslime
newRow()
colouredTextCentered(colours.purple, "Enderslime")
writeColours(colours.purple, colours.purple, colours.purple)

setNextMonitor()

-- I Do this shit alone
--newRow()
colouredTextCentered(colours.white, "I Do this shit alone 1")
writeColours(colours.cyan, colours.orange, colours.yellow)

-- I Do this shit alone 2
newRow()
colouredTextCentered(colours.white, "I Do this shit alone 2")
writeColours(colours.yellow, colours.orange, colours.cyan)

-- Sharing
newRow()
colouredTextCentered(colours.white, "Sharing Pouch")
writeColours(colours.cyan, colours.red, colours.yellow)

-- Crude Oil
newRow()
colouredTextCentered(colours.black, "Crude Oil")
writeColours(colours.black, colours.black, colours.black)

-- Lava
newRow()
colouredTextCentered(colours.red, "Lava")
writeColours(colours.red, colours.orange, colours.red)

-- Liquid Deuterium 
newRow()
colouredTextCentered(colours.red, "Liquid Deuterium")
writeColours(colours.red, colours.red, colours.red)

-- Liquid Starlight 
newRow()
colouredTextCentered(colours.white, "Liquid Starlight")
writeColours(colours.white, colours.blue, colours.white)

-- Ethanol
newRow()
colouredTextCentered(colours.orange, "Ethanol")
writeColours(colours.orange, colours.orange, colours.orange)

-- Ectoplasm
newRow()
colouredTextCentered(colours.red, "Ectoplasm")
writeColours(colours.white, colours.yellow, colours.blue)

-- Aquamarine
newRow()
colouredTextCentered(colours.cyan, "Aquamarine")
writeColours(colours.blue, colours.yellow, colours.blue)

-- Nebu 
newRow()
colouredTextCentered(colours.yellow, "Nebu")
writeColours(colours.yellow, colours.brown, colours.yellow)


newRow()
colouredTextCentered(colours.orange, "Lubricant")
writeColours(colours.orange, colours.yellow, colours.orange)

-- Komodo Dragon Spit
newRow()
colouredTextCentered(colours.lime, "Komodo Dragon Spit")
writeColours(colours.blue, colours.green, colours.blue)

setNextMonitor()

-- Will Crystal
colouredTextCentered(colours.cyan, "Will Crystal")
writeColours(colours.cyan, colours.purple, colours.red)

-- Blazing Blood
newRow()
colouredTextCentered(colours.orange, "Blazing Blood")
writeColours(colours.orange, colours.red, colours.orange)

newRow()
colouredTextCentered(colours.brown, "Liquid Meat")
writeColours(colours.brown, colours.brown, colours.brown)

newRow()
colouredTextCentered(colours.lime, "Liquid Tritium")
writeColours(colours.lime, colours.lime, colours.lime)

newRow()
colouredTextCentered(colours.lime, "Essence (import)")
writeColours(colours.lime, colours.grey, colours.lime)

newRow()
colouredTextCentered(colours.red, "Life Essence (Blut)")
writeColours(colours.red, colours.black, colours.red)

newRow()
colouredTextCentered(colours.yellow, "Djinn Miner 1")
writeColours(colours.yellow, colours.yellow, colours.yellow)

newRow()
colouredTextCentered(colours.yellow, "Djinn Miner 2")
writeColours(colours.orange, colours.orange, colours.orange)

newRow()
colouredTextCentered(colours.green, "Pneu. Essence")
writeColours(colours.lime, colours.green, colours.lime)

-- Unused chest
newRow()
colouredTextCentered(colours.grey, "Unused Chest") -- length: 12
writeColours(colours.blue, colours.green, colours.blue) -- lenth: 15


