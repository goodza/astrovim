return {
   "nvimtools/none-ls.nvim",
   commit = "e057efcb97c3d06a64739a9cc2acc18c0acdb894", -- Neovim 0.12 LSP compatibility
   event = "VeryLazy",
   dependencies = { "mason.nvim" },
   config = function()
     local null_ls = require "null-ls"
     null_ls.setup {
       sources = {},
     }
   end,
}