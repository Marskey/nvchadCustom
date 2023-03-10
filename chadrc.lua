-- First read our docs (completely) then check the example_config repo

local M = {}

M.mappings = require "custom.mappings"

M.plugins = require "custom.plugins"

M.ui = {
  hl_override = {
    CursorLine = {
      bg = "darker_black",
    },
  },
}

return M
