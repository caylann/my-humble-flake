return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = {
        enabled = false,
      },

      servers = {
        nil_ls = {
          mason = false,
          settings = {
            ["nil"] = {
              nix = {
                flake = {
                  autoArchive = false,
                  autoEvalInputs = true,
                },
              },
            },
          },
        },

        clangd = {
          on_attach = function(client, _)
            client.server_capabilities.documentFormattingProvider = false
            client.server_capabilities.documentRangeFormattingProvider = false
          end,
        },
      },
    },
  },
}
