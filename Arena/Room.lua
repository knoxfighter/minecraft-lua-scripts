require("Player")

---@shape Coordinate
---@field x number
---@field y number
---@field z number

---@shape Room
---@field Min Coordinate
---@field Max Coordinate
---@field Colour colours
---@field RedstoneInput colours
---@field RedstoneOutput colours
---@field OutputInverted boolean
---@field OpenDoor fun(self: Room)
---@field CloseDoor fun(self: Room)
---@field MonitorName string
---@field MonitorPeri Monitor
---@field Players table<string, Player>
---@field Ready boolean
local Room = {}

---@return Room
function Room:new(room)
    room = room or {}   -- create object if user does not provide one
    setmetatable(room, self)
    self.__index = self

    room:setup()

    return room
end

function Room:setup()
    self.Players = {}
    self.Ready = false
    self.MonitorPeri = peripheral.wrap(self.MonitorName)

    self:updateMonitor()

    -- setup open and close functions
    if self.OutputInverted then
        self.CloseDoor = self.privateOpenDoor
        self.OpenDoor = self.privateCloseDoor
    else
        self.OpenDoor = self.privateOpenDoor
        self.CloseDoor = self.privateCloseDoor
    end

    -- close them, cause they are the wrong way round
    self:CloseDoor()
end

---@return string[]
function Room:getPlayers()
    return detector.getPlayersInCoords(self.Min, self.Max)
end

function Room:preparingTick()
    local currentPlayers = self:getPlayers()

    for playerName, _ in pairs(self.Players) do
        -- if player was previously tracked and is now gone, remove it
        if not has_value(currentPlayers, playerName) then
            self.Players[playerName] = nil
        end
    end

    for _, playerName in pairs(currentPlayers) do
        if self.Players[playerName] == nil then
            self.Players[playerName] = Player:new{
                name = playerName,
                colour = self.Colour
            }
        end
    end

    -- if no player left, unready and update monitor
    if not self:hasPlayer() then
        self.Ready = false
        self:updateMonitor()
    end
end

function Room:runningTick()
    -- if opened, close it when no player there
    if self.Ready then
        local currentPlayers = self:getPlayers()
        if next(currentPlayers) == nil then
            self.Ready = false
            self:updateMonitor()
            self:CloseDoor()
        end
    end
end

---@return boolean
function Room:hasPlayer()
    return next(self.Players) ~= nil
end

function Room:updateReadyStatus()
    if redstone.testBundledInput(redstoneName, self.RedstoneInput) then
        self.Ready = not self.Ready
        self:updateMonitor()
    end
end

function Room:updateMonitor()
    local color
    if self.Ready then
        color = colours.green
    else
        color = colours.red
    end

    self.MonitorPeri.setBackgroundColour(color)
    self.MonitorPeri.clear()
end

function Room:privateOpenDoor()
    redstone.setBundledOutput(
        redstoneName,
        colours.combine(
            redstone.getBundledOutput(redstoneName),
            self.RedstoneOutput
        )
    )
end

function Room:privateCloseDoor()
    redstone.setBundledOutput(
        redstoneName,
        colours.subtract(
            redstone.getBundledOutput(redstoneName),
            self.RedstoneOutput
        )
    )
end

---@type Room
local CyanRoom = Room:new{
    Colour = colours.cyan,
    Min = {x=-3708, y=64, z=-29},
    Max = {x=-3704, y=67, z=-32},
    RedstoneInput = colours.cyan,
    RedstoneOutput = colours.blue,
    OutputInverted = true,
    MonitorName = "monitor_4"
}

---@type Room
local RedRoom = Room:new{
    Colour = colours.red,
    Min = {x=-3690, y=64, z=-14},
    Max = {x=-3693, y=67, z=-18},
    RedstoneInput = colours.red,
    RedstoneOutput = colours.brown,
    OutputInverted = true,
    MonitorName = "monitor_3"
}

---@type Room
local YellowRoom = Room:new{
    Colour = colours.yellow,
    Min = {x=-3675, y=64, z=-32},
    Max = {x=-3679, y=67, z=-29},
    RedstoneInput = colours.yellow,
    RedstoneOutput = colours.orange,
    MonitorName = "monitor_2"
}

---@type Room
local LimeRoom = Room:new{
    Colour = colours.lime,
    Min = {x=-3693, y=64, z=-47},
    Max = {x=-3690, y=67, z=-43},
    RedstoneInput = colours.lime,
    RedstoneOutput = colours.green,
    MonitorName = "monitor_5"
}

---@type Room[]
Rooms = {
    CyanRoom,
    RedRoom,
    YellowRoom,
    LimeRoom
}
