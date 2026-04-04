return {
   "nvimtools/none-ls.nvim",
   event = "VeryLazy",
   dependencies = { "mason.nvim" },
   config = function()
     local null_ls = require "null-ls"
     null_ls.setup {
       sources = {},
     }
   end,
}