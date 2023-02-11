local M = {}

M.disabled = {
  i = {
    ["<C-b>"] = "",
    ["<C-e>"] = "",

    -- navigate within insert mode
    ["<C-h>"] = "",
    ["<C-l>"] = "",
    ["<C-j>"] = "",
    ["<C-k>"] = "",
    ["<A-i>"] = "",
    ["<A-h>"] = "",
    ["<A-v>"] = "",
  },

  n = {
    ["gj"] = "",
    ["gk"] = "",
    ["<TAB>"] = "",
    ["<S-Tab>"] = "",
    ["<ESC>"] = "",
    ["<C-h>"] = "",
    ["<C-l>"] = "",
    ["<C-j>"] = "",
    ["<C-k>"] = "",
    ["<C-s>"] = "",
    ["<C-c>"] = "",
    ["<leader>n"] = "",
    ["<leader>uu"] = "",
    ["<leader>tt"] = "",
    ["j"] = "",
    ["k"] = "",
    ["<Up>"] = "",
    ["<Down>"] = "",
    ["<leader>b"] = "",
    ["<leader>x"] = "",
    ["<leader>/"] = "",
    ["<leader>fm"] = "",
    ["K"] = "",
    ["<leader>f"] = "",
    ["<leader>tk"] = "",
    ["<leader>cm"] = "",
    ["<leader>th"] = "",
    ["<leader>fw"] = "",
    ["]c"] = "",
    ["[c"] = "",
    ["<leader>rh"] = "",
    ["<leader>gb"] = "",
    ["<leader>td"] = "",
    ["<A-i>"] = "",
    ["<A-h>"] = "",
    ["<A-v>"] = "",
    ["<leader>h"] = "",
    ["<leader>v"] = "",
    ["[d"] = "",
    ["d]"] = "",
    ["<leader>ra"] = "",
  },

  v = {
    ["<Up>"] = "",
    ["<Down>"] = "",
    ["<leader>/"] = "",
  },

  x = {
    ["j"] = "",
    ["k"] = "",
    -- Don't copy the replaced text after pasting in visual mode
    -- https://vim.fandom.com/wiki/Replace_a_word_with_yanked_text#Alternative_mapping_for_paste
    ["p"] = "",
  },
}

--Remap space as leader key
vim.api.nvim_set_keymap("", "<SPACE>", "<Nop>", { noremap = true, silent = true })

M.general = {
  n = {
    -- line numbers
    ["<leader>rn"] = { "<cmd> set rnu! <CR>", "toggle relative number" },
    ["*"] = {
      ":let @/= '\\<' . expand('<cword>') . '\\>' <bar> set hls <cr>",
      opts = { noremap = true, silent = true },
    },
    ["<A-o>"] = { "<cmd> !open %:p:h <CR>", opts = { noremap = true, silent = true } },
  },
}

M.bufferline = {
  plugin = true,

  n = {
    ["<c-l>"] = {
      "<cmd> bnext <CR>",
      "goto next buffer",
    },

    ["<c-h>"] = {
      "<cmd> bprev <CR>",
      "goto prev buffer",
    },

    -- close buffer + hide terminal buffer
    ["<leader>x"] = {
      "<cmd> bd <CR>",
      "close buffer",
    },
  },
}

