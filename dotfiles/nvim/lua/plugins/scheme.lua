return {
  {
    "fxn/vim-monochrome",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
    config = function()
      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "monochrome",
        callback = function()
          local bg_black = "#070909"

          vim.api.nvim_set_hl(0, "Normal", { fg = "#F5F5F5", bg = "#070909" })
          vim.api.nvim_set_hl(0, "NormalNC", { fg = "#F5F5F5", bg = "#070909" })
          vim.api.nvim_set_hl(0, "Comment", { fg = "#666666", italic = true })
          vim.api.nvim_set_hl(0, "StatusLine", { fg = "#F5F5F5", bg = "#222222" })
          vim.api.nvim_set_hl(0, "LineNr", { fg = "#444444", bg = "#070909" })
          vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#F5F5F5", bg = "#111111" })
          vim.api.nvim_set_hl(0, "NeoTreeNormal", { fg = "#F5F5F5", bg = "#070909" })
          vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { fg = "#F5F5F5", bg = "#070909" })
          vim.api.nvim_set_hl(0, "PmenuSel", { fg = "#070909", bg = "#F5F5F5", bold = true })
          vim.api.nvim_set_hl(0, "NormalFloat", { bg = bg_black, fg = "#F5F5F5" })
          vim.api.nvim_set_hl(0, "FloatBorder", { bg = bg_black, fg = "#333333" })
          vim.api.nvim_set_hl(0, "FloatTitle", { bg = bg_black, fg = "#F5F5F5", bold = true })
        end,
      })
      vim.cmd.colorscheme("monochrome")
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "monochrome",
    },
  },
}
