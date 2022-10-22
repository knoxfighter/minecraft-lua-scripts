require("globals")
require("GameObject")
require("Player")
require("Room")

local gameObject = GameObject:new(nil)

local function mainLoop()
	-- main loop
	while true do
		gameObject:tick()
	end
end

local function redstoneChecker()
	while true do
		os.pullEvent("redstone")

		gameObject:updateReadyStatus()
	end
end

parallel.waitForAny(mainLoop, redstoneChecker)
