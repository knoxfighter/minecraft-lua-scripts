---@class Player
---@field name string
---@field colour colours
---@field rank number
Player = {}

---@return Player
function Player:new(player)
    player = player or {}   -- create object if user does not provide one
    setmetatable(player, self)
    self.__index = self
    return player
end
