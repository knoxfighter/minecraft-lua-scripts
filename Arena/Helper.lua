-----------------------------------
-- NEVER EVER INCLUDE THIS FILE! --
-----------------------------------


---@alias colours 0x1 | 0x2 | 0x4 | 0x8 | 0x10 | 0x20 | 0x40 | 0x80 | 0x100 | 0x200 | 0x400 | 0x800 | 0x1000 | 0x2000 | 0x4000 | 0x8000
colours = {
    white = 0x1,
    orange = 0x2,
    magenta = 0x4,
    lightBlue = 0x8,
    yellow = 0x10,
    lime = 0x20,
    pink = 0x40,
    gray = 0x80,
    lightGray = 0x100,
    cyan = 0x200,
    purple = 0x400,
    blue = 0x800,
    brown = 0x1000,
    green = 0x2000,
    red = 0x4000,
    black = 0x8000,
}

---@param colour number
---@vararg colours
---@return number
function colours.subtract(colour, ...)
    return nil
end

---@vararg number
---@return number
function colours.combine(...)
    return nil
end

---@class PlayerDetector
local PlayerDetector = {}

--- Returns player's position.
---@param player string
---@return Coordinate
function PlayerDetector.getPlayerPos(player)
    return nil
end

--- Returns a table of all online players.
---@return string[]
function PlayerDetector.getOnlinePlayers()
    return {}
end

--- Return players within a certain range.
---@param range number
---@return string[]
function PlayerDetector.getPlayersInRange(range)
    return {}
end

--- Return players within 2 positions. The tables need to have a x, y, and z value
---@param posOne Coordinate
---@param posTwo Coordinate
---@return string[]
function PlayerDetector.getPlayersInCoords(posOne, posTwo)
    return {}
end

--- Return players within a certain range. You can define the range in every 3 axes
---@param x number
---@param y number
---@param z number
---@return string[]
function PlayerDetector.getPlayersInCubic(x, y, z)
    return {}
end

--- Returns true if the player is in range, false if not.
---@param range number
---@param username string
---@return boolean
function PlayerDetector.isPlayerInRange(range, username)
    return nil
end

--- Returns true if the player is within 2 positions. The tables need to have a x, y, and z value
---@param posOne Coordinate
---@param posTwo Coordinate
---@return boolean
function PlayerDetector.isPlayerInCoords(posOne, posTwo)
    return nil
end

--- Returns true if the player is within a certain range. You can define the range in every 3 axes
---@param x number
---@param y number
---@param z number
---@return boolean
function PlayerDetector.isPlayerInCubic(x, y, z)
    return nil
end

--- Returns true if any player is in range, false if not.
---@param range number
---@return boolean
function PlayerDetector.isPlayersInRange(range)
    return nil
end

--- Returns true if any player is within 2 positions. The tables need to have a x, y, and z value
---@param posOne Coordinate
---@param posTwo Coordinate
---@return boolean
function PlayerDetector.isPlayersInCoords(posOne, posTwo)
    return nil
end

--- Returns true if any player is within a certain range. You can define the range in every 3 axes
---@param x number
---@param y number
---@param z number
---@return boolean
function PlayerDetector.isPlayersInCubic(x, y, z)
    return nil
end


---@class Monitor
local Monitor = {}

--- Set the scale of this monitor. A larger scale will result in the monitor having a lower resolution, but display text much larger.
---@param scale number The monitor's scale. This must be a multiple of 0.5 between 0.5 and 5.
function Monitor.setTextScale(scale)
    return nil
end

--- Get the monitor's current text scale.
---@return number The monitor's current scale.
function Monitor.getTextScale()
    return nil
end

--- Write text at the current cursor position, moving the cursor to the end of the text.
---
--- Unlike functions like write and print, this does not wrap the text - it simply copies the text to the current terminal line.
---@param text string The text to write.
function Monitor.write(text)
    return nil
end

--- Move all positions up (or down) by y pixels.
---
--- Every pixel in the terminal will be replaced by the line y pixels below it. If y is negative, it will copy pixels from above instead.
---@param y number The number of lines to move up by. This may be a negative number.
function Monitor.scroll(y)
    return nil
