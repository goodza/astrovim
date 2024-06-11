-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

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

    -- vim.api.nvim_set_keymap('n', 'd', '<Nop>', {noremap = true})
    mappings = {
      -- first key is the mode
      n = {
        -- second key is the lefthand side of the map

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
        -- ["d"] = { "<Nop>", desc = "Next empty", noremap=true},
        ["w"] = { "{", desc = "Prev empty" },
        -- ["s"] = { "%", desc = "Parenthesis navigate", noremap = true},
        -- Move
        ["<A-j>"] = { ":m +1<CR>==", desc = "move lines down", noremap = true },
        ["<A-k>"] = { ":m -2<CR>==", desc = "move lines up", noremap = true },
        -- ["z"] = { ":q!<CR>", desc="Exit without save", noremap = true },
        ["Z"] = { "ZZ", desc = "Exit with save", noremap = true },

        -- tables with just a `desc` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        -- ["<Leader>b"] = { desc = "Buffers" },

        -- setting a mapping to false will disable it
        -- ["<C-S>"] = false,
      },

      v = {
        ["q"] = { "b", desc = "Prev word" },
        ["w"] = { "{", desc = "Prev empty" },
        ["D"] = { "dd", desc = "delete" },
        ["Q"] = { "^", desc = "Begining of line" },
        ["E"] = { "$", desc = "End of line" },
        ["s"] = { "}", desc = "Next empty", silent = true },
        ["w"] = { "{", desc = "Prev empty" },
        -- ["s"] = { "%", desc = "Parenthesis navigate", noremap = true},
        ["<A-j>"] = { ":m +1<CR>==", desc = "move lines down", noremap = true },
        ["<A-k>"] = { ":m -2<CR>==", desc = "move lines up", noremap = true },
        -- ["<"] = { "#", desc = "Prev occasion"},
        -- [">"] = { "*", desc = "Next occasion"}
      },
    },
  },
}
