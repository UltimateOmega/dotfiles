local icons = require "core.icons"

require("ibl").setup {
  indent = {
    char = icons.indent_line,
    tab_char = icons.indent_line,
  },
  scope = { enabled = false },
  exclude = {
    filetypes = {
      "help",
      "lspinfo",
      "alpha",
      "checkhealth",
      "dashboard",
      "man",
      "neo-tree",
      "Trouble",
      "trouble",
      "lazy",
      "mason",
      "notify",
      "toggleterm",
      "lazyterm",
    },
  },
}