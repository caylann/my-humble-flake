return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        sources = {
          explorer = {
            hidden = true, -- Show dotfiles (e.g., .env, .gitignore)
            ignored = true, -- Optional: also show files ignored by git
            auto_close = false,
            focus = "list",
          },
        },
      },
    },
  },
}
