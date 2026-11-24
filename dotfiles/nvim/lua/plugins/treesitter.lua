return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {},
    auto_install = false,
    indent = {
        enable = true,
        disable = { "nix" }, -- Fixes broken {} brace indentation in .nix files
      },
  },
}
