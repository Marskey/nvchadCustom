return {
  ["NvChad/ui"] = {
    override_options = {
      statusline = {
        separator_style = "round",
      },
      tabufline = {
        enabled = false,
        lazyload = true,
        overriden_modules = nil,
      },
    },
  },

  ["NvChad/nvterm"] = false,

  ["akinsho/toggleterm.nvim"] = {
    cmd = "ToggleTerm",
    keys = { [[<c-\>]] },
    config = function()
      require "custom.plugins.configs.toggleterm"
    end,
    setup = function()
      require("core.utils").load_mappings "toggleterm"
    end,
  },

  ["neovim/nvim-lspconfig"] = {
    opt = true,
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.configs.lspconfig"
    end,
  },

  -- misc plugins
  ["nvim-tree/nvim-tree.lua"] = {
    ft = "alpha",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    config = function()
      require "plugins.configs.nvimtree"
    end,
    setup = function()
      require("core.utils").load_mappings "nvimtree"
    end,
  },

  ["nvim-telescope/telescope.nvim"] = {
    requires = "aerial",
    after = {"telescope-live-grep-args.nvim", "aerial.nvim" },
    override_options = {
      defaults = {
        -- prompt_prefix = "   ",
        prompt_prefix = "",
        path_display = { shorten = { len = 3, exclude = { 1, 2, -2, -1 } } },
        history = false,
        cache_picker = {
          num_pickers = 5,
        },
        mappings = {
          i = {
            ["<c-k>"] = "cycle_history_prev",
            ["<c-j>"] = "cycle_history_next",
          },
        },
      },
      pickers = {
        buffers = {
          sort_mru = true,
          ignore_current_buffer = true,
          scroll_strategy = "limit",
        },
      },
      extensions_list = { "themes", "terms", "live_grep_args", "smart_history", "aerial" },
      extensions = {
        aerial = {
          default_selection_index = 1,
          -- Display symbols as <root>.<parent>.<symbol>
          show_nesting = {
            ["_"] = false, -- This key will be the default
            json = true, -- You can set the option for specific filetypes
            yaml = true,
          },
        },
        live_grep_args = {
          auto_quoting = true, -- enable/disable auto-quoting
        },
      },
    },
  },

  -- Only load whichkey after all the gui
  ["folke/which-key.nvim"] = {
    disable = false,
    override_options = {
      plugins = {
        marks = true, -- shows a list of your marks on ' and `
        registers = false, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        spelling = {
          enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
          suggestions = 20, -- how many suggestions should be shown in the list?
        },
        -- the presets plugin, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        presets = {
          operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
          motions = false, -- adds help for motions
          text_objects = true, -- help for text objects triggered after entering an operator
          windows = true, -- default bindings on <c-w>
          nav = true, -- misc bindings to work with windows
          z = true, -- bindings for folds, spelling and others prefixed with z
          g = true, -- bindings for prefixed with g
        },
      },
    },
  },

  ["tpope/vim-surround"] = {
    opt = false,
  },

  ["tommcdo/vim-exchange"] = {
    opt = false,
  },

  ["stevearc/stickybuf.nvim"] = {},

  ["nvim-treesitter/nvim-treesitter"] = {
    override_options = {
      additional_vim_regex_highlighting = false,
    },
  },

  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require "custom.plugins.configs.null-ls"
    end,
  },

  ["ggandor/leap.nvim"] = {
    config = function()
      require("leap").add_default_mappings()
    end,
  },

  ["nvim-telescope/telescope-live-grep-args.nvim"] = {
    requires = "telescope.nvim",
    setup = function()
      require("core.utils").load_mappings "live_grep_args"
    end,
  },

  ["akinsho/bufferline.nvim"] = {
    config = function()
      require("bufferline").setup {}
      require("base46").load_highlight "bufferline"
    end,
    setup = function()
      require("core.utils").load_mappings "bufferline"
    end,
  },

  ["tiagovla/scope.nvim"] = {
    config = function()
      require("scope").setup()
    end,
  },

  ["stevearc/aerial.nvim"] = {
    requires = "telescope.nvim",
    cmd = {
      "AerialToggle",
      "AerialOpen",
      "AerialOpenAll",
      "AerialClose",
      "AerialCloseAll",
      "AerialNext",
      "AerialPrev",
      "AerialGo",
      "AerialInfo",
      "Telescope",
    },
    config = function()
      require "custom.plugins.configs.aerial"
    end,
    setup = function()
      require("core.utils").load_mappings "aerial"
    end,
  },
}