M.lspconfig = {
  plugin = true,

  -- See `<cmd> :help vim.lsp.*` for documentation on any of the below functions
  n = {
    ["gD"] = {
      function()
        vim.lsp.buf.declaration()
      end,
      "lsp declaration",
    },

    ["gd"] = {
      function()
        vim.lsp.buf.definition()
      end,
      "lsp definition",
    },

    ["gh"] = {
      function()
        vim.lsp.buf.hover()
      end,
      "lsp hover",
    },

    ["gi"] = {
      function()
        vim.lsp.buf.implementation()
      end,
      "lsp implementation",
    },

    ["<leader>lh"] = {
      function()
        vim.lsp.buf.signature_help()
      end,
      "lsp signature_help",
    },

    ["<leader>D"] = {
      function()
        vim.lsp.buf.type_definition()
      end,
      "lsp definition type",
    },

    ["<leader>lr"] = {
      function()
        require("nvchad_ui.renamer").open()
      end,
      "lsp rename",
    },

    ["<leader>ca"] = {
      function()
        vim.lsp.buf.code_action()
      end,
      "lsp code_action",
    },

    ["gr"] = {
      function()
        vim.lsp.buf.references()
      end,
      "lsp references",
    },

    ["gl"] = {
      function()
        vim.diagnostic.open_float()
      end,
      "floating diagnostic",
    },

    ["<leader>q"] = {
      function()
        vim.diagnostic.setloclist()
      end,
      "diagnostic setloclist",
    },

    ["<leader>lf"] = {
      function()
        vim.lsp.buf.format { async = true }
      end,
      "lsp formatting",
    },

    ["<leader>wa"] = {
      function()
        vim.lsp.buf.add_workspace_folder()
      end,
      "add workspace folder",
    },

    ["<leader>wr"] = {
      function()
        vim.lsp.buf.remove_workspace_folder()
      end,
      "remove workspace folder",
    },

    ["<leader>wl"] = {
      function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end,
      "list workspace folders",
    },
  },
}

M.nvimtree = {
  plugin = true,

  n = {
    -- toggle
    ["<C-n>"] = { "<cmd> NvimTreeToggle <CR>", "toggle nvimtree" },

    -- focus
    ["<leader>e"] = { "<cmd> NvimTreeFocus <CR>", "focus nvimtree" },
  },
}

local function getVisualSelection()
  vim.cmd 'noau normal! "vy"'
  local text = vim.fn.getreg "v"
  vim.fn.setreg("v", {})

  text = string.gsub(text, "\n", "")
  if #text > 0 then
    return text
  else
    return ""
  end
end

M.telescope = {
  plugin = true,

  n = {
    -- find
    ["<leader>ff"] = { "<cmd> Telescope find_files <CR>", "find files" },
    ["<leader>fa"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "find all" },
    ["<leader>fg"] = { "<cmd> Telescope live_grep <CR>", "live grep" },
    ["<leader>fb"] = { "<cmd> Telescope buffers <CR>", "find buffers" },
    ["<leader>fh"] = { "<cmd> Telescope help_tags <CR>", "help page" },
    ["<leader>fo"] = { "<cmd> Telescope oldfiles only_cwd=true <CR>", "find oldfiles" },
    ["<leader>fk"] = { "<cmd> Telescope keymaps <CR>", "show keys" },
    ["<leader>fj"] = { "<cmd> Telescope jumplist <CR>", "show keys" },
    ["<leader>fs"] = { "<cmd> Telescope lsp_document_symbols <CR>", "document symbols" },
    ["<leader>fr"] = { "<cmd> Telescope pickers <CR>", "Resume last find" },

    -- git
    ["<leader>gm"] = { "<cmd> Telescope git_commits <CR>", "git commits" },
    ["<leader>gt"] = { "<cmd> Telescope git_status <CR>", "git status" },

    -- pick a hidden term
    ["<leader>pt"] = { "<cmd> Telescope terms <CR>", "pick hidden term" },

    -- theme switcher
    ["<leader>ph"] = { "<cmd> Telescope themes <CR>", "nvchad themes" },
  },

  v = {
    ["<leader>ff"] = {
      function()
        require("telescope.builtin").find_files {
          default_text = getVisualSelection(),
        }
      end,
      "find files",
    },
    ["<leader>fg"] = {
      function()
        require("telescope.builtin").live_grep {
          default_text = getVisualSelection(),
          only_sort_text = true,
          additional_args = function()
            return { "--pcre2" }
          end,
        }
      end,
      "Find Text",
    },
  },

  i = {
    -- ["<C-j>"] = {
    --   function()
    --     local prompt_bufnr = vim.api.nvim_get_current_buf()
    --     return require("telescope.actions").cycle_history_next(prompt_bufnr)
    --   end,
    -- },
    -- ["<C-k>"] = {
    --   function()
    --     local prompt_bufnr = vim.api.nvim_get_current_buf()
    --     return require("telescope.actions").cycle_history_prev(prompt_bufnr)
    --   end,
    -- },
  },
}