end

--- Get the position of the cursor.
---@return number,number x,y for the cursor position
function Monitor.getCursorPos()
    return nil, nil
end

--- Set the position of the cursor. terminal writes will begin from this position.
---@param x number The new x position of the cursor.
---@param y number The new y position of the cursor.
function Monitor.setCursorPos(x, y)
    return nil
end

--- Checks if the cursor is currently blinking.
---@return boolean If the cursor is blinking.
function Monitor.getCursorBlink()
    return nil
end

--- Sets whether the cursor should be visible (and blinking) at the current cursor position.
---@param blink boolean Whether the cursor should blink.
function Monitor.setCursorBlink(blink)
    return nil
end

--- Get the size of the terminal.
---@return number,number width,height of the terminal
function Monitor.getSize()
    return nil, nil
end

--- Clears the terminal, filling it with the current background colour.
function Monitor.clear()
    return nil
end

--- Clears the line the cursor is currently on, filling it with the current background colour.
function Monitor.clearLine()
    return nil
end

--- Return the colour that new text will be written as.
---@return colours The current text colour.
function Monitor.getTextColour()
    return nil
end

--- Return the colour that new text will be written as.
---@return colours The current text colour.
function Monitor.getTextColor()
    return nil
end

--- Set the colour that new text will be written as.
---@param colour colours The new text colour.
function Monitor.setTextColour(colour)
    return nil
end

--- Set the colour that new text will be written as.
------@param colour colours The new text colour.
function Monitor.setTextColor(colour)
    return nil
end

--- Return the current background colour. This is used when writing text and clearing the terminal.
---@return colours The current background colour.
function Monitor.getBackgroundColour()
    return nil
end

--- Return the current background colour. This is used when writing text and clearing the terminal.
---@return colours The current background colour.
function Monitor.getBackgroundColor()
    return nil
end

--- Set the current background colour. This is used when writing text and clearing the terminal.
---@param colour colours The new background colour.
function Monitor.setBackgroundColour(colour)
    return nil
end

--- Set the current background colour. This is used when writing text and clearing the terminal.
---@param colour colours The new background colour.
function Monitor.setBackgroundColor(colour)
    return nil
end

--- Determine if this terminal supports colour.
---
--- Terminals which do not support colour will still allow writing coloured text/backgrounds, but it will be displayed in greyscale.
---@return boolean Whether this terminal supports colour.
function Monitor.isColour()
    return nil
end

--- Determine if this terminal supports colour.
---
--- Terminals which do not support colour will still allow writing coloured text/backgrounds, but it will be displayed in greyscale.
---@return boolean Whether this terminal supports colour.
function Monitor.isColor()
    return nil
end

--- Writes text to the terminal with the specific foreground and background characters.
--- As with write, the text will be written at the current cursor location, with the cursor moving to the end of the text.
--- textColour and backgroundColour must both be strings the same length as text. All characters represent a single hexadecimal digit, which is converted to one of CC's colours. For instance, "a" corresponds to purple.
---@param text string The text to write.
---@param textColour string The corresponding text colours.
---@param backgroundColour string The corresponding background colours.
function Monitor.blit(text, textColour, backgroundColour)
    return nil
end

--- Get the current palette for a specific colour.
---@param colour colours The colour whose palette should be fetched.
---@return number,number,number Red,Green,Blue channels of the colour
function Monitor.getPaletteColour(colour)
    return nil, nil, nil
end

--- Get the current palette for a specific colour.
---@param colour colours The colour whose palette should be fetched.
---@return number,number,number Red,Green,Blue channels of the colour
function Monitor.getPaletteColor(colour)
    return nil, nil, nil
end

---@param time number
function sleep(time)

end

---@class Redstone
local Redstone = {}

--- Returns a table containing the six sides of the computer. Namely, "top", "bottom", "left", "right", "front" and "back".
---@return string...
function Redstone.getSides()
    return nil
end

--- Turn the redstone signal of a specific side on or off.
---@param side string The side to set.
---@param on boolean Whether the redstone signal should be on or off. When on, a signal strength of 15 is emitted.
function Redstone.setOutput(side, on)

