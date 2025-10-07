local shell = require("shell")
local term = require("term")

term.clear()
print("=== Achilles OS ===")
print("Loading system...")

shell.execute("/bin/shell.lua")
