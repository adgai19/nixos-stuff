vim.lsp.set_log_level("info")
vim.g["lsp_log_verbose"] = 1
require("adgai.lsp.serverconfig")
require("adgai.lsp.guttersigns")
require("adgai.lsp.handlers")
require("adgai.lsp.rename")
print("hello world")
return { on_attach = require("adgai.lsp.on_attach").on_attach }
