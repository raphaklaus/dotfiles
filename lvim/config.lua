reload 'plugin/sideways'
reload 'plugin/telescope'
reload 'plugin/nvim-llama'
reload 'plugins/multi-line-select'

lvim.builtin.terminal.active = true
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.insert_mode["jj"] = "<ESC>"
vim.wo.relativenumber = true
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.format_on_save.enabled = true
-- Sane pasting behaviour when visual mode
vim.keymap.set("x", "p", "P", { silent = true })

lvim.plugins = {
  {
    "christoomey/vim-tmux-navigator",
    "tpope/vim-surround",
    "easymotion/vim-easymotion",
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
    'jpmcb/nvim-llama',
    { '0x100101/lab.nvim',              run = 'cd js && npm ci' },
    { 'michaeljsmith/vim-indent-object' },
    'Rasukarusan/nvim-select-multi-line'
    -- "klen/nvim-test",
    -- "airblade/vim-rooter"
  },
}
