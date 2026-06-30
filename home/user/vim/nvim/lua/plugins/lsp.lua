return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      -- Advertise completion capabilities so LSP results and blink.cmp stay in sync.
      local capabilities = require("blink.cmp").get_lsp_capabilities()

      vim.diagnostic.config({
        severity_sort = true,
        float = { border = "rounded" },
        signs = true,
        underline = true,
        virtual_text = true,
      })

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(event)
          local map = function(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, { buffer = event.buf, desc = desc })
          end

          -- Keep LSP mappings buffer-local so they only exist where a server is actually attached.
          map("n", "gd", vim.lsp.buf.definition, "Go to definition")
          map("n", "gr", vim.lsp.buf.references, "References")
          map("n", "K", vim.lsp.buf.hover, "Hover")
          map("n", "<leader>ca", vim.lsp.buf.code_action, "Code action")
          map("n", "<leader>rn", vim.lsp.buf.rename, "Rename")
        end,
      })

      vim.lsp.config("ts_ls", {
        capabilities = capabilities,
        -- Cover both JS and TS buffers with one server so navigation works across mixed frontend projects.
        filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" },
      })

      vim.lsp.config("svelte", {
        capabilities = capabilities,
      })

      vim.lsp.enable("ts_ls")
      vim.lsp.enable("svelte")
    end,
  },
  {
    "saghen/blink.cmp",
    version = "*",
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
    opts = {
      keymap = { preset = "default" },
      appearance = {
        nerd_font_variant = "mono",
      },
      completion = {
        documentation = {
          -- Show docs eagerly because type details are a big part of TS/Svelte completion value.
          auto_show = true,
          auto_show_delay_ms = 200,
        },
      },
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },
    },
    opts_extend = { "sources.default" },
  },
}
