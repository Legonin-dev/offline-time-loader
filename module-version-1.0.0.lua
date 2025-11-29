local module = {}
local mainUserData = game:GetService("DataStoreService"):GetDataStore("offline_data")

function getCurrentDateTime()
	local dateTable = os.date("*t")
	return {
		year = dateTable.year,
		month = dateTable.month,
		day = dateTable.day,
		hour = dateTable.hour,
		minute = dateTable.min,
		second = dateTable.sec
	}
end

function module.getPlayerOfflineTime(plr)
	local getUser = mainUserData:GetAsync(plr.UserId)
	if getUser ~= nil then
		if getUser.lastleave ~= nil then
			local lastleave = getUser.lastleave
			local current = getCurrentDateTime()
			local seconds = 0

			seconds += (current.year - lastleave.year) * 31536000
			seconds += (current.month - lastleave.month) * 2592000
			seconds += (current.day - lastleave.day) * 86400
			seconds += (current.hour - lastleave.hour) * 3600
			seconds += (current.minute - lastleave.minute) * 60
			seconds += (current.second - lastleave.second)

			return seconds
		end
	end
end

game.Players.PlayerAdded:Connect(function(plr)
	local getUser = mainUserData:GetAsync(plr.UserId)
	if getUser == nil then
		local table = {
			lastleave = getCurrentDateTime(),
		}
		mainUserData:SetAsync(plr.UserId,table)
	end
end)

game.Players.PlayerRemoving:Connect(function(plr)
	local getUser = mainUserData:GetAsync(plr.UserId)
	if getUser ~= nil then
		local table = {
			lastleave = getCurrentDateTime(),
		}
		mainUserData:SetAsync(plr.UserId,table)
	end
end)
return module
