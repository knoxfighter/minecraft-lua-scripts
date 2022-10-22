require("Player")

---@shape Game
---@field players Player[]
local game

---@shape Statistic
---@field games Game[]
local statistic

local function readAll(file)
    local f = assert(io.open(file, "rb"))
    local content = f:read("*a")
    f:close()
    return content
end

---@return Statistic
local function getStatistic()
    return textutils.unserialiseJSON(readAll("statistic.json"))
end

---@param stats Statistic
local function saveStatistic(stats)
    local json = textutils.serialiseJSON(stats)

    local file = io.open("statistic.json", "wb")
    file:write(json)
end

---@param players table<string, Player>
function addPlayersToStatistic(players)
    local stats = getStatistic()

    local p = {}
    for _, player in pairs(players) do
        table.insert(p, player)
    end

    table.insert(stats.games, {
        players = p
    })

    saveStatistic(stats)
end
