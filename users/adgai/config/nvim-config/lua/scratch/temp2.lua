function P(items)
	print(vim.inspect(items))
end
local harpoon = require("harpoon")

-- local temp=harpoon.set_term_cmds(temp)
-- P(harpoon)
-- P(harpoon.get_global_settings())

-- P(temp.projects[vim.loop.cwd()].term.cmds)

-- temp.projects[vim.loop.cwd()].term.cmds
-- local temp1={}
-- P(temp1)
-- for idx,val in ipairs(temp) do
--   temp1[idx]=val
-- end
--
-- P(temp1)

-- local temp={"ls", "la"}
--
-- local cmds={"ls", "ls -a","pwd"}
-- local curCmds=harpoon.set_term_cmds(temp).projects[vim.loop.cwd()].term.cmds
-- for idx,val in ipairs(cmds) do
--   curCmds[idx]=val
-- end
--
-- P(curCmds)
local cmds = { "ls", "ls -a" }
harpoon.set_term_cmds(cmds)
harpoon.print_config()
