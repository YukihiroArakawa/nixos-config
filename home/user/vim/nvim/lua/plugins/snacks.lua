local function project_root()
  local path = vim.api.nvim_buf_get_name(0)
  local start = path ~= "" and vim.fs.dirname(path) or vim.uv.cwd()
  return vim.fs.root(start, { ".git" }) or vim.uv.cwd()
end

return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      bigfile = { enabled = true },
      explorer = { enabled = true },
      input = { enabled = true },
      lazygit = { enabled = true },
      notifier = {
        enabled = true,
        timeout = 3000,
      },
      picker = { enabled = true },
      terminal = { enabled = true },
    },
    keys = {
      {
        "<leader>e",
        function()
          Snacks.explorer({ cwd = project_root() })
        end,
        desc = "File Explorer",
      },
      {
        "<leader><space>",
        function()
          Snacks.picker.files({ cwd = project_root() })
        end,
        desc = "Find Files",
      },
      {
        "<leader>gg",
        function()
          Snacks.lazygit({ cwd = project_root() })
        end,
        desc = "Lazygit",
      },
      {
        "<leader>sg",
        function()
          Snacks.picker.grep({ cwd = project_root() })
        end,
        desc = "Grep",
      },
      {
        "<C-/>",
        function()
          Snacks.terminal(nil, { cwd = project_root() })
        end,
        desc = "Toggle Terminal",
        mode = { "n", "t" },
      },
      {
        "<C-_>",
        function()
          Snacks.terminal(nil, { cwd = project_root() })
        end,
        desc = "which_key_ignore",
        mode = { "n", "t" },
      },
    },
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {},
  },
  {
    "nvim-mini/mini.icons",
    lazy = true,
    opts = {},
  },
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
  },
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    keys = {
      { "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Previous buffer" },
      { "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
    },
    opts = {
      options = {
        diagnostics = "nvim_lsp",
        separator_style = "thin",
        show_buffer_close_icons = false,
        show_close_icon = false,
      },
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      options = {
        component_separators = "",
        section_separators = "",
        globalstatus = true,
        theme = "auto",
      },
    },
  },
}
