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

lazy.setup {

  ----------------------------------------------------------------------
  --                               LSP                                --
  ----------------------------------------------------------------------

  -- Quickstart configurations for the Neovim LSP client.
  {
    "neovim/nvim-lspconfig",
    commit = "27e6eb27f31d1ef41427e1008029284c02dc856f",
  },

  -- Use Neovim as a language server to inject LSP diagnostics, code actions,
  -- and more via Lua.
  {
    "jose-elias-alvarez/null-ls.nvim",
    commit = "ab4e9261843236d773f49a23fcfb3d2167a3c500",
  },

  -- Standalone UI for LSP progress.
  {
    "j-hui/fidget.nvim",
    commit = "9dc6d15fdb877b2fb09ea0ba2dfde9beccb5965a",
  },

  -- Easily install and manage LSP servers, DAP servers, linters, and
  -- formatters.
  {
    "williamboman/mason.nvim",
    commit = "47e9f6bc4c5bb3d6453949f07b8280c725ef7490",
  },

  -- Extension to mason.nvim that makes it easier to use lspconfig with
  -- mason.nvim
  {
    "williamboman/mason-lspconfig.nvim",
    commit = "d2d55255a0295ba0a75ef2dd5535e4c89c46e773",
  },

  -- Extension to mason.nvim that makes it easier to use null-ls with
  -- mason.nvim
  {
    "jayp0521/mason-null-ls.nvim",
    commit = "13c6ab4a4f810cbbb1799a9cf4d4a27fd862d885",
  },

  ----------------------------------------------------------------------
  --                            Completion                            --
  ----------------------------------------------------------------------

  -- Completion plugin for Neovim
  {
    "hrsh7th/nvim-cmp",
    commit = "aae0c3e4e778ca4be6fabc52e388cbd5b844b7a5",
  },

  -- A nvim-cmp source for Neovim builtin LSP client.
  {
    "hrsh7th/cmp-nvim-lsp",
    commit = "0e6b2ed705ddcff9738ec4ea838141654f12eeef",
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
    commit = "f3491638d123cfd2c8048aefaf66d246ff250ca6",
  },

  -- A nvim-cmp source for displaying function signatures.
  {
    "hrsh7th/cmp-nvim-lsp-signature-help",
    commit = "3d8912ebeb56e5ae08ef0906e3a54de1c66b92f1",
  },

  -- A nvim-cmp source for nerdfont icons.
  {
    "chrisgrieser/cmp-nerdfont",
    commit = "989baa81b3cb82890f232ae0b58dbea13ebf8f23",
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
    commit = "23c51b2a3c00f6abc4e922dbd7c3b9aca6992063",
  },

  ----------------------------------------------------------------------
  --                  Programming Languages Support                   --
  ----------------------------------------------------------------------

  -- Build flutter and dart applications in Neovim using the native lsp.
  {
    "akinsho/flutter-tools.nvim",
    commit = "d67caa7dd17eccb89bfda1c0657d0723e339ef60",
  },

  -- Tools for better development in rust using Neovim's builtin LSP.
  {
    "simrat39/rust-tools.nvim",
    commit = "bd1aa99ffb911a1cf99b3fcf3b44c0391c57e3ef",
  },

  ----------------------------------------------------------------------
  --                              Syntax                              --
  ----------------------------------------------------------------------

  -- Neovim Treesitter configurations and abstraction layer.
  {
    "nvim-treesitter/nvim-treesitter",
    commit = "f6df07be122de665fb363476cc3680c90f5bdf05",
  },

  -- A plugin for adding/changing/deleting surrounding delimiter pairs.
  {
    "kylechui/nvim-surround",
    commit = "90821ad682aac189cd0a38fd83fc96f0cbcc5d29",
  },

  ----------------------------------------------------------------------
  --                             Snippet                              --
  ----------------------------------------------------------------------

  -- A snippet engine for Neovim written in Lua.
  {
    "L3MON4D3/LuaSnip",
    commit = "9bff06b570df29434a88f9c6a9cea3b21ca17208",
  },

  -- Set of preconfigured snippets for different languages.
  {
    "rafamadriz/friendly-snippets",
    commit = "80597f3ea824946c87fd29f82b5ed4f24ef473f3",
  },

  ----------------------------------------------------------------------
  --                           Fuzzy Finder                           --
  ----------------------------------------------------------------------

  -- A highly extendable fuzzy finder over lists.
  {
    "nvim-telescope/telescope.nvim",
    commit = "203bf5609137600d73e8ed82703d6b0e320a5f36",
  },

  ----------------------------------------------------------------------
  --                          File Explorer                           --
  ----------------------------------------------------------------------

  -- File Browser extension for telescope.nvim.
  {
    "nvim-telescope/telescope-file-browser.nvim",
    commit = "304508fb7bea78e3c0eeddd88c4837501e403ae8",
  },

  ----------------------------------------------------------------------
  --                             Project                              --
  ----------------------------------------------------------------------

  -- An all in one Neovim plugin that provides superior project management.
  {
    "ahmedkhalf/project.nvim",
    commit = "685bc8e3890d2feb07ccf919522c97f7d33b94e4",
  },

  ----------------------------------------------------------------------
  --                              Color                               --
  ----------------------------------------------------------------------

  -- A high-performance color highlighter for Neovim which has no external
  -- dependencies.
  {
    "NvChad/nvim-colorizer.lua",
    commit = "760e27df4dd966607e8fb7fd8b6b93e3c7d2e193",
  },

  ----------------------------------------------------------------------
  --                           Colorscheme                            --
  ----------------------------------------------------------------------

  -- NvChad's base46 theme plugin
  {
    "NvChad/base46",
    commit = "be301b2cd309394dfa62e8c569250e4fb58dd763",
  },

  ----------------------------------------------------------------------
  --                            Statusline                            --
  ----------------------------------------------------------------------

  -- A blazing fast and easy to configure Neovim statusline.
  {
    "nvim-lualine/lualine.nvim",
    commit = "0050b308552e45f7128f399886c86afefc3eb988",
  },

  ----------------------------------------------------------------------
  --                            Cursorline                            --
  ----------------------------------------------------------------------

  -- Highlight the word under the cursor.
  {
    "RRethy/vim-illuminate",
    commit = "49062ab1dd8fec91833a69f0a1344223dd59d643",
  },

  ----------------------------------------------------------------------
  --                             Startup                              --
  ----------------------------------------------------------------------

  -- A fast and highly customizable greeter for Neovim.
  {
    "goolord/alpha-nvim",
    commit = "da15a10f8875fed409241816bacd9378c5696449",
  },

  ----------------------------------------------------------------------
  --                               Icon                               --
  ----------------------------------------------------------------------

  -- A Lua fork of vim-devicons.
  {
    "nvim-tree/nvim-web-devicons",
    commit = "4475fe5ffd32360fb6c351abbfee8d7529a511e6",
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
    commit = "bdd647f61a05c9b8a57c83b78341a0690e9c29d7",
  },

  -- Improve the built-in vim.ui interfaces with telescope, fzf, etc.
  {
    "stevearc/dressing.nvim",
    commit = "db716a0f1279f79a886c0e0b6ab3c3d5ffdb42fe",
  },

  -- Display a line as colorcolumn.
  {
    "lukas-reineke/virt-column.nvim",
    commit = "93b40ea038f676f5a72d7d1f2336fe7b051fc0ce",
  },

  -- Delete Neovim buffers without losing window layout.
  {
    "famiu/bufdelete.nvim",
    commit = "f79e9d186b42fba5f1b1362006e7c70240db97a4",
  },

  ----------------------------------------------------------------------
  --                       Terminal Integration                       --
  ----------------------------------------------------------------------

  -- A Neovim Lua plugin to help easily manage multiple terminal windows.
  {
    "akinsho/toggleterm.nvim",
    commit = "19aad0f41f47affbba1274f05e3c067e6d718e1e",
  },

  ----------------------------------------------------------------------
  --                      Neovim Lua Development                      --
  ----------------------------------------------------------------------

  -- Useful lua functions used by lots of plugins.
  {
    "nvim-lua/plenary.nvim",
    commit = "9a0d3bf7b832818c042aaf30f692b081ddd58bd9",
  },

  ----------------------------------------------------------------------
  --                      Dependency management                       --
  ----------------------------------------------------------------------

  -- Rust dependency management for Cargo.toml.
  {
    "Saecki/crates.nvim",
    commit = "3fc7ddac13ddf65914a733ef074317c4c72ef05b",
  },

  ----------------------------------------------------------------------
  --                               Git                                --
  ----------------------------------------------------------------------

  -- Git integration: signs, hunk actions, blame, etc.
  {
    "lewis6991/gitsigns.nvim",
    commit = "f29f0b22fd66c910b892aae3bc18a4872c002738",
  },

  ----------------------------------------------------------------------
  --                              Motion                              --
  ----------------------------------------------------------------------

  -- Add fancy sub-cursor to signcolumn to show your scroll or jump direction.
  {
    "gen740/SmoothCursor.nvim",
    commit = "79f02173317a76ab406d182ac89b20b59f5e34fe",
  },

  ----------------------------------------------------------------------
  --                            Keybinding                            --
  ----------------------------------------------------------------------

  -- Neovim plugin that shows a popup with possible keybindings of the command
  -- you started typing.
  {
    "folke/which-key.nvim",
    commit = "5224c261825263f46f6771f1b644cae33cd06995",
  },

  -- Create shortcuts to escape insert mode without getting delay.
  {
    "max397574/better-escape.nvim",
    commit = "6fed33809cde3b416087fc540ad9eb17ec470193",
  },

  ----------------------------------------------------------------------
  --                            Scrollbar                             --
  ----------------------------------------------------------------------

  -- Extensible scrollbar that shows diagnostics and search results.
  {
    "petertriho/nvim-scrollbar",
    commit = "6a2065fbcd032075a06d2ab54508b69842bc4496",
  },

  ----------------------------------------------------------------------
  --                         Editing Support                          --
  ----------------------------------------------------------------------

  -- A minimalist autopairs for Neovim written by Lua.
  {
    "windwp/nvim-autopairs",
    commit = "45ae3122a4c7744db41298b41f9f5a3f092123e6",
  },

  -- Shows floating hover with the current function/block context.
  {
    "nvim-treesitter/nvim-treesitter-context",
    commit = "cacee4828152dd3a83736169ae61bbcd29a3d213",
  },

  -- Peek lines in a non-obtrusive way.
  {
    "nacro90/numb.nvim",
    commit = "d95b7ea62e320b02ca1aa9df3635471a88d6f3b1",
  },

  -- Reopen files at your last edit position.
  {
    "ethanholz/nvim-lastplace",
    commit = "65c5d6e2501a3af9c2cd15c6548e67fa035bf640",
  },

  -- A telescope extension to visualize your undo tree and fuzzy-search changes
  -- in it.
  {
    "debugloop/telescope-undo.nvim",
    commit = "b5e31b358095074b60d87690bd1dc0a020a2afab",
  },

  ----------------------------------------------------------------------
  --                             Comment                              --
  ----------------------------------------------------------------------

  -- Smart and Powerful comment plugin for Neovim.
  {
    "numToStr/Comment.nvim",
    commit = "eab2c83a0207369900e92783f56990808082eac2",
  },

  -- Highlight, list and search todo comments in your projects.
  {
    "folke/todo-comments.nvim",
    commit = "74c7d28cb50b0713c881ef69bcb6cdd77d8907d1",
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
    commit = "8299fe7703dfff4b1752aeed271c3b95281a952d",
  },
}
