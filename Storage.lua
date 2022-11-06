-- This method exists to connect a peripheral easier
function wrapPs(peripheralName)
  periTab={}
  sideTab={}
  if peripheralName==nil then
    print("Error")
  end
  local peripherals = peripheral.getNames()
  local i2 = 1
  for i =1, #peripherals do
    if peripheral.getType(peripherals[i])==peripheralName then
      periTab[i2]=peripheral.wrap(peripherals[i])
      sideTab[i2]=peripherals[i]
      i2=i2+1
    end
  end
  if periTab~={} then
    return periTab,sideTab
  else
    return nil
  end
end
 
--String of the title of the monitor
label = "Automatic Autocraft"
 
-- me Bridge
me = wrapPs("rsBridge")[1]
assert(me, "rsBridge not found")
-- Monitor
mon = wrapPs("monitor")[1]
assert(mon, "Monitor not found")
 
-- Items for the computer
-- Name(Just a name, you can type everything), minecraft name, minimum amount
meItems = {
{"Plastic","industrialforegoing:plastic",64},
{"Plastic","pneumaticcraft:plastic", 128},
{"Quartz Enriched Iron", "refinedstorage:quartz_enriched_iron", 128},
{"Improved Processor","refinedstorage:improved_processor", 64},
{"Basic Processor","refinedstorage:basic_processor", 64},
{"Advanced Processor","refinedstorage:advanced_processor", 64},
-- {"Chromatic Component","create:chromatic_compound", 32}, -- broken :(
{"Pattern","refinedstorage:pattern",64},
{"Nether Quartz","minecraft:quartz",128},
{"Cake","minecraft:cake",32},
{"Livingrock", "botania:livingrock", 64},
}
 
--Checks the item and craft more of it if too few exist
function checkMe(checkName, name, low)
  if me.isItemCraftable{name = checkName} then
    row = row+1
    CenterT(name ,row+1, colors.black, colors.lightGray,"left")
	
	gettedItem = me.getItem{name = checkName} or nil
	
	if gettedItem then
      if gettedItem.amount <= low-1 then
	    local printColor = colors.red
        if me.isItemCrafting(checkName) == false then -- checks if already a job for the item exists
          if not me.craftItem({name = checkName, count = low-gettedItem.amount}) then
		    printColor = colors.orange
		  end
          print("Craft ".. low-gettedItem.amount .. " ".. name) --A Log message which appears in the computer
        end
		
		CenterT(gettedItem.amount.. "/".. low ,row+1, colors.black, printColor,"right")
	  else
        CenterT(gettedItem.amount.. "/".. low ,row+1, colors.black, colors.green,"right")
      end
	else
	  CenterT("??/".. low ,row+1, colors.black, colors.orange,"right")
	end
  end
end
 
-- Runs checkMe with every item
function checkTable()
  row = 1
  clearScreen()
  for i = 1, #meItems do
    checkName = meItems[i][2]
    name = meItems[i][1]
    low = meItems[i][3]
    checkMe(checkName, name, low)
  end
end
 
-- Clears the screen and writes the title
function clearScreen()
  mon.setBackgroundColor(colors.black)
  mon.clear()
  mon.setCursorPos(1,1)
  CenterT(label ,1, colors.black, colors.white,"head")
end
 
-- Just a method to writes textes easier
function CenterT(text, line, txtback , txtcolor, pos)
  monX,monY = mon.getSize()
  mon.setBackgroundColor(txtback)
  mon.setTextColor(txtcolor)
  length = string.len(text)
  dif = math.floor(monX-length)
  x = math.floor(dif/2)
 
  if pos == "head" then
    mon.setCursorPos(x+1, line)
    mon.write(text)
  elseif pos == "left" then
    mon.setCursorPos(2,line)
    mon.write(text)
  elseif pos == "right" then
    mon.setCursorPos(monX-length, line)
    mon.write(text)
  end
end
 
 
while true do
  checkTable()
  -- CheckTable runs every 60 seconds, you can increase that.
  sleep(60)
end
