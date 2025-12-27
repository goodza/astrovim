return {
  "Kurama622/llm.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "MunifTanjim/nui.nvim" },
  cmd = { "LLMSessionToggle", "LLMSelectedTextHandler", "LLMAppHandler" },
  config = function()
    require("llm").setup {
      url = "https://models.inference.ai.azure.com/chat/completions",
      model = "gpt-4o-mini",
      api_type = "openai",
    }
  end,
  keys = {
    { "<leader>ac", mode = "n", "<cmd>LLMSessionToggle<cr>" },
  },
}
