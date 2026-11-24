return {
  -- Stop mason-lspconfig from running or trying to auto-install LSPs
  { "mason-org/mason-lspconfig.nvim", enabled = false },

  -- Tell nvim-lspconfig to skip Mason checks for all servers
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ["*"] = {
          mason = false,
        },
      },
    },
  },

  -- Clear Mason's own ensure_installed list
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = {}
    end,
  },
}
