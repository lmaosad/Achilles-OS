local term = require("term")
local fs = require("filesystem")
local shell = {}

while true do
  io.write("Achilles> ")
  local cmd = io.read()
  
  if cmd == "exit" then
    print("Shutting down Achilles OS...")
    os.exit()
  elseif cmd == "radmon" then
    shell.execute("/bin/radmon.lua")
  elseif cmd == "missilectl" then
    shell.execute("/bin/missilectl.lua")
  else
    local ok, err = shell.execute(cmd)
    if not ok then
      print("Unknown command:", cmd)
    end
  end
end