end

--- Get the current redstone output of a specific side.
---@param side string The side to get.
---@return boolean Whether the redstone output is on or off.
function Redstone.getOutput(side)
    return nil
end

--- Get the current redstone input of a specific side.
---@param side string The side to get.
---@return boolean Whether the redstone input is on or off.
function Redstone.getInput(side)
    return nil
end

--- Set the redstone signal strength for a specific side.
---@param side string The side to set.
---@param value number The signal strength between 0 and 15.
function Redstone.setAnalogOutput(side, value)

end

--- Set the redstone signal strength for a specific side.
---@param side string The side to set.
---@param value number The signal strength between 0 and 15.
function Redstone.setAnalogueOutput(side, value)

end

--- Get the redstone output signal strength for a specific side.
---@param side string The side to get.
---@return number The output signal strength, between 0 and 15.
function Redstone.getAnalogOutput(side)
    return nil
end

--- Get the redstone output signal strength for a specific side.
---@param side string The side to get.
---@return number The output signal strength, between 0 and 15.
function Redstone.getAnalogueOutput(side)
    return nil
end

--- Get the redstone input signal strength for a specific side.
---@param side string The side to get.
---@return number The input signal strength, between 0 and 15.
function Redstone.getAnalogInput(side)
    return nil
end

--- Get the redstone input signal strength for a specific side.
---@param side string The side to get.
---@return number The input signal strength, between 0 and 15.
function Redstone.getAnalogueInput(side)
    return nil
end

--- Set the bundled cable output for a specific side.
---@param side string The side to set.
---@param output number The colour bitmask to set.
function Redstone.setBundledOutput(side, output)

end

--- Get the bundled cable output for a specific side.
---@param side string The side to get.
---@return number The bundle cable's output.
function Redstone.getBundledOutput(side)
    return nil
end

--- Get the bundled cable input for a specific side.
---@param side string The side to get.
---@return number The bundle cable's input.
function Redstone.getBundledInput(side)
    return nil
end

--- Determine if a specific combination of colours are on for the given side.
---@param side string The side to test.
---@param mask number The mask to test.
---@return boolean If the colours are on.
function Redstone.testBundledInput(side, mask)
    return nil
end

---@type Redstone
redstone = nil


---@class Textutils
---@field empty_json_array any A table representing an empty JSON array, in order to distinguish it from an empty JSON object. The contents of this table should not be modified.
---@field json_null any A table representing the JSON null value. The contents of this table should not be modified.
local Textutils = {}

---Slowly writes string text at current cursor position, character-by-character.
---
---Like _G.write, this does not insert a newline at the end.
---@param text string The the text to write to the screen
---@param rate number The number of characters to write each second, Defaults to 20.
---@overload fun(text:string)
function Textutils.slowWrite(text, rate)

end

--- Slowly prints string text at current cursor position, character-by-character.
---
---Like print, this inserts a newline after printing.
---@param sText string The the text to write to the screen
---@param nRate number The number of characters to write each second, Defaults to 20.
---@overload fun(sText:string)
function Textutils.slowPrint(sText, nRate)

end

--- Takes input time and formats it in a more readable format such as 6:30 PM.
---@param nTime number The time to format, as provided by os.time.
---@param bTwentyFourHour boolean Whether to format this as a 24-hour clock (18:30) rather than a 12-hour one (6:30 AM)
---@overload fun(ntime:number)
---@return string The formatted time
function Textutils.formatTime(nTime, bTwentyFourHour)
    return nil
end

--- Prints a given string to the display.
---
---If the action can be completed without scrolling, it acts much the same as print; otherwise, it will throw up a "Press any key to continue" prompt at the bottom of the display. Each press will cause it to scroll down and write a single line more before prompting again, if need be.
---@param text string The text to print to the screen.
---@param free_lines number The number of lines which will be automatically scrolled before the first prompt appears (meaning free_lines + 1 lines will be printed). This can be set to the cursor's y position - 2 to always try to fill the screen. Defaults to 0, meaning only one line is displayed before prompting.
---@overload fun(text:string)
---@return number The number of lines printed.
function Textutils.pagedPrint(text, free_lines)
    return nil
