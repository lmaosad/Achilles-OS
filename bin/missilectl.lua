local codes = {"YOURMOM", "U235", "AMEA"} 
local entered = {}

print("=== Nuclear Launch Console ===")
print("Enter all 3 authorization codes to launch missile.")

while #entered < 3 do
  io.write("Enter code " .. (#entered+1) .. ": ")
  local code = io.read()
  if code == codes[#entered+1] then
    table.insert(entered, code)
    print("Code accepted.")
  else
    print("Invalid code. Resetting sequence.")
    entered = {}
  end
end

print(" All codes accepted. Launching missile...")


local component = require("component")
local redstone = component.redstone
redstone.setOutput(0, 15)
os.sleep(2)
redstone.setOutput(0, 0)

print("Missile launched!")
