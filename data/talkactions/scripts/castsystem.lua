function onSay(player, words, param)
	if words == "!cast" then
		local t = param:split(",")
		local status = t[1]
		local password = t[2]
		
		if status == "on" or status == "start" or status == "begin" then
			if password then
				if player:startLiveCast(password) then
					player:sendTextMessage(MESSAGE_INFO_DESCR, "You have started casting your gameplay.")
				else
					player:sendCancelMessage("You're already casting your gameplay.")
				end
			else
				if player:startLiveCast() then
					player:sendTextMessage(MESSAGE_INFO_DESCR, "You have started casting your gameplay.")
				end
			end
		elseif status == "stop" or status == "end" or status == "close" or status == "off" then
			if player:stopLiveCast() then
				player:sendTextMessage(MESSAGE_INFO_DESCR, "You have stopped casting your gameplay.")
			else
				player:sendCancelMessage("You're not casting your gameplay.")
			end
		end
	end
	return false
end
