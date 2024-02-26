require 'lspconfig'.rust_analyzer.setup {
  settings = {
    ["rust-analyzer"] = {
      server = {
        extraEnv = {
          CARGO_TARGET_DIR = "target/analyzer",
        },
      },
      checkOnSave = {
        extraArgs = { "--target-dir=target/analyzer" },
      },
    },
  },
}
