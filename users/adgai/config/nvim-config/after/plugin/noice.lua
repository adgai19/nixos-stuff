require("noice").setup({
  presets={
    inc_rename=true,
    command_palette=true
  },
   routes = {
      {
        filter = {
          event = "msg_show",
          kind = "",
          find = "written",
        },
        opts = { skip = true },
      },
    },
})
