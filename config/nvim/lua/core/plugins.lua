-- Automatically install lazy
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- Use a protected call so we don't error out on first use
local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
  vim.api.nvim_err_writeln "Failed to load lazy"
  return
end

lazy.setup({

  ----------------------------------------------------------------------
  --                               LSP                                --
  ----------------------------------------------------------------------

  -- Quickstart configurations for the Neovim LSP client.
  {
    "neovim/nvim-lspconfig",
    commit = "b6b34b9acf84949f0ac1c00747765e62b81fb38d",
  },

  -- Use Neovim as a language server to inject LSP diagnostics, code actions,
  -- and more via Lua.
  {
    "jose-elias-alvarez/null-ls.nvim",
    commit = "bbaf5a96913aa92281f154b08732be2f57021c45",
  },

  -- Easily install and manage LSP servers, DAP servers, linters, and
  -- formatters.
  {
    "williamboman/mason.nvim",
    commit = "664c987c3b14d2262a4e580f993a3e5045baded0",
  },

  -- Extension to mason.nvim that makes it easier to use lspconfig with
  -- mason.nvim
  {
    "williamboman/mason-lspconfig.nvim",
    commit = "d381fcb78d7a562c3244e1c8f76406954649db36",
  },

  -- Extension to mason.nvim that makes it easier to use null-ls with
  -- mason.nvim
  {
    "jayp0521/mason-null-ls.nvim",
    commit = "73c68abdf65279e41526eb152876511a8ae84ea2",
  },

  -- Another lsp progress status for Neovim.
  {
    "linrongbin16/lsp-progress.nvim",
    commit = "28ae633079d8a42f4da3038197dcd6a50af0ef75",
  },

  ----------------------------------------------------------------------
  --                            Completion                            --
  ----------------------------------------------------------------------

  -- Completion plugin for Neovim
  {
    "hrsh7th/nvim-cmp",
    commit = "e1f1b40790a8cb7e64091fb12cc5ffe350363aa0",
  },

  -- A nvim-cmp source for Neovim builtin LSP client.
  {
    "hrsh7th/cmp-nvim-lsp",
    commit = "44b16d11215dce86f253ce0c30949813c0a90765",
  },

  -- A nvim-cmp source for luasnip completion.
  {
    "saadparwaiz1/cmp_luasnip",
    commit = "18095520391186d634a0045dacaa346291096566",
  },

  -- A nvim-cmp source for filesystem paths.
  {
    "hrsh7th/cmp-path",
    commit = "91ff86cd9c29299a64f968ebb45846c485725f23",
  },

  -- A nvim-cmp source for buffer words.
  {
    "hrsh7th/cmp-buffer",
    commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa",
  },

  -- A nvim-cmp source for the Neovim Lua API.
  {
    "hrsh7th/cmp-nvim-lua",
    commit = "f12408bdb54c39c23e67cab726264c10db33ada8",
  },

  -- A nvim-cmp source for displaying function signatures.
  {
    "hrsh7th/cmp-nvim-lsp-signature-help",
    commit = "3d8912ebeb56e5ae08ef0906e3a54de1c66b92f1",
  },

  -- A nvim-cmp source for nerdfont icons.
  {
    "chrisgrieser/cmp-nerdfont",
    commit = "853a946eda00016f60c0602a20d8595c6eb074a6",
  },

  -- A nvim-cmp source for look.
  {
    "octaltree/cmp-look",
    commit = "b39c50bcdf6199dddda56adc466c2bd9c951a960",
  },

  -- A nvim-cmp source for math calculation.
  {
    "hrsh7th/cmp-calc",
    commit = "50792f34a628ea6eb31d2c90e8df174671e4e7a0",
  },

  -- A nvim-cmp source for vim's cmdline.
  {
    "hrsh7th/cmp-cmdline",
    commit = "8ee981b4a91f536f52add291594e89fb6645e451",
  },

  ----------------------------------------------------------------------
  --                  Programming Languages Support                   --
  ----------------------------------------------------------------------

  -- Build flutter and dart applications in Neovim using the native lsp.
  {
    "akinsho/flutter-tools.nvim",
    commit = "5de1b5fca5e07849b2626c8aeda81d2ba6362af1",
  },

  -- Tools for better development in rust using Neovim's builtin LSP.
  {
    "simrat39/rust-tools.nvim",
    commit = "71d2cf67b5ed120a0e31b2c8adb210dd2834242f",
  },

  ----------------------------------------------------------------------
  --                              Syntax                              --
  ----------------------------------------------------------------------

  -- Neovim Treesitter configurations and abstraction layer.
  {
    "nvim-treesitter/nvim-treesitter",
    commit = "d49ba798c95398e62321b40041e8ac4654fea251",
  },

  -- A plugin for adding/changing/deleting surrounding delimiter pairs.
  {
    "kylechui/nvim-surround",
    commit = "10b20ca7d9da1ac8df8339e140ffef94f9ab3b18",
  },

  ----------------------------------------------------------------------
  --                             Snippet                              --
  ----------------------------------------------------------------------

  -- A snippet engine for Neovim written in Lua.
  {
    "L3MON4D3/LuaSnip",
    commit = "c7984d1cca3d8615e4daefc196597872a0b8d590",
  },

  -- Set of preconfigured snippets for different languages.
  {
    "rafamadriz/friendly-snippets",
    commit = "5749f093759c29e3694053d048ceb940fe12c3d3",
  },

  ----------------------------------------------------------------------
  --                           Fuzzy Finder                           --
  ----------------------------------------------------------------------

  -- A highly extendable fuzzy finder over lists.
  {
    "nvim-telescope/telescope.nvim",
    commit = "6074847b6ee4b725747c8fc540d9b6b128ac8a12",
  },

  ----------------------------------------------------------------------
  --                          File Explorer                           --
  ----------------------------------------------------------------------

  -- Neo-tree is a Neovim plugin to browse the file system and other tree like
  -- structures in whatever style suits you, including sidebars, floating
  -- windows, netrw split style, or all of them at once.
  {
    "nvim-neo-tree/neo-tree.nvim",
    commit = "70d3daa22bf24de9e3e284ac659506b1374e3ae2",
  },

  ----------------------------------------------------------------------
  --                             Project                              --
  ----------------------------------------------------------------------

  -- An all in one Neovim plugin that provides superior project management.
  {
    "ahmedkhalf/project.nvim",
    commit = "8c6bad7d22eef1b71144b401c9f74ed01526a4fb",
  },

  ----------------------------------------------------------------------
  --                              Color                               --
  ----------------------------------------------------------------------

  -- A high-performance color highlighter for Neovim which has no external
  -- dependencies.
  {
    "NvChad/nvim-colorizer.lua",
    commit = "dde3084106a70b9a79d48f426f6d6fec6fd203f7",
  },

  ----------------------------------------------------------------------
  --                           Colorscheme                            --
  ----------------------------------------------------------------------

  -- Warm mid-tone dark theme to show off your vibrant self! with support for
  -- native LSP, Tree-sitter, and more 🍨!
  {
    "catppuccin/nvim",
    commit = "8d02781a638123394f9bc160aad47a9560a113f9",
  },

  ----------------------------------------------------------------------
  --                          Bars and Lines                          --
  ----------------------------------------------------------------------

  -- A VS Code like winbar.
  {
    "utilyre/barbecue.nvim",
    commit = "cd7e7da622d68136e13721865b4d919efd6325ed",
  },

  -- A simple statusline/winbar component that uses LSP to show your current
  -- code context.
  {
    "SmiteshP/nvim-navic",
    commit = "32cff45f1c84bec5e2a7bf15c0f3c6739b64c85d",
  },

  ----------------------------------------------------------------------
  --                            Statusline                            --
  ----------------------------------------------------------------------

  -- A blazing fast and easy to configure Neovim statusline.
  {
    "nvim-lualine/lualine.nvim",
    commit = "05d78e9fd0cdfb4545974a5aa14b1be95a86e9c9",
  },

  ----------------------------------------------------------------------
  --                            Cursorline                            --
  ----------------------------------------------------------------------

  -- Highlight the word under the cursor.
  {
    "RRethy/vim-illuminate",
    commit = "a2907275a6899c570d16e95b9db5fd921c167502",
  },

  ----------------------------------------------------------------------
  --                             Startup                              --
  ----------------------------------------------------------------------

  -- A fast and highly customizable greeter for Neovim.
  {
    "goolord/alpha-nvim",
    commit = "9e33db324b8bb7a147bce9ea5496686ee859461d",
  },

  ----------------------------------------------------------------------
  --                               Icon                               --
  ----------------------------------------------------------------------

  -- A Lua fork of vim-devicons.
  {
    "nvim-tree/nvim-web-devicons",
    commit = "9ab9b0b894b2388a9dbcdee5f00ce72e25d85bf9",
  },

  ----------------------------------------------------------------------
  --                             Utility                              --
  ----------------------------------------------------------------------

  -- Automatically create missing directories when saving a file.
  {
    "jghauser/mkdir.nvim",
    commit = "c55d1dee4f099528a1853b28bb28caa802eba217",
  },

  -- A fancy, configurable, notification manager for Neovim.
  {
    "rcarriga/nvim-notify",
    commit = "ea9c8ce7a37f2238f934e087c255758659948e0f",
  },

  -- Improve the built-in vim.ui interfaces with telescope, fzf, etc.
  {
    "stevearc/dressing.nvim",
    commit = "e6eff7a5a950a853c3903d906dbcea03f778db5f",
  },

  -- Display a line as colorcolumn.
  {
    "lukas-reineke/virt-column.nvim",
    commit = "93b40ea038f676f5a72d7d1f2336fe7b051fc0ce",
  },

  -- Delete Neovim buffers without losing window layout.
  {
    "famiu/bufdelete.nvim",
    commit = "8d15a0a3189b02ac7ad9dd6dc089cc62edf095c6",
  },

  -- Pomodoro time tracker for NeoVim written entirely in LUA
  {
    "dbinagi/nomodoro",
    commit = "42c6775da86558ca96b5d20b7782f442187ca8d8",
  },

  ----------------------------------------------------------------------
  --                       Terminal Integration                       --
  ----------------------------------------------------------------------

  -- A Neovim Lua plugin to help easily manage multiple terminal windows.
  {
    "akinsho/toggleterm.nvim",
    commit = "cf146a267a6a7db62b1e2aff40414b20081048a1",
  },

  ----------------------------------------------------------------------
  --                      Neovim Lua Development                      --
  ----------------------------------------------------------------------

  -- Useful lua functions used by lots of plugins.
  {
    "nvim-lua/plenary.nvim",
    commit = "36aaceb6e93addd20b1b18f94d86aecc552f30c4",
  },

  -- UI Component Library.
  {
    "MunifTanjim/nui.nvim",
    commit = "d146966a423e60699b084eeb28489fe3b6427599",
  },

  ----------------------------------------------------------------------
  --                      Dependency management                       --
  ----------------------------------------------------------------------

  -- Rust dependency management for Cargo.toml.
  {
    "Saecki/crates.nvim",
    commit = "258961973c2cbef5717d4a726c68a0730fb0f94b",
  },

  ----------------------------------------------------------------------
  --                               Git                                --
  ----------------------------------------------------------------------

  -- Git integration: signs, hunk actions, blame, etc.
  {
    "lewis6991/gitsigns.nvim",
    commit = "a36bc3360d584d39b4fb076d855c4180842d4444",
  },

  --  Single tabpage interface for easily cycling through diffs for all
  --  modified files for any git rev.
  {
    "sindrets/diffview.nvim",
    commit = "b3a763f8c7810b352226c95faa7d3ac9fb93b8d9",
  },

  ----------------------------------------------------------------------
  --                              Motion                              --
  ----------------------------------------------------------------------

  -- Add fancy sub-cursor to signcolumn to show your scroll or jump direction.
  {
    "gen740/SmoothCursor.nvim",
    commit = "b61173fb107455f18099715b88d86002579f2736",
  },

  ----------------------------------------------------------------------
  --                            Keybinding                            --
  ----------------------------------------------------------------------

  -- Neovim plugin that shows a popup with possible keybindings of the command
  -- you started typing.
  {
    "folke/which-key.nvim",
    commit = "d871f2b664afd5aed3dc1d1573bef2fb24ce0484",
  },

  -- Create shortcuts to escape insert mode without getting delay.
  {
    "max397574/better-escape.nvim",
    commit = "7031dc734add47bb71c010e0551829fa5799375f",
  },

  ----------------------------------------------------------------------
  --                         Editing Support                          --
  ----------------------------------------------------------------------

  -- A minimalist autopairs for Neovim written by Lua.
  {
    "windwp/nvim-autopairs",
    commit = "e8f7dd7a72de3e7b6626c050a802000e69d53ff0",
  },

  -- Rainbow delimiters for Neovim through Tree-sitter
  {
    "HiPhish/nvim-ts-rainbow2",
    commit = "1c7980dadb9d702d063c968cc240e282bb574995",
  },

  -- Shows floating hover with the current function/block context.
  {
    "nvim-treesitter/nvim-treesitter-context",
    commit = "6eccc445394df5ab9b1c1e2c445c033949a6a784",
  },

  -- Peek lines in a non-obtrusive way.
  {
    "nacro90/numb.nvim",
    commit = "2c89245d1185e02fec1494c45bc765a38b6b40b3",
  },

  -- A telescope extension to visualize your undo tree and fuzzy-search changes
  -- in it.
  {
    "debugloop/telescope-undo.nvim",
    commit = "3dec002ea3e7952071d26fbb5d01e2038a58a554",
  },

  ----------------------------------------------------------------------
  --                             Comment                              --
  ----------------------------------------------------------------------

  -- Smart and Powerful comment plugin for Neovim.
  {
    "numToStr/Comment.nvim",
    commit = "176e85eeb63f1a5970d6b88f1725039d85ca0055",
  },

  -- Highlight, list and search todo comments in your projects.
  {
    "folke/todo-comments.nvim",
    commit = "09b0b17d824d2d56f02ff15967e8a2499a89c731",
  },

  -- Adds a comment frame based on the source file.
  {
    "s1n7ax/nvim-comment-frame",
    commit = "7a7d34ee7a236a89ffe5674bf794358ee12a7df8",
  },

  ----------------------------------------------------------------------
  --                              Indent                              --
  ----------------------------------------------------------------------

  -- IndentLine replacement in Lua with more features and treesitter support.
  {
    "lukas-reineke/indent-blankline.nvim",
    commit = "7075d7861f7a6bbf0de0298c83f8a13195e6ec01",
  },
}, {
  ui = { border = "rounded" },
  performance = {
    rtp = {
      disabled_plugins = {
        "2html_plugin",
        "getscript",
        "getscriptPlugin",
        "gzip",
        "logipat",
        "netrw",
        "netrwPlugin",
        "netrwSettings",
        "netrwFileHandlers",
        "matchit",
        "tar",
        "tarPlugin",
        "rrhelper",
        "spellfile_plugin",
        "vimball",
        "vimballPlugin",
        "zip",
        "zipPlugin",
        "tutor",
        "rplugin",
        "syntax",
        "synmenu",
        "optwin",
        "compiler",
        "bugreport",
        "ftplugin",
      },
    },
  },
})
