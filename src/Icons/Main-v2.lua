-- Icons Main v2
-- Loaded from GitHub
local HttpService = game:GetService("HttpService")
local success, icons = pcall(function()
	return HttpService:JSONDecode(game:HttpGet("https://raw.githubusercontent.com/Footagesus/Icons/main/Main-v2.json"))
end)

return success and icons or {}
