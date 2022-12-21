local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  vim.api.nvim_err_writeln "Failed to load packer"
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install plugins
return packer.startup(function(use)
  ----------------------------------------------------------------------
  --                          Plugin Manager                          --
  ----------------------------------------------------------------------

  -- A use-package inspired plugin manager for Neovim.
  use {
    "wbthomason/packer.nvim",
    commit = "dac4088c70f4337c6c40d1a2751266a324765797",
  }

  ----------------------------------------------------------------------
  --                               LSP                                --
  ----------------------------------------------------------------------

  -- Quickstart configurations for the Neovim LSP client.
  use {
    "neovim/nvim-lspconfig",
    commit = "5292d60976b3084a987bf5634150f6201830ac18",
  }

  -- A code outline window for skimming and quick navigation.
  use {
    "stevearc/aerial.nvim",
    commit = "086e1904e51fc559673598afbc59842db7981501",
  }

  -- Use Neovim as a language server to inject LSP diagnostics, code actions,
  -- and more via Lua.
  use {
    "jose-elias-alvarez/null-ls.nvim",
    commit = "db1c7cb5f6d6f6036b7f8433bb3cfcbe985cb3d1",
  }

  -- Standalone UI for LSP progress.
  use {
    "j-hui/fidget.nvim",
    commit = "44585a0c0085765195e6961c15529ba6c5a2a13b",
  }

  -- Easily install and manage LSP servers, DAP servers, linters, and
  -- formatters.
  use {
    "williamboman/mason.nvim",
    commit = "dd04b4105e84620685c37efb6ca935d282e11465",
  }

  -- Extension to mason.nvim that makes it easier to use lspconfig with
  -- mason.nvim
  use {
    "williamboman/mason-lspconfig.nvim",
    commit = "5bea0e851b8f48479d2cb927cd26733b4058b2b3",
  }

  -- Extension to mason.nvim that makes it easier to use null-ls with
  -- mason.nvim
  use {
    "jayp0521/mason-null-ls.nvim",
    commit = "0fcc40394b8d0f525a8be587268cbfac3e70a5bc",
  }

  ----------------------------------------------------------------------
  --                            Completion                            --
  ----------------------------------------------------------------------

  -- Completion plugin for Neovim
  use {
    "hrsh7th/nvim-cmp",
    commit = "8868cf9a09e5f3c2612a22ccb82dcc6d9f0d0d35",
  }

  -- A nvim-cmp source for Neovim builtin LSP client.
  use {
    "hrsh7th/cmp-nvim-lsp",
    commit = "59224771f91b86d1de12570b4070fe4ad7cd1eeb",
  }

  -- A nvim-cmp source for luasnip completion.
  use {
    "saadparwaiz1/cmp_luasnip",
    commit = "18095520391186d634a0045dacaa346291096566",
  }

  -- A nvim-cmp source for filesystem paths.
  use {
    "hrsh7th/cmp-path",
    commit = "91ff86cd9c29299a64f968ebb45846c485725f23",
  }

  -- A nvim-cmp source for buffer words.
  use {
    "hrsh7th/cmp-buffer",
    commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa",
  }

  -- A nvim-cmp source for the Neovim Lua API.
  use {
    "hrsh7th/cmp-nvim-lua",
    commit = "d276254e7198ab7d00f117e88e223b4bd8c02d21",
  }

  -- A nvim-cmp source for displaying function signatures.
  use {
    "hrsh7th/cmp-nvim-lsp-signature-help",
    commit = "d2768cb1b83de649d57d967085fe73c5e01f8fd7",
  }

  -- A nvim-cmp source for nerdfont icons.
  use {
    "chrisgrieser/cmp-nerdfont",
    commit = "989baa81b3cb82890f232ae0b58dbea13ebf8f23",
  }

  -- A nvim-cmp source for look.
  use {
    "octaltree/cmp-look",
    commit = "b39c50bcdf6199dddda56adc466c2bd9c951a960",
  }

  -- A nvim-cmp source for math calculation.
  use {
    "hrsh7th/cmp-calc",
    commit = "50792f34a628ea6eb31d2c90e8df174671e4e7a0",
  }

  -- A nvim-cmp source for vim's cmdline.
  use {
    "hrsh7th/cmp-cmdline",
    commit = "23c51b2a3c00f6abc4e922dbd7c3b9aca6992063",
  }

  ----------------------------------------------------------------------
  --                  Programming Languages Support                   --
  ----------------------------------------------------------------------

  -- Build flutter and dart applications in Neovim using the native lsp.
  use {
    "akinsho/flutter-tools.nvim",
    commit = "b666a057108c7655882cbc64217222228aad68da",
  }

  -- Tools for better development in rust using Neovim's builtin LSP.
  use {
    "simrat39/rust-tools.nvim",
    commit = "99fd1238c6068d0637df30b6cee9a264334015e9",
  }

  ----------------------------------------------------------------------
  --                              Syntax                              --
  ----------------------------------------------------------------------

  -- Neovim Treesitter configurations and abstraction layer.
  use {
    "nvim-treesitter/nvim-treesitter",
    commit = "eedb7b9c69b13afe86461b0742266bb62b811ece",
  }

  -- A plugin for adding/changing/deleting surrounding delimiter pairs.
  use {
    "kylechui/nvim-surround",
    commit = "6cc6b54d3728a17e34bb5c9b9db05c7e5690813d",
  }

  ----------------------------------------------------------------------
  --                             Snippet                              --
  ----------------------------------------------------------------------

  -- A snippet engine for Neovim written in Lua.
  use {
    "L3MON4D3/LuaSnip",
    commit = "5570fd797eae0790affb54ea669a150cad76db5d",
  }

  -- Set of preconfigured snippets for different languages.
  use {
    "rafamadriz/friendly-snippets",
    commit = "1a6a02350568d6830bcfa167c72f9b6e75e454ae",
  }

  ----------------------------------------------------------------------
  --                           Fuzzy Finder                           --
  ----------------------------------------------------------------------

  -- A highly extendable fuzzy finder over lists.
  use {
    "nvim-telescope/telescope.nvim",
    commit = "cabf991b1d3996fa6f3232327fc649bbdf676496",
  }

  ----------------------------------------------------------------------
  --                          File Explorer                           --
  ----------------------------------------------------------------------

  -- A simple and fast file explorer tree for Neovim.
  use {
    "nvim-tree/nvim-tree.lua",
    commit = "e14c2895b4f36a22001f7773244041c173dcf867",
  }

  ----------------------------------------------------------------------
  --                             Project                              --
  ----------------------------------------------------------------------

  -- An all in one Neovim plugin that provides superior project management.
  use {
    "ahmedkhalf/project.nvim",
    commit = "685bc8e3890d2feb07ccf919522c97f7d33b94e4",
  }

  ----------------------------------------------------------------------
  --                              Color                               --
  ----------------------------------------------------------------------

  -- A high-performance color highlighter for Neovim which has no external
  -- dependencies.
  use {
    "NvChad/nvim-colorizer.lua",
    commit = "760e27df4dd966607e8fb7fd8b6b93e3c7d2e193",
  }

  ----------------------------------------------------------------------
  --                           Colorscheme                            --
  ----------------------------------------------------------------------

  -- NvChad's base46 theme plugin
  use {
    "NvChad/base46",
    commit = "be301b2cd309394dfa62e8c569250e4fb58dd763",
  }

  ----------------------------------------------------------------------
  --                            Statusline                            --
  ----------------------------------------------------------------------

  -- A blazing fast and easy to configure Neovim statusline.
  use {
    "nvim-lualine/lualine.nvim",
    commit = "bfa0d99ba6f98d077dd91779841f1c88b7b5c165",
  }

  ----------------------------------------------------------------------
  --                             Tabline                              --
  ----------------------------------------------------------------------

  -- A snazzy buffer line for Neovim built using Lua.
  use {
    "akinsho/bufferline.nvim",
    commit = "4ecfa81e470a589e74adcde3d5bb1727dd407363",
  }

  ----------------------------------------------------------------------
  --                            Cursorline                            --
  ----------------------------------------------------------------------

  -- Highlight the word under the cursor.
  use {
    "RRethy/vim-illuminate",
    commit = "a6d0b28ea7d6b9d139374be1f94a16bd120fcda3",
  }

  ----------------------------------------------------------------------
  --                             Startup                              --
  ----------------------------------------------------------------------

  -- A fast and highly customizable greeter for Neovim.
  use {
    "goolord/alpha-nvim",
    commit = "21a0f2520ad3a7c32c0822f943368dc063a569fb",
  }

  ----------------------------------------------------------------------
  --                               Icon                               --
  ----------------------------------------------------------------------

  -- A Lua fork of vim-devicons.
  use {
    "nvim-tree/nvim-web-devicons",
    commit = "05e1072f63f6c194ac6e867b567e6b437d3d4622",
  }

  ----------------------------------------------------------------------
  --                             Utility                              --
  ----------------------------------------------------------------------

  -- Automatically create missing directories when saving a file.
  use {
    "jghauser/mkdir.nvim",
    commit = "c55d1dee4f099528a1853b28bb28caa802eba217",
  }

  -- A fancy, configurable, notification manager for Neovim.
  use {
    "rcarriga/nvim-notify",
    commit = "b005821516f1f37801a73067afd1cef2dbc4dfe8",
  }

  -- Improve the built-in vim.ui interfaces with telescope, fzf, etc.
  use {
    "stevearc/dressing.nvim",
    commit = "4436d6f41e2f6b8ada57588acd1a9f8b3d21453c",
  }

  -- Display a line as colorcolumn.
  use {
    "lukas-reineke/virt-column.nvim",
    commit = "36fa3be9cba9195081e934b4f9729021726c5889",
  }

  -- Delete Neovim buffers without losing window layout.
  use {
    "famiu/bufdelete.nvim",
    commit = "f79e9d186b42fba5f1b1362006e7c70240db97a4",
  }

  ----------------------------------------------------------------------
  --                       Terminal Integration                       --
  ----------------------------------------------------------------------

  -- A Neovim Lua plugin to help easily manage multiple terminal windows.
  use {
    "akinsho/toggleterm.nvim",
    commit = "b02a1674bd0010d7982b056fd3df4f717ff8a57a",
  }

  ----------------------------------------------------------------------
  --                      Neovim Lua Development                      --
  ----------------------------------------------------------------------

  -- Useful lua functions used by lots of plugins.
  use {
    "nvim-lua/plenary.nvim",
    commit = "4b7e52044bbb84242158d977a50c4cbcd85070c7",
  }

  ----------------------------------------------------------------------
  --                      Dependency management                       --
  ----------------------------------------------------------------------

  -- Rust dependency management for Cargo.toml.
  use {
    "Saecki/crates.nvim",
    commit = "a70328ae638e20548bcfc64eb9561101104b3008",
  }

  ----------------------------------------------------------------------
  --                               Git                                --
  ----------------------------------------------------------------------

  -- Git integration: signs, hunk actions, blame, etc.
  use {
    "lewis6991/gitsigns.nvim",
    commit = "2ab3bdf0a40bab53033048c6be75bda86316b55d",
  }

  ----------------------------------------------------------------------
  --                              Motion                              --
  ----------------------------------------------------------------------

  -- Add fancy sub-cursor to signcolumn to show your scroll or jump direction.
  use {
    "gen740/SmoothCursor.nvim",
    commit = "255035d1c58e7a51db83e4b22d22627540c1b87c",
  }

  ----------------------------------------------------------------------
  --                            Keybinding                            --
  ----------------------------------------------------------------------

  -- Neovim plugin that shows a popup with possible keybindings of the command
  -- you started typing.
  use {
    "folke/which-key.nvim",
    commit = "61553aeb3d5ca8c11eea8be6eadf478062982ac9",
  }

  -- Create shortcuts to escape insert mode without getting delay.
  use {
    "max397574/better-escape.nvim",
    commit = "d5ee0cef56a7e41a86048c14f25e964876ac20c1",
  }

  ----------------------------------------------------------------------
  --                            Scrolling                             --
  ----------------------------------------------------------------------

  -- Smooth scrolling for Neovim.
  use {
    "karb94/neoscroll.nvim",
    commit = "54c5c419f6ee2b35557b3a6a7d631724234ba97a",
  }

  ----------------------------------------------------------------------
  --                            Scrollbar                             --
  ----------------------------------------------------------------------

  -- Extensible scrollbar that shows diagnostics and search results.
  use {
    "petertriho/nvim-scrollbar",
    commit = "f45aecbba9c402282dfc99721e0ad4c08710907c",
  }

  ----------------------------------------------------------------------
  --                         Editing Support                          --
  ----------------------------------------------------------------------

  -- A minimalist autopairs for Neovim written by Lua.
  use {
    "windwp/nvim-autopairs",
    commit = "b5994e6547d64f781cfca853a1aa6174d238fe0e",
  }

  -- Shows floating hover with the current function/block context.
  use {
    "nvim-treesitter/nvim-treesitter-context",
    commit = "d28654b012d4c56beafec630ef7143275dff76f8",
  }

  -- Peek lines in a non-obtrusive way.
  use {
    "nacro90/numb.nvim",
    commit = "d95b7ea62e320b02ca1aa9df3635471a88d6f3b1",
  }

  -- Reopen files at your last edit position.
  use {
    "ethanholz/nvim-lastplace",
    commit = "ecced899435c6bcdd81becb5efc6d5751d0dc4c8",
  }

  -- A telescope extension to visualize your undo tree and fuzzy-search changes
  -- in it.
  use {
    "debugloop/telescope-undo.nvim",
    commit = "3be830694f2d8c9705f6cf40a5ffee8a0c2aa6e5",
  }

  ----------------------------------------------------------------------
  --                             Comment                              --
  ----------------------------------------------------------------------

  -- Smart and Powerful comment plugin for Neovim.
  use {
    "numToStr/Comment.nvim",
    commit = "5f01c1a89adafc52bf34e3bf690f80d9d726715d",
  }

  -- Highlight, list and search todo comments in your projects.
  use {
    "folke/todo-comments.nvim",
    commit = "c1760010f46992165995aaa52ca967f473a2e8e6",
  }

  -- Adds a comment frame based on the source file.
  use {
    "s1n7ax/nvim-comment-frame",
    commit = "7a7d34ee7a236a89ffe5674bf794358ee12a7df8",
  }

  ----------------------------------------------------------------------
  --                              Indent                              --
  ----------------------------------------------------------------------

  -- IndentLine replacement in Lua with more features and treesitter support.
  use {
    "lukas-reineke/indent-blankline.nvim",
    commit = "c4c203c3e8a595bc333abaf168fcb10c13ed5fb7",
  }

  ----------------------------------------------------------------------
  --                            Impatient                             --
  ----------------------------------------------------------------------

  -- Speed up loading Lua modules
  use {
    "lewis6991/impatient.nvim",
    commit = "9f7eed8133d62457f7ad2ca250eb9b837a4adeb7",
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)