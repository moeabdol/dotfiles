local history_path = os.getenv("HOME") .. "/.local/state/mpv/history.log"

mp.register_event("file-loaded", function()
	local title = mp.get_property("media-title") or ""
	local path = mp.get_property("path") or ""
	local f = io.open(history_path, "a")
	if f then
		f:write(os.date("%Y-%m-%d %H:%M:%S") .. " | " .. title .. " | " .. path .. "\n")
		f:close()
	end
end)
