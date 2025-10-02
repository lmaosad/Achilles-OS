local shell = require("shell")
local term = require("term")

term.clear()
print("=== Achilles OS ===")
print("Loading system...")

-- Run the shell after boot
shell.execute("/bin/shell.lua")
