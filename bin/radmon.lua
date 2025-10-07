local component = require("component")
local internet = require("internet")
local radsensor = component.radsensor
local redstone = component.redstone


local threshold = 5.0 
local webhook = "https://discord.com/api/webhooks/1423022743334420651/S4eEtHkcuHMPs4UHreer59U-v_ECNyPawV3bGAO03MA2hgp0souuNbqXG0-GTyArBLuW" -- replace with full one


local function sendWebhook(message)
  local data = string.format('{"content":"%s"}', message)
  local ok, err = pcall(function()
    local req = internet.request(webhook, data, {["Content-Type"]="application/json"})
    for chunk in req do end
  end)
  if not ok then
    print("Webhook error: " .. tostring(err))
  end
end

print(" Radiation monitoring")
redstone.setOutput(0, 15)

while true do
  local rads = radsensor.getRads()
  
  if rads >= threshold then
    redstone.setOutput(0, 0)
    sendWebhook(string.format(" Radiation levels high (%.2f rads)", rads))
    print("Radiation high:", rads)
  else
    redstone.setOutput(0, 15)
    print("Radiation safe:", rads)
  end

  os.sleep(5)
end
