-- Add local lua files to package path in order to be able to require plugins
local config_dir = vim.fn.stdpath('config')
package.path = config_dir .. "/?.lua;" .. package.path

lvim.builtin.nvimtree.active = false
lvim.builtin.nvimtree.setup.remove_keymaps = true

require('plugins.sideways')
require('plugins.telescope')
require('plugins.leap')
require('plugins.mini-files')
-- require('plugins.llm')
-- require('plugins.nvim-llama')
-- reload 'plugins/multi-line-select'
-- reload 'plugins/rust-analyzer'

-- lvim.keys.normal_mode["<Space>e"] = ":lua MiniFiles.open()<CR>"

lvim.builtin.terminal.active = true
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.insert_mode["jj"] = "<ESC>"
vim.wo.relativenumber = true
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.format_on_save.enabled = true

-- Sane pasting behaviour when visual mode
vim.keymap.set("x", "p", "P", { silent = true })
vim.opt.wrap = true

-- To be moved to its own module
-- require("neotest").setup({
--   adapters = {
--     require('rustaceanvim.neotest'),
--     require("neotest-plenary"),
--     require("neotest-vim-test")({
--       ignore_file_types = { "python", "vim", "lua" },
--     }),
--   },
-- })

-- LunarVim workaround for loading typescript lib
local lspconfig = require('lspconfig')
lspconfig.astro.setup({
  init_options = {
    typescript = {
      tsdk = vim.fs.normalize('~/src/booka/node_modules/typescript/lib')
    }
  },
})

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  {
    command = "prettier",
    filetypes = { "javascript",
      "javascriptreact",
      "typescript",
      "css",
      "html",
      "json",
      -- "yaml",
      "markdown",
      "graphql" }
  },
}

lvim.plugins = {
  {
    "ggandor/leap.nvim",
    "christoomey/vim-tmux-navigator",
    "tpope/vim-surround",
    -- "easymotion/vim-easymotion",
    "AndrewRadev/sideways.vim",
    "tikhomirov/vim-glsl",
    "tommcdo/vim-exchange",
    "dinhhuy258/git.nvim",
    "PeterRincker/vim-argumentative",
    "tpope/vim-fugitive",
    "vim-test/vim-test",
    "ruanyl/vim-gh-line",
    "tpope/vim-unimpaired",
    "tpope/vim-repeat",
    "tpope/vim-rhubarb",
    "MattesGroeger/vim-bookmarks",
    "tom-anders/telescope-vim-bookmarks.nvim",
    "nvim-telescope/telescope-live-grep-args.nvim",
    "othree/html5.vim",
    "pangloss/vim-javascript",
    "evanleck/vim-svelte",
    { '0x100101/lab.nvim',              run = 'cd js && npm ci' },
    { 'michaeljsmith/vim-indent-object' },
    'Rasukarusan/nvim-select-multi-line',
    "mg979/vim-visual-multi",
    "jeetsukumaran/vim-indentwise",
    "romainl/vim-qf",
    { 'echasnovski/mini.files', version = false },
    -- {
    --   'huggingface/llm.nvim'
    -- }
    -- {
    --   "nvim-neotest/neotest",
    --   dependencies = {
    --     "nvim-neotest/nvim-nio",
    --     "nvim-lua/plenary.nvim",
    --     "antoinemadec/FixCursorHold.nvim",
    --     "nvim-treesitter/nvim-treesitter"
    --   }
    -- },
    -- {
    --   'mrcjkb/rustaceanvim',
    --   version = '^4', -- Recommended
    --   lazy = false,   -- This plugin is already lazy
    -- },
    -- "nvim-neotest/neotest-plenary",
    -- "nvim-neotest/neotest-vim-test"
    -- { dir = "~/src/macromancer", dev = true, opts = {} } -- {
    --   "ecthelionvi/NeoComposer.nvim",
    --   dependencies = { "kkharji/sqlite.lua" },
    --   opts = {}
    -- },
    -- {
    --   "nvim-tree/nvim-tree.lua",
    --   version = "d35a8d5",
    --   lazy = false,
    --   dependencies = {
    --     "nvim-tree/nvim-web-devicons",
    --   },
    --   config = function()
    --     require("nvim-tree").setup {}
    --   end,
    -- }
    -- 'jpmcb/nvim-llama',
    -- "klen/nvim-test",
  },
}