end

--- Prints tables in a structured form.
---
---This accepts multiple arguments, either a table or a number. When encountering a table, this will be treated as a table row, with each column width being auto-adjusted.
---
---When encountering a number, this sets the text color of the subsequent rows to it.
---@vararg string[]|number The rows and text colors to display.
function Textutils.tabulate(...)

end

---Prints tables in a structured form, stopping and prompting for input should the result not fit on the terminal.
---
---This functions identically to textutils.tabulate, but will prompt for user input should the whole output not fit on the display.
---@vararg string[]|number The rows and text colors to display.
function Textutils.pagedTabulate(...)

end

--- Convert a Lua object into a textual representation, suitable for saving in a file or pretty-printing.
---@param t any The object to serialise
---@param opts any The serialised representation
---@return string The serialised representation
function Textutils.serialize(t, opts)
    return nil
end

--- Convert a Lua object into a textual representation, suitable for saving in a file or pretty-printing.
---@param t any The object to serialise
---@param opts any The serialised representation
---@return string The serialised representation
function Textutils.serialise(t, opts)
    return nil
end

--- Converts a serialised string back into a reassembled Lua object.
---
---This is mainly used together with textutils.serialise.
---@param s string The serialised string to deserialise.
---@return any|nil The deserialised object. nil If the object could not be deserialised.
function Textutils.unserialize(s)
    return nil
end

--- Converts a serialised string back into a reassembled Lua object.
---
---This is mainly used together with textutils.serialise.
---@param s string The serialised string to deserialise.
---@return any|nil The deserialised object. nil If the object could not be deserialised.
function Textutils.unserialise(s)
    return nil
end

--- Returns a JSON representation of the given data.
---
---This function attempts to guess whether a table is a JSON array or object. However, empty tables are assumed to be empty objects - use textutils.empty_json_array to mark an empty array.
---
---This is largely intended for interacting with various functions from the commands API, though may also be used in making http requests.
---@param t any The value to serialise. Like textutils.serialise, this should not contain recursive tables or functions.
---@param bNBTStyle boolean Whether to produce NBT-style JSON (non-quoted keys) instead of standard JSON.
---@overload fun(t:any):string
---@return string The JSON representation of the input.
function Textutils.serializeJSON(t, bNBTStyle)
    return nil
end

--- Returns a JSON representation of the given data.
---
---This function attempts to guess whether a table is a JSON array or object. However, empty tables are assumed to be empty objects - use textutils.empty_json_array to mark an empty array.
---
---This is largely intended for interacting with various functions from the commands API, though may also be used in making http requests.
---@param t any The value to serialise. Like textutils.serialise, this should not contain recursive tables or functions.
---@param bNBTStyle boolean Whether to produce NBT-style JSON (non-quoted keys) instead of standard JSON.
---@overload fun(t:any):string
---@return string The JSON representation of the input.
function Textutils.serialiseJSON(t, bNBTStyle)
    return nil
end

---Converts a serialised JSON string back into a reassembled Lua object.
---
---This may be used with textutils.serializeJSON, or when communicating with command blocks or web APIs.
---
---If a null value is encountered, it is converted into nil. It can be converted into textutils.json_null with the parse_null option.
---
---If an empty array is encountered, it is converted into textutils.empty_json_array. It can be converted into a new empty table with the parse_empty_array option.
---@param s string The serialised string to deserialise.
---@param options any
---@overload fun(s:string)
---@return any The deserialised object
function Textutils.unserializeJSON(s, options)
    return nil
end

---Converts a serialised JSON string back into a reassembled Lua object.
---
---This may be used with textutils.serializeJSON, or when communicating with command blocks or web APIs.
---
---If a null value is encountered, it is converted into nil. It can be converted into textutils.json_null with the parse_null option.
---
---If an empty array is encountered, it is converted into textutils.empty_json_array. It can be converted into a new empty table with the parse_empty_array option.
---@param s string The serialised string to deserialise.
---@param options any
---@overload fun(s:string)
---@return any The deserialised object
function Textutils.unserialiseJSON(s, options)
    return nil
