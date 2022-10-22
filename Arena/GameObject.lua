require("Player")
require("globals")

local innerArenaRoom = {
    Min = { x = -3705, y = 64, z = -18 },
    Max = { x = -3679, y = 70, z = -44 }
}

local outerArenaRoom = {
    Min = { x = -3708, y = 64, z = -14 },
    Max = { x = -3675, y = 70, z = -47 }
}

---@alias State 0 | 1 | 2 | 3 | 4
State = {
    GamePreparing = 0,
    GameCountdown = 1,
    GamePreparing = 2,
    GameRunning = 3,
    GameStopped = 4,
}

---@class GameObject
---@field gameState State
---@field AlivePlayers table<string, Player>
---@field DeadPlayers table<string, Player>
---@field rooms Room[]
---@field nextRank number the next rank (aka max player, each time someone dies: -1)
GameObject = {}

---@return GameObject
function GameObject:new(o)
    o = o or {
        gameState = State.GamePreparing,
        rooms = Rooms,
        AlivePlayers = {},
        DeadPlayers = {},
        nextRank = 0
    }
    setmetatable(o, self)
    self.__index = self
    return o
end

function GameObject:GamePreparingTick()
    ---@type number
    local roomsWithPlayer = 0

    ---@type number[]
    local activeRooms = {}

    for k, v in pairs(self.rooms) do
        v:preparingTick()
        if v:hasPlayer() then
            roomsWithPlayer = roomsWithPlayer + 1
            table.insert(activeRooms, k)
        end
    end

    if roomsWithPlayer > 1 then
        -- check if all rooms are ready
        local allRoomsActive = true
        for _, roomId in pairs(activeRooms) do
            if not self.rooms[roomId].Ready then
                allRoomsActive = false
                break
            end
        end

        if allRoomsActive then
            -- transition to countdown
            self.gameState = State.GameCountdown

            -- get all players in all rooms
            for _, room in pairs(self.rooms) do
                for name, player in pairs(room.Players) do
                    self.AlivePlayers[name] = player
                    self.nextRank = self.nextRank + 1
                end
            end

            -- print prepare message
            chatBox.sendMessage("All players ready", "Arena")
            sleep(1.5)
            chatBox.sendMessage("Contestants:", "Arena")
            sleep(1.5)
            for playerName, player in pairs(self.AlivePlayers) do
                chatBox.sendFormattedMessage('{"text":"'..playerName..'", "color":"' .. colourToHex(player.colour) .. '"}', "Arena")
                sleep(1.5)
            end
            chatBox.sendFormattedMessage('{"text":"PREPARE TO FIGHT", "color": "red", "bold": true}', "Arena")
        end
    end

    sleep(2)
end

function GameObject:GameCountdownTick()
    -- random number between 1 and 3
    local num = math.random() * 2 + 1
    sleep(num)

    for _, room in pairs(self.rooms) do
        if room.Ready then
            room:OpenDoor()
        end
    end

    self.gameState = State.GameRunning
end

function GameObject:GameRunningTick()
    -- call rooms, so they close when game is running
    for _, room in pairs(self.rooms) do
        room:runningTick()
    end

    -- check if player is gone from main area
    local currentPlayers = detector.getPlayersInCoords(outerArenaRoom.Min, outerArenaRoom.Max)

    local playerAliveCount = 0

    for playerName, player in pairs(self.AlivePlayers) do
        if not has_value(currentPlayers, playerName) then
            -- this player is dead
            -- [DEBUG]
            --chatBox.sendMessage("Player " .. playerName .. " died with rank " .. self.nextRank, "Debug")

            self.DeadPlayers[playerName] = player
            self.AlivePlayers[playerName] = nil

            self.DeadPlayers[playerName].rank = self.nextRank
            self.nextRank = self.nextRank - 1
        else
            playerAliveCount = playerAliveCount + 1
        end
    end

    if playerAliveCount == 1 then
        -- we have a winner
        for playerName, player in pairs(self.AlivePlayers) do
            chatBox.sendMessage("AND THE WINNER IS " .. playerName, "Arena")

            -- transition to post-gamestate
            -- open all doors
            for _, room in pairs(self.rooms) do
                room:OpenDoor()
            end

            self.gameState= State.GameStopped
        end
    end

    sleep(0.05)
end

function GameObject:GameStoppedTick()
    -- if no player is left in the arena, close all doors and go back to preparing stage
    local currentPlayers = detector.getPlayersInCoords(innerArenaRoom.Min, innerArenaRoom.Max)

    local playersLeft = false
    for _, _ in pairs(currentPlayers) do
        playersLeft = true
        break
    end

    if not playersLeft then
        -- close doors again
        for _, room in pairs(self.rooms) do
            room:CloseDoor()
        end

        -- transition back to game preparing
        self.gameState = State.GamePreparing
    end

    sleep(0.05)
end

function GameObject:tick()
    if self.gameState == State.GamePreparing then
        self:GamePreparingTick()
    elseif self.gameState == State.GameCountdown then
        self:GameCountdownTick()
    elseif self.gameState == State.GameRunning then
        self:GameRunningTick()
    elseif self.gameState == State.GameStopped then
        self:GameStoppedTick()
    end
end

function GameObject:updateReadyStatus()
    if self.gameState == State.GamePreparing then
        for _, room in pairs(self.rooms) do
            room:updateReadyStatus()
        end
    end
end
