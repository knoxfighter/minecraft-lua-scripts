local monitor = peripheral.find("monitor")

monitor.clear()
monitor.setTextScale(1)

local x, y = monitor.getSize()

local row = 0

function newRow()
	row = row + 1
	return row
end

function colouredTextCentered(colour, text, textSize)
	monitor.setCursorPos(x/2 - textSize/2, newRow())
	colouredText(colour, text)
end

function colouredText(colour, text)
	if colour == colours.black then
		colour = colours.grey
	end
	monitor.setTextColour(colour)
	monitor.write(text)
end

function writeColours(colour1, colour2, colour3, textSize)
	monitor.setCursorPos(x/2 - textSize/2, newRow())
	colouredText(colour1, getTextFromColour(colour1))
	colouredText(colours.white, "/")
	colouredText(colour2, getTextFromColour(colour2))
	colouredText(colours.white, "/")
	colouredText(colour3, getTextFromColour(colour3))
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

-- centered to 29
-- 29/2 = 14.5

-- Milk
colouredTextCentered(colours.white, "Milk", 4)
writeColours(colours.cyan, colours.black, colours.blue, 15) -- length: 15

-- Menril Resin
newRow()
colouredTextCentered(colours.lightBlue, "Menril Resin", 12) -- length: 12
writeColours(colours.blue, colours.blue, colours.blue, 14) -- length: 14

-- Liquid Chorus
newRow()
colouredTextCentered(colours.purple, "Liquid Chorus", 13) -- length: 13
writeColours(colours.pink, colours.pink, colours.pink, 14) -- length: 14

-- Latex
newRow()
colouredTextCentered(colours.white, "Latex", 5) -- length: 5
writeColours(colours.white, colours.white, colours.black, 17) -- length: 17

-- resin
newRow()
colouredTextCentered(colours.yellow, "Resin", 5)
writeColours(colours.orange, colours.orange, colours.white, 19)

-- skyslime
newRow()
colouredTextCentered(colours.lightBlue, "Skyslime", 8) -- length: 8
writeColours(colours.blue, colours.blue, colours.white, 15) -- length: 15

-- ether gas
newRow()
colouredTextCentered(colours.lightBlue, "Ether Gas", 9)
writeColours(colours.lightBlue, colours.white, colours.lightBlue, 25)

-- Wheat
newRow()
colouredTextCentered(colours.yellow, "Wheat", 5) -- length: 5
writeColours(colours.purple, colours.orange, colours.red, 17) -- length: 17

-- Wool
newRow()
colouredTextCentered(colours.white, "Wool", 4) -- length: 4
writeColours(colours.brown, colours.yellow, colours.red, 16) -- length: 16

-- Atum Excavator
newRow()
colouredTextCentered(colours.yellow, "Nebu Excavator", 14)
writeColours(colours.yellow, colours.brown, colours.yellow, 19)

-- Beryl Excavator
newRow()
colouredTextCentered(colours.blue, "Beryl Excavator", 15)
writeColours(colours.blue, colours.yellow, colours.blue, 16)

-- Enderslime
newRow()
colouredTextCentered(colours.purple, "Enderslime", 10)
writeColours(colours.purple, colours.purple, colours.purple, 20)

-- System Import
--newRow()
--colouredTextCentered(colours.white, "System Import", 13)
--writeColours(colours.cyan, colours.orange, colours.yellow, 18)

-- Sharing
newRow()
colouredTextCentered(colours.white, "Sharing Pouch", 13)
writeColours(colours.cyan, colours.red, colours.yellow, 15)

newRow()
-- Unused chest
colouredTextCentered(colours.grey, "Unused Chest", 12) -- length: 12
writeColours(colours.blue, colours.green, colours.blue, 15) -- lenth: 15
