-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing
-- Replace text without yanking

-- Replace text without yanking
local function replace_without_yank()
  -- Save the current register
  local reg = vim.fn.getreg '"'
  local reg_type = vim.fn.getregtype '"'

  -- Delete the text into the black hole register
  vim.cmd 'normal "_d'

  -- Paste from the zero register
  vim.cmd 'normal "0p'

  -- Restore the original register
  vim.fn.setreg('"', reg, reg_type)
end

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 256, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtua text, 2 = no virtual text, 3 = on)
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "yes", -- sets vim.opt.signcolumn to yes
        wrap = false, -- sets vim.opt.wrap
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized

    -- ["c"] = { replace_without_yank, desc = "Replace without yanking" },
    -- vim.api.nvim_set_keymap('n', 'd', '<Nop>', {noremap = true})
    mappings = {
      -- first key is the mode
      n = {
        -- ["<Leader>d"] = { function() require("dap").continue() end, desc = "dap: go next" },
        ["~"] = { function() require("dap").step_over() end, desc = "dap: go next" },
        ["+"] = { function() require("dap").step_into() end, desc = "dap: go next" },
        -- second key is the lefthand side of the map
        ["c"] = { '"_c', desc = "replace to blackhole req" },
        ["C"] = { '"_C', desc = "replace to blackhole req" },
        -- navigate buffer tabs
        ["]b"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["[b"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

        -- mappings seen under group name "Buffer"
        ["<Leader>bd"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Close buffer from tabline",
        },

        -- Navigation
        ["r"] = { "q", desc = "Record" },
        ["R"] = { "@r", desc = "Play recent register" },
        ["q"] = { "b", desc = "Prev word" },
        ["D"] = { "dd", desc = "delete" },
        ["Q"] = { "^", desc = "Begining of line" },
        ["E"] = { "$", desc = "End of line" },
        ["s"] = { "}", desc = "Next empty" },
        ["S"] = { "+", desc = "Down line" },
        -- ["d"] = { "<Nop>", desc = "Next empty", noremap=true},
        ["w"] = { "{", desc = "Prev empty" },
        ["W"] = { "-", desc = "Up line" },
        -- ["s"] = { "%", desc = "Parenthesis navigate", noremap = true},
        -- Move
        ["<S-M-j>"] = { ":m +1<CR>==", desc = "move lines down", noremap = true },
        ["<S-M-k>"] = { ":m -2<CR>==", desc = "move lines up", noremap = false },
        -- ["z"] = { ":q!<CR>", desc="Exit without save", noremap = true },
        ["Z"] = { ":qa!<CR>==", desc = "Exit with save", noremap = true },

        -- tables with just a `desc` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        -- ["<Leader>b"] = { desc = "Buffers" },

        -- setting a mapping to false will disable it
        -- ["<C-S>"] = false,
      },

      v = {
        ["q"] = { "b", desc = "Prev word" },
        ["w"] = { "{", desc = "Prev empty" },
        ["W"] = { "-", desc = "Up line" },
        ["D"] = { "dd", desc = "delete" },
        ["Q"] = { "^", desc = "Begining of line" },
        ["E"] = { "$", desc = "End of line" },
        ["s"] = { "}", desc = "Next empty", silent = true },
        ["S"] = { "+", desc = "Down line" },
        -- ["s"] = { "%", desc = "Parenthesis navigate", noremap = true},
        -- Move
        -- ["s"] = { "%", desc = "Parenthesis navigate", noremap = true},
        ["<S-M-j>"] = { ":m +1<CR>==", desc = "move lines down", noremap = true },
        ["<S-M-k>"] = { ":m -2<CR>==", desc = "move lines up", noremap = true },
        -- ["<"] = { "#", desc = "Prev occasion"},
        -- [">"] = { "*", desc = "Next occasion"}
      },
    },
  },
}
