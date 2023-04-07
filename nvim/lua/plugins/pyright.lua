return {
  -- add pyright to lspconfig
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- pyright will be automatically installed with mason and loaded with lspconfig
        pyright = {
          cmd = { "pyright-langserver", "--stdio" },
          filetypes = { "python" },
          settings = {
            python = {
              analysis = {
                typeCheckingMode = "off",
                autoSearchPaths = true,
                diagnosticMode = "workspace",
                useLibraryCodeForTypes = true,
                diagnosticSeverityOverrides = {
                  reportUnusedExpression = "none",
                  reportUnusedImport = "none",
                },
              },
            },
          },
          single_file_support = true,
        },
      },
    },
  },
}
