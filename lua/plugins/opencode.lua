return {
  "Kurama622/llm.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
  },
  cmd = {
    "LLMSessionToggle",
    "LLMSelectedTextHandler",
    "LLMAppHandler",
  },

  config = function()
    require("llm").setup {
      -- OpenRouter
      url = "https://openrouter.ai/api/v1/chat/completions",
      model = "openai/gpt-oss-120b:free",

      prefix = {
        user = { text = "😃 ", hl = "Title" },
        assistant = { text = "  ", hl = "Added" },
      },

      save_session = true,
      max_history = 15,
      max_history_name_length = 20,

      -- stylua: ignore
      keys = {
        -- Input window
        ["Input:Submit"]      = { mode = "n", key = "<CR>" },
        ["Input:Cancel"]      = { mode = { "n", "i" }, key = "<C-c>" },
        ["Input:Resend"]      = { mode = { "n", "i" }, key = "<C-r>" },

        -- History (save_session = true)
        ["Input:HistoryNext"] = { mode = { "n", "i" }, key = "<C-j>" },
        ["Input:HistoryPrev"] = { mode = { "n", "i" }, key = "<C-k>" },

        -- Output (split)
        ["Output:Ask"]        = { mode = "n", key = "i" },
        ["Output:Cancel"]     = { mode = "n", key = "<C-c>" },
        ["Output:Resend"]     = { mode = "n", key = "<C-r>" },

        -- Session
        ["Session:Toggle"]    = { mode = "n", key = "<leader>ac" },
        ["Session:Close"]     = { mode = "n", key = { "<Esc>", "Q" } },

        -- Scroll
        ["PageUp"]            = { mode = { "i", "n" }, key = "<C-b>" },
        ["PageDown"]          = { mode = { "i", "n" }, key = "<C-f>" },
        ["HalfPageUp"]        = { mode = { "i", "n" }, key = "<C-u>" },
        ["HalfPageDown"]      = { mode = { "i", "n" }, key = "<C-d>" },
        ["JumpToTop"]         = { mode = "n", key = "gg" },
        ["JumpToBottom"]      = { mode = "n", key = "G" },
      },
    }
  end,

  -- Lazy.nvim keymaps (THIS was broken before)
  keys = {
    {
      "<leader>ac",
      "<cmd>LLMSessionToggle<CR>",
      mode = "n",
      desc = "LLM: Toggle session",
    },
    {
      "<leader>ae",
      "<cmd>LLMSelectedTextHandler 请解释下面这段代码<CR>",
      mode = "v",
      desc = "LLM: Explain code",
    },
    {
      "<leader>ts",
      "<cmd>LLMSelectedTextHandler 英译汉<CR>",
      mode = "x",
      desc = "LLM: Translate EN → CN",
    },
  },
}
