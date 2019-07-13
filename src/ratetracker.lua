require("serialize")
	
local currentStats = {}

local data = {}
data.start = os.time()
data.totalxp = 0

function normalXP(name,line,map)
	local xp = tonumber(map['1']) + tonumber(map['2'] or 0)
	addxp(xp)
end
function rareXP(name,line,map)
	local xp = tonumber(map['1'] or 0) 
	addxp(xp)
end
function shDoubleXP(name,line,map)

	local xp = tonumber(map['1'] or 0) 
	addxp(xp)
end
function dailyDoubleXP(name,line,map)

	local xp = tonumber(map['1'] or 0) 
	addxp(xp)
end
function donateDoubleXP(name,line,map)

	local xp = tonumber(map['1'] or 0) 
	addxp(xp)
end
function addxp(xp) 
	data.totalxp = data.totalxp + xp
	--Note(string.format("Tallying xp, %d. Total = %d.",xp, data.totalxp))
	WindowXCallS("rate_track","updateInfo",serialize(data))

end
		
function updateStat(stats)
	--Note("\nstats recieved\n")
	--Note("\nstats recieved\n")
	--WindowXCallS("rate_track","updateInfo",serialize(data))
end
		
function loadInfo(data)
	--Note("\nloading stats...\n")
	WindowXCallS("rate_track","updateInfo",serialize(data))
end
