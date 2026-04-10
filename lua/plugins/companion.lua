return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    interactions = {
      chat = {
        adapter = "anthropic",
        model = "opus",
      },
      cli = {
        agent = "claude_code", -- set as default
        agents = {
          claude_code = {
            cmd = "claude", -- must be on your PATH
            args = {},
            description = "Claude Code CLI",
            provider = "terminal",
          },
        },
      },
    },
    -- NOTE: The log_level is in `opts.opts`
    opts = {
      log_level = "DEBUG",
    },
  },
}
