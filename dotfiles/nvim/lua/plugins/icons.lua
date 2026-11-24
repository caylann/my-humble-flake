return {
  -- 1. Disable mini.icons so it stops overriding devicons
  { "nvim-mini/mini.icons", enabled = false },

  -- 2. Enable nvim-web-devicons for full programming language logos
  {
    "nvim-tree/nvim-web-devicons",
    lazy = false,
    opts = {
      -- Optional: if you want an even sharper C hexagon glyph instead of devicons' default
      override_by_extension = {
        ["c"] = {
          icon = "", -- Devicons C glyph (or try "  " for the bold hexagon C)
          color = "#599eff",
          name = "C",
        },
        ["h"] = {
          icon = "",
          color = "#a074c4",
          name = "H",
        },
        -- C++ source files
        ["cpp"] = { icon = "", color = "#519aba", name = "Cpp" },
        ["cxx"] = { icon = "", color = "#519aba", name = "Cxx" },
        ["cc"]  = { icon = "", color = "#519aba", name = "Cc" },

        -- C++ header files
        ["hpp"] = { icon = "", color = "#a074c4", name = "Hpp" },
        ["hxx"] = { icon = "", color = "#a074c4", name = "Hxx" },
        ["hh"]  = { icon = "", color = "#a074c4", name = "Hh" },
      },
    },
  },
}
