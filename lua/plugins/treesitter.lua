-- Customize Treesitter

---@type LazySpec
return {
  "AstroNvim/astrocore",
  opts = {
    treesitter = {
      ensure_installed = { "yaml", "javascript", "typescript", "tsx" },
    },
  },
}
