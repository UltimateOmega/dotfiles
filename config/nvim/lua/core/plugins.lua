require("lazy").setup({

  ----------------------------------------------------------------------
  --                               Mini                               --
  ----------------------------------------------------------------------

  -- Library of 35+ independent Lua modules improving overall Neovim
  -- experience with minimal effort
  {
    "echasnovski/mini.nvim",
    commit = "78a4d457718060fe80480c72a7d64f6b23472d63",
  },

  ----------------------------------------------------------------------
  --                               LSP                                --
  ----------------------------------------------------------------------

  -- Quickstart configurations for the Neovim LSP client.
  {
    "neovim/nvim-lspconfig",
    commit = "41f40dc4b86f3e166cf08115f621001972565a20",
  },

  -- Easily install and manage LSP servers, DAP servers, linters, and
  -- formatters.
  {
    "williamboman/mason.nvim",
    commit = "c43eeb5614a09dc17c03a7fb49de2e05de203924",
  },

  -- Extension to mason.nvim that makes it easier to use lspconfig with
  -- mason.nvim
  {
    "williamboman/mason-lspconfig.nvim",
    commit = "0954d7730e749d606ddf8d7ae8846848be435d53",
  },

  -- Another lsp progress status for Neovim.
  {
    "linrongbin16/lsp-progress.nvim",
    commit = "044bcfd13bcf79b2899a82b6bfadc90c48d879ad",
    config = function()
      require "plugins.lsp-progress"
    end,
  },

  ----------------------------------------------------------------------
  --                            Completion                            --
  ----------------------------------------------------------------------

  -- Completion plugin for Neovim
  {
    "hrsh7th/nvim-cmp",
    commit = "04e0ca376d6abdbfc8b52180f8ea236cbfddf782",
  },

  -- A nvim-cmp source for Neovim builtin LSP client.
  {
    "hrsh7th/cmp-nvim-lsp",
    commit = "5af77f54de1b16c34b23cba810150689a3a90312",
  },

  -- A nvim-cmp source for luasnip completion.
  {
    "saadparwaiz1/cmp_luasnip",
    commit = "05a9ab28b53f71d1aece421ef32fee2cb857a843",
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
    commit = "a3b7c0cadb7bd389f513eecda376d4c6bec90003",
  },

  -- A nvim-cmp source for look.
  {
    "octaltree/cmp-look",
    commit = "971e65a6be0e75c3438fe7b176d4fc020cb89d7b",
  },

  -- A nvim-cmp source for math calculation.
  {
    "hrsh7th/cmp-calc",
    commit = "ce91d14d2e7a8b3f6ad86d85e34d41c1ae6268d9",
  },

  -- A nvim-cmp source for vim's cmdline.
  {
    "hrsh7th/cmp-cmdline",
    commit = "8ee981b4a91f536f52add291594e89fb6645e451",
  },

  -- The official Sourcegraph/Cody plugin for Neovim
  {
    "sourcegraph/sg.nvim",
    commit = "d8286f431981f32e5e6e494c8a6f9ffbd2ee1428",
  },

  ----------------------------------------------------------------------
  --                  Programming Languages Support                   --
  ----------------------------------------------------------------------

  -- Build flutter and dart applications in Neovim using the native lsp.
  {
    "akinsho/flutter-tools.nvim",
    commit = "271eec9edb0f1a2bf30ad449ec3b4eeb2c88af05",
  },

  -- Tools for better development in rust using Neovim's builtin LSP.
  {
    "simrat39/rust-tools.nvim",
    commit = "676187908a1ce35ffcd727c654ed68d851299d3e",
  },

  ----------------------------------------------------------------------
  --                              Syntax                              --
  ----------------------------------------------------------------------

  -- Neovim Treesitter configurations and abstraction layer.
  {
    "nvim-treesitter/nvim-treesitter",
    commit = "10e8dffb7961fae98cf83efa0e170c22ae2cd33a",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      -- Rainbow delimiters for Neovim through Tree-sitter
      {
        "HiPhish/nvim-ts-rainbow2",
        commit = "b3120cd5ae9ca524af9cb602f41e12e301fa985f",
      },

      -- Shows floating hover with the current function/block context.
      {
        "nvim-treesitter/nvim-treesitter-context",
        commit = "f2ef98cd18fca352448756d3feb6e58d82583274",
        config = function()
          require "plugins.treesitter-context"
        end,
      },
    },
    config = function()
      require "plugins.treesitter"
    end,
  },

  ----------------------------------------------------------------------
  --                             Snippet                              --
  ----------------------------------------------------------------------

  -- A snippet engine for Neovim written in Lua.
  {
    "L3MON4D3/LuaSnip",
    commit = "2dbef19461198630b3d7c39f414d09fb07d1fdd2",
  },

  -- Set of preconfigured snippets for different languages.
  {
    "rafamadriz/friendly-snippets",
    commit = "b8fae73a479ae0a1c54f5c98fa687ae8a0addc53",
  },

  ----------------------------------------------------------------------
  --                           Fuzzy Finder                           --
  ----------------------------------------------------------------------

  -- A highly extendable fuzzy finder over lists.
  {
    "nvim-telescope/telescope.nvim",
    commit = "0f865f17af4f9bc1587a0132414cdfd32d91852e",
  },

  ----------------------------------------------------------------------
  --                          File Explorer                           --
  ----------------------------------------------------------------------

  -- Neo-tree is a Neovim plugin to browse the file system and other tree like
  -- structures in whatever style suits you, including sidebars, floating
  -- windows, netrw split style, or all of them at once.
  {
    "nvim-neo-tree/neo-tree.nvim",
    commit = "f3941c57ec85d7bdb44fa53fd858fd80f159018f",
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require "plugins.neo-tree"
    end,
  },

  ----------------------------------------------------------------------
  --                             Project                              --
  ----------------------------------------------------------------------

  -- An all in one Neovim plugin that provides superior project management.
  {
    "ahmedkhalf/project.nvim",
    commit = "8c6bad7d22eef1b71144b401c9f74ed01526a4fb",
    event = "VimEnter",
    config = function()
      require "plugins.project"
    end,
  },

  ----------------------------------------------------------------------
  --                              Color                               --
  ----------------------------------------------------------------------

  -- A high-performance color highlighter for Neovim which has no external
  -- dependencies.
  {
    "NvChad/nvim-colorizer.lua",
    commit = "85855b38011114929f4058efc97af1059ab3e41d",
    event = "VimEnter",
    config = function()
      require "plugins.colorizer"
    end,
  },

  ----------------------------------------------------------------------
  --                           Colorscheme                            --
  ----------------------------------------------------------------------

  -- Warm mid-tone dark theme to show off your vibrant self! with support for
  -- native LSP, Tree-sitter, and more 🍨!
  {
    "catppuccin/nvim",
    commit = "c2034f7b549152e5cc757820426341ea5000bc7a",
    config = function()
      require "plugins.catppuccin"
    end,
  },

  ----------------------------------------------------------------------
  --                            Statusline                            --
  ----------------------------------------------------------------------

  -- A blazing fast and easy to configure Neovim statusline.
  {
    "nvim-lualine/lualine.nvim",
    commit = "7d131a8d3ba5016229e8a1d08bf8782acea98852",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    init = function()
      vim.g.lualine_laststatus = vim.o.laststatus
      if vim.fn.argc(-1) > 0 then
        -- set an empty statusline till lualine loads
        vim.o.statusline = " "
      else
        -- hide the statusline on the starter page
        vim.o.laststatus = 0
      end
    end,
    config = function()
      require "plugins.lualine"
    end,
  },

  ----------------------------------------------------------------------
  --                            Cursorline                            --
  ----------------------------------------------------------------------

  -- Highlight the word under the cursor.
  {
    "RRethy/vim-illuminate",
    commit = "305bf07b919ac526deb5193280379e2f8b599926",
  },

  ----------------------------------------------------------------------
  --                             Startup                              --
  ----------------------------------------------------------------------

  -- A fast and highly customizable greeter for Neovim.
  {
    "goolord/alpha-nvim",
    commit = "1356b9ef31b985d541d94314f2cf73c61124bf1d",
    event = "VimEnter",
    config = function()
      require "plugins.alpha"
    end,
  },

  ----------------------------------------------------------------------
  --                               Icon                               --
  ----------------------------------------------------------------------

  -- A Lua fork of vim-devicons.
  {
    "nvim-tree/nvim-web-devicons",
    commit = "7f30f2da3c3641841ceb0e2c150281f624445e8f",
  },

  ----------------------------------------------------------------------
  --                             Utility                              --
  ----------------------------------------------------------------------

  -- A fancy, configurable, notification manager for Neovim.
  {
    "rcarriga/nvim-notify",
    commit = "80b67b265530632505193553d05127ae7fe09ddd",
  },

  -- Improve the built-in vim.ui interfaces with telescope, fzf, etc.
  {
    "stevearc/dressing.nvim",
    commit = "6f212262061a2120e42da0d1e87326e8a41c0478",
    event = "VeryLazy",
    config = function()
      require "plugins.dressing"
    end,
  },

  -- Display a line as colorcolumn.
  {
    "lukas-reineke/virt-column.nvim",
    commit = "b62b4ef0774d19452d4ed18e473e824c7a756f2f",
    event = "VimEnter",
    config = function()
      require "plugins.virt-column"
    end,
  },

  -- Delete Neovim buffers without losing window layout.
  {
    "famiu/bufdelete.nvim",
    commit = "0b9c0f182b09c51170bb9f252f15de7695e4d507",
  },

  ----------------------------------------------------------------------
  --                       Terminal Integration                       --
  ----------------------------------------------------------------------

  -- A Neovim Lua plugin to help easily manage multiple terminal windows.
  {
    "akinsho/toggleterm.nvim",
    commit = "b49df5cdce67a8964d1b027dae94bde212092b51",
    event = "VeryLazy",
    config = function()
      require "plugins.toggleterm"
    end,
  },

  ----------------------------------------------------------------------
  --                      Neovim Lua Development                      --
  ----------------------------------------------------------------------

  -- Useful lua functions used by lots of plugins.
  {
    "nvim-lua/plenary.nvim",
    commit = "4f71c0c4a196ceb656c824a70792f3df3ce6bb6d",
  },

  -- UI Component Library.
  {
    "MunifTanjim/nui.nvim",
    commit = "35da9ca1de0fc4dda96c2e214d93d363c145f418",
  },

  ----------------------------------------------------------------------
  --                               Git                                --
  ----------------------------------------------------------------------

  -- Git integration: signs, hunk actions, blame, etc.
  {
    "lewis6991/gitsigns.nvim",
    commit = "2c2463dbd82eddd7dbab881c3a62cfbfbe3c67ae",
    event = "VimEnter",
    config = function()
      require "plugins.gitsigns"
    end,
  },

  ----------------------------------------------------------------------
  --                            Keybinding                            --
  ----------------------------------------------------------------------

  -- Neovim plugin that shows a popup with possible keybindings of the command
  -- you started typing.
  {
    "folke/which-key.nvim",
    commit = "4433e5ec9a507e5097571ed55c02ea9658fb268a",
    event = "VeryLazy",
    config = function()
      require "plugins.whichkey"
    end,
  },

  ----------------------------------------------------------------------
  --                         Editing Support                          --
  ----------------------------------------------------------------------

  -- Peek lines in a non-obtrusive way.
  {
    "nacro90/numb.nvim",
    commit = "3f7d4a74bd456e747a1278ea1672b26116e0824d",
    event = "VeryLazy",
    config = function()
      require "plugins.numb"
    end,
  },

  ----------------------------------------------------------------------
  --                             Comment                              --
  ----------------------------------------------------------------------

  -- Adds a comment frame based on the source file.
  {
    "s1n7ax/nvim-comment-frame",
    commit = "7a7d34ee7a236a89ffe5674bf794358ee12a7df8",
    event = "VeryLazy",
    config = function()
      require "plugins.comment-frame"
    end,
  },

  ----------------------------------------------------------------------
  --                            Formatting                            --
  ----------------------------------------------------------------------

  -- A lightweight formatting engine that plays nice with LSP.
  {
    "stevearc/conform.nvim",
    commit = "c0e0e80f0c233cb3a249f719a44324c660163a3f",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    config = function()
      require "plugins.conform"
    end,
  },

  ----------------------------------------------------------------------
  --                              Indent                              --
  ----------------------------------------------------------------------

  --  IndentLine replacement in Lua with more features and treesitter support.
  {
    "lukas-reineke/indent-blankline.nvim",
    commit = "12e92044d313c54c438bd786d11684c88f6f78cd",
    event = "VimEnter",
    config = function()
      require "plugins.indent-blankline"
    end,
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
