local chatBoxSide = "right"

local chatBox = peripheral.wrap(chatBoxSide)

local lastDay = 0

while true do
	local currentDay = os.day()
	if currentDay > lastDay then
		-- der minus Wert ist gegeben durch Erfahrung
		local a = (currentDay - 1) % 36
		if a == 0 then
			chatBox.sendFormattedMessage('{"text":"HEUTE ist Sonnenfinsternis!", "color":"#00FFFF"}', "Sorcery")
		else
			chatBox.sendFormattedMessage('{"text":"In ' .. (36-a) .. ' Tagen ist Sonnenfinsternis.", "color":"#FFFFFF"}', "Sorcery")
		end
		
		lastDay = currentDay
	end
	
	sleep(30)
end

