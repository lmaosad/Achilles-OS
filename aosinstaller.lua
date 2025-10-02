local fs = require("filesystem")
local shell = require("shell")
local internet = require("internet")

local base = "https://raw.githubusercontent.com/lmaosad/Achilles-OS/main/"

local files = {
  ["boot/init.lua"] = "boot/init.lua",
  ["bin/shell.lua"] = "bin/shell.lua",
  ["bin/radmon.lua"] = "bin/radmon.lua",
  ["bin/missilectl.lua"] = "bin/missilectl.lua",
  ["lib/utils.lua"] = "lib/utils.lua",
}

for urlPath, localPath in pairs(files) do
  print("Downloading " .. localPath .. "...")
  local f = io.open(localPath, "w")
  for chunk in internet.request(base .. urlPath) do
    f:write(chunk)
  end
  f:close()
end

print("Achilles OS installed! Reboot to begin.")