M.toggleterm = {
  plugin = true,

  t = {},

  n = {},
}

if not vim.env.ITERM then
  vim.api.nvim_buf_set_keymap(0, "t", "<D-v>", [[<C-\><C-n>"+pa]], { noremap = true })
end

M.whichkey = {
  plugin = true,

  n = {
    ["<leader>wK"] = {
      function()
        vim.cmd "WhichKey"
      end,
      "which-key all keymaps",
    },
    ["<leader>wk"] = {
      function()
        local input = vim.fn.input "WhichKey: "
        vim.cmd("WhichKey " .. input)
      end,
      "which-key query lookup",
    },
  },
}

M.blankline = {
  plugin = true,

  n = {
    ["<leader>cc"] = {
      function()
        local ok, start = require("indent_blankline.utils").get_current_context(
          vim.g.indent_blankline_context_patterns,
          vim.g.indent_blankline_use_treesitter_scope
        )

        if ok then
          vim.api.nvim_win_set_cursor(vim.api.nvim_get_current_win(), { start, 0 })
          vim.cmd [[normal! _]]
        end
      end,

      "Jump to current_context",
    },
  },
}

M.gitsigns = {
  plugin = true,

  n = {
    -- Navigation through hunks
    ["<leader>gj"] = {
      function()
        if vim.wo.diff then
          return "<learder>gj"
        end
        vim.schedule(function()
          require("gitsigns").next_hunk()
        end)
        return "<Ignore>"
      end,
      "Jump to next hunk",
      opts = { expr = true },
    },

    ["<leader>gk"] = {
      function()
        if vim.wo.diff then
          return "<leader>gk"
        end
        vim.schedule(function()
          require("gitsigns").prev_hunk()
        end)
        return "<Ignore>"
      end,
      "Jump to prev hunk",
      opts = { expr = true },
    },

    -- Actions
    ["<leader>gr"] = {
      function()
        require("gitsigns").reset_hunk()
      end,
      "Reset hunk",
    },

    ["<leader>gs"] = {
      function()
        require("gitsigns").stage_hunk()
      end,
      "Reset hunk",
    },

    ["<leader>gu"] = {
      function()
        require("gitsigns").undo_stage_hunk()
      end,
      "Reset hunk",
    },

    ["<leader>gp"] = {
      function()
        require("gitsigns").preview_hunk()
      end,
      "Preview hunk",
    },

    ["<leader>gl"] = {
      function()
        package.loaded.gitsigns.blame_line()
      end,
      "Blame line",
    },

    ["<leader>gd"] = {
      function()
        require("gitsigns").diffthis "HEAD"
      end,
      "Toggle deleted",
    },

    ["<leader>gb"] = {
      function()
        require("gitsigns").toggle_deleted()
      end,
      "Toggle deleted",
    },
  },
}

M.aerial = {
  plugin = true,
  n = {
    ["<leader>lo"] = { "<cmd>AerialToggle<cr>", "Open outline" },
    ["<leader>ls"] = { "<cmd> Telescope aerial default_selection_index=1 <CR>", "document functions" },
  },
}

M.live_grep_args = {
  plugin = true,
  n = {
    ["<leader>fe"] = { "<cmd> Telescope live_grep_args<CR>" },
  },
  i = {
    -- ["<c-i>"] = require("telescope-live-grep-args.actions").quote_prompt(),
  },
}

return M
