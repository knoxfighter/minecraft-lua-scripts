require("Player")

---@param players table<string, Player>
function addPlayersToStatistic(players)
    local file = assert(io.open("statistic.csv", "a"))

    -- time
    file:write(os.time("utc"))
    file:write(",")

    for playerName, player in pairs(players) do
        -- player
        file:write(player.name)
        file:write(",")

        file:write(player.colour)
        file:write(",")

        file:write(player.rank)
        file:write(",")
    end

    file:write("\n")

    file:close()
end
