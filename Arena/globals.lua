---@type string
redstoneName = "top"
---@type string
detectorName = "left"
---@type string
chatBoxName = "bottom"

---@type PlayerDetector
detector = peripheral.wrap(detectorName)

---@type Monitor
monitor = peripheral.find("monitor")

---@type Chat_Box
chatBox = peripheral.wrap(chatBoxName)

function has_value (tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end

    return false
end

---@generic T
---@param tab T[]
---@param val T
function tableRemoveByValue(tab, val)
    for i, val2 in ipairs(tab) do
        if val == val2 then
            table.remove(tab, i)
            return
        end
    end
end

---@param colour colours
---@return string Hex code
function colourToHex(colour)
    if colour == colors.white then
        return "#F0F0F0"
    end
    if colour == colors.orange then
        return "#F2B233"
    end
    if colour == colors.magenta then
        return "#E57FD8"
    end
    if colour == colors.lightBlue then
        return "#99B2F2"
    end
    if colour == colors.yellow then
        return "#DEDE6C"
    end
    if colour == colors.lime then
        return "#7FCC19"
    end
    if colour == colors.pink then
        return "#F2B2CC"
    end
    if colour == colors.gray then
        return "#4C4C4C"
    end
    if colour == colors.lightGray then
        return "#999999"
    end
    if colour == colors.cyan then
        return "#4C99B2"
    end
    if colour == colors.purple then
        return "#B266E5"
    end
    if colour == colors.blue then
        return "#3366CC"
    end
    if colour == colors.brown then
        return "#7F664C"
    end
    if colour == colors.green then
        return "#57A64E"
    end
    if colour == colors.red then
        return "#CC4C4C"
    end
    if colour == colors.black  then
        return "#191919"
    end
end

function getTextFromColour(colour)
    if colour == colours.white then return "White" end
    if colour == colours.orange then return "Orange" end
    if colour == colours.magenta then return "Magenta" end
    if colour == colours.lightBlue then return "LightBlue" end
    if colour == colours.yellow then return "Yellow" end
    if colour == colours.lime then return "Lime" end
    if colour == colours.pink then return "Pink" end
    if colour == colours.gray then return "Gray" end
    if colour == colours.lightGray then return "LightGray" end
    if colour == colours.cyan then return "Cyan" end
    if colour == colours.purple then return "Purple" end
    if colour == colours.blue then return "Blue" end
    if colour == colours.brown then return "Brown" end
    if colour == colours.green then return "Green" end
    if colour == colours.red then return "Red" end
    if colour == colours.black then return "Black" end
end
