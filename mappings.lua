-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
vim.api.nvim_set_keymap('n', 'd', '<Nop>', {noremap = true})
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map

    -- navigate buffer tabs with `H` and `L`
    -- L = {
    --   function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
    --   desc = "Next buffer",
    -- },
    -- H = {
    --   function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
    --   desc = "Previous buffer",
    -- },

    -- mappings seen under group name "Buffer"
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
   

    -- Navigation 
    ["q"] = { "b", desc = "Prev word" },
    ["D"] = { "dd", desc = "delete"},
    ["Q"] = { "^", desc = "Begining of line"},
    ["E"] = {"$", desc = "End of line"},
    ["s"] = { "}", desc = "Next empty"},
    -- ["d"] = { "<Nop>", desc = "Next empty", noremap=true},
    ["w"] = { "{", desc = "Prev empty"},
    -- ["s"] = { "%", desc = "Parenthesis navigate", noremap = true},
    -- Move
    ["<A-j>"] = { ":m +1<CR>==", desc ="move lines down", noremap = true},
    ["<A-k>"] = { ":m -2<CR>==", desc ="move lines up", noremap = true},
    -- ["z"] = { ":q!<CR>", desc="Exit without save", noremap = true },
    ["Z"] = { "ZZ", desc="Exit with save", noremap = true },
  },





  v = {
    ["q"] = { "b", desc = "Prev word" },
    ["w"] = { "{", desc = "Prev empty"},
    ["D"] = { "dd", desc = "delete"},
    ["Q"] = { "^", desc = "Begining of line"},
    ["E"] = {"$", desc = "End of line"},
    ["s"] = { "}", desc = "Next empty", silent= true},
    ["w"] = { "{", desc = "Prev empty"},
    -- ["s"] = { "%", desc = "Parenthesis navigate", noremap = true},
    ["<A-j>"] = { ":m +1<CR>==", desc ="move lines down", noremap = true},
    ["<A-k>"] = { ":m -2<CR>==", desc ="move lines up", noremap = true},
    -- ["<"] = { "#", desc = "Prev occasion"},
    -- [">"] = { "*", desc = "Next occasion"}
  },

  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}
