local ck = require("tools.cyclekeymaps")
local keymapTable = {}
keymapTable.normal = { { "n", "n", "j" }, { "n", "e", "k" } }
keymapTable.qf = { { "n", "n", "cnext" } }
ck.addKeymap(keymapTable)