end

---Replaces certain characters in a string to make it safe for use in URLs or POST data.
---@param str string The string to encode
---@return string The encoded string.
function Textutils.urlEncode(str)
    return nil
end

---Provides a list of possible completions for a partial Lua expression.
---
---If the completed element is a table, suggestions will have . appended to them. Similarly, functions have ( appended to them.
---@param sSearchText string The partial expression to complete, such as a variable name or table index.
---@param tSearchTable any The table to find variables in, defaulting to the global environment (_G). The function also searches the "parent" environment via the __index metatable field.
---@return string[] The (possibly empty) list of completions.
function Textutils.complete(sSearchText, tSearchTable)
    return {}
end

---@type Textutils
textutils = nil


---@class Peripheral
local Peripheral = {}

---Provides a list of all peripherals available.
---
---If a device is located directly next to the system, then its name will be listed as the side it is attached to. If a device is attached via a Wired Modem, then it'll be reported according to its name on the wired network.
---@return string[] A list of the names of all attached peripherals.
function Peripheral.getNames()
    return {}
end

---Determines if a peripheral is present with the given name.
---@param name string The side or network name that you want to check.
---@return boolean If a peripheral is present with the given name.
function Peripheral.isPresent(name)
    return nil
end

---Get the types of a named or wrapped peripheral.
---@param peripheral string|table The name of the peripheral to find, or a wrapped peripheral instance.
---@return string[] The peripheral's types, or nil if it is not present.
function Peripheral.getType(peripheral)
    return {}
end

---Check if a peripheral is of a particular type.
---@param peripheral string|table The name of the peripheral or a wrapped peripheral instance.
---@param peripheral_type string The type to check.
---@return boolean|nil If a peripheral has a particular type, or nil if it is not present.
function Peripheral.hasType(peripheral, peripheral_type)
    return nil
end

---Get all available methods for the peripheral with the given name.
---@param name string The name of the peripheral to find.
---@return string[]|nil A list of methods provided by this peripheral, or nil if it is not present.
function Peripheral.getMethods(name)
    return nil
end

---Get the name of a peripheral wrapped with peripheral.wrap.
---@param peripheral string The peripheral to get the name of.
---@return string The name of the given peripheral.
function Peripheral.getName(peripheral)
    return nil
end

---Call a method on the peripheral with the given name.
---@param name string The name of the peripheral to invoke the method on.
---@param method string The name of the method
---@vararg any Additional arguments to pass to the method
---@return any The return values of the peripheral method.
function Peripheral.call(name, method, ...)
    return nil
end

---Get a table containing all functions available on a peripheral. These can then be called instead of using peripheral.call every time.
---@param name string The name of the peripheral to wrap.
---@return any|nil The table containing the peripheral's methods, or nil if there is no peripheral present with the given name.
function Peripheral.wrap(name)
    return nil
end

---Find all peripherals of a specific type, and return the wrapped peripherals.
---@param ty string The type of peripheral to look for.
---@param filter fun(name:string, wrapped:table):boolean A filter function, which takes the peripheral's name and wrapped table and returns if it should be included in the result.
---@overload fun(ty:string)
---@return any[] 0 or more wrapped peripherals matching the given filters.
function Peripheral.find(ty, filter)
    return {}
end

---@type Peripheral
peripheral = nil


---@class Chat_Box
local Chat_Box = {}

---Broadcasts a message to the global chat.
---@param message string
---@param prefix string
---@overload fun(message:string)
function Chat_Box.sendMessage(message, prefix)

end

---Broadcasts a text component message to the global chat.
---@param jsonObject string
---@param prefix string
---@overload fun(jsonObject:string)
function Chat_Box.sendFormattedMessage(jsonObject, prefix)

end

---Sends a message to one specific player.
---@param message string
---@param user string
---@param prefix string
---@overload fun(message:string, user:string)
function Chat_Box.sendMessageToPlayer(message, user, prefix)

end
