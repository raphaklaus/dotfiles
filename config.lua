local cmp = require "cmp"
--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

vim.opt.relativenumber = true
-- general
lvim.log.level = "warn"
lvim.format_on_save.enabled = true
lvim.colorscheme = "lunar"
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.insert_mode["jj"] = "<ESC>"
vim.keymap.set('n', 'ga<', '<cmd>SidewaysLeft<cr>')
vim.keymap.set('n', 'ga>', '<cmd>SidewaysRight<cr>')
vim.keymap.set('o', 'aa', '<plug>SidewaysArgumentTextobjA', { remap = true })
vim.keymap.set('x', 'aa', '<plug>SidewaysArgumentTextobjA', { remap = true })
vim.keymap.set('o', 'ia', '<plug>SidewaysArgumentTextobjI', { remap = true })
vim.keymap.set('x', 'ia', '<plug>SidewaysArgumentTextobjI', { remap = true })
-- lvim.keys.normal_mode["<Leader>sb"] = ''
lvim.builtin.which_key.mappings.s["m"] = { ":Telescope vim_bookmarks all<cr>", "Bookmarks" }

-- lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
-- lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
-- unmap a default keymapping
-- vim.keymap.del("n", "<C-Up>")
-- override a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
-- local _, actions = pcall(require, "telescope.actions")
-- lvim.builtin.telescope.defaults.mappings = {
--   -- for input mode
--   i = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--     ["<C-n>"] = actions.cycle_history_next,
--     ["<C-p>"] = actions.cycle_history_prev,
--   },
--   -- for normal mode
--   n = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--   },
-- }

-- Change theme settings
-- lvim.builtin.theme.options.dim_inactive = true
-- lvim.builtin.theme.options.style = "storm"

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
--   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
-- }

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false
-- lvim.builtin.nvimtree.setup.update_focused_file.update_cwd = false

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enable = true

require('git').setup({
  default_mappings = true, -- NOTE: `quit_blame` and `blame_commit` are still merged to the keymaps even if `default_mappings = false`

  keymaps = {
    -- Open blame window
    blame = "<Space>gL",
    -- Close blame window
    quit_blame = "q",
    -- Open blame commit
    blame_commit = "<CR>",
    -- Opens a new diff that compares against the current index
    diff = "<Space>gdf",
    -- Close git diff
    diff_close = "<Space>gD",
    -- Revert to the specific commit
    revert = "<Space>gr",
    -- Revert the current file to the specific commit
    revert_file = "<Space>gR",
  },
  -- Default target branch when create a pull request
  target_branch = "master",
})

-- lvim.builtin.project.active = false
-- lvim.builtin.project.manual_mode = true

-- cmp.setup({
--   mapping = cmp.mapping.preset.insert({
--     ['<C-space>'] = cmp.mapping.complete()
--   })
-- })

-- lvim.builtin.cmp.mappings["I"] = {
--   ['<C-space>'] = cmp.mapping.complete()
-- }

-- generic LSP settings

-- -- make sure server will always be installed even if the server is in skipped_servers list
-- lvim.lsp.installer.setup.ensure_installed = {
--     "sumneko_lua",
--     "jsonls",
-- }
-- -- change UI setting of `LspInstallInfo`
-- -- see <https://github.com/williamboman/nvim-lsp-installer#default-configuration>
-- lvim.lsp.installer.setup.ui.check_outdated_servers_on_open = false
-- lvim.lsp.installer.setup.ui.border = "rounded"
-- lvim.lsp.installer.setup.ui.keymaps = {
--     uninstall_server = "d",
--     toggle_server_expand = "o",
-- }

-- ---@usage disable automatic installation of servers
-- lvim.lsp.installer.setup.automatic_installation = false

-- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
-- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "prettier", filetypes = { "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "css",
    "html",
    "json",
    "yaml",
    "markdown",
    "graphql" } },
  -- { command = "isort", filetypes = { "python" } },
  -- {
  --   -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
  --   -- command = "prettier",
  --   ---@usage arguments to pass to the formatter
  --   -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
  --   -- extra_args = { "--print-with", "100" },
  --   ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
  --   -- filetypes = { "typescript", "typescriptreact" },
  -- },
}

-- -- set additional linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "eslint_d", filetypes = { "typescript" } },
  -- {
  --   -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
  --   command = "shellcheck",
  --   ---@usage arguments to pass to the formatter
  --   -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
  --   extra_args = { "--severity", "warning" },
  -- },
  -- {
  --   command = "codespell",
  --   ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
  --   filetypes = { "javascript", "python" },
  -- },
}

-- Additional Plugins
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
    "MattesGroeger/vim-bookmarks",
    "tom-anders/telescope-vim-bookmarks.nvim",
    "nvim-telescope/telescope-live-grep-args.nvim",
    -- "klen/nvim-test",
    -- "airblade/vim-rooter"
  },
}
require('telescope').load_extension('vim_bookmarks')

lvim.builtin.telescope.on_config_done = function(telescope)
  pcall(telescope.load_extension, "live_grep_args")
end

lvim.builtin.which_key.mappings.s["q"] = { ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
  "Text with arguments" }
-- vim.keymap.set('n', '<Leader>sq', ':lua require(\'telescope\').extensions.live_grep_args.live_grep_args()<CR>',
-- { remap = true })
-- lvim.keys.normal_mode["<leader>st"] = ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>"
-- vim.keymap.set("n", "<leader>fg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
-- vim.cmd [[
--   " let g:test#javascript#runner = "jest"
--   let g:test#javascript#mocha#executable = 'yarn test'
--   let g:test#javascript#mocha#file_pattern = '.*'
--   " let test#project_root = "~/src/tier/iot-monorepo"
--   let test#strategy = "neovim"
--   " let g:test#runner_commands = ['Mocha']
--   let g:test#preserve_screen = 1
-- ]]
-- vim.lsp.buf.references({ includeDeclaration = false })

-- vim.keymap.set("n", "gr", function()
--   require("telescope.builtin").lsp_references({ includeDeclaration = false })
-- end)
lvim.lsp.buffer_mappings.normal_mode['gr'] = { "<cmd>lua vim.lsp.buf.references({ includeDeclaration = false })<CR>",
  "Go to reference" }
-- vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references({ includeDeclaration = false })<CR>",
--   { remap = true })

lvim.builtin.telescope.defaults = {
  -- use fd to "find files" and return absolute paths
  -- find_command = { "fd", "-t=f", "-a" },
  path_display = { "truncate" },
  wrap_results = true
}
-- vim.g["test#javascript#runner"] = 'pwd'
-- vim.g["test#project_root"] = '/home/klaus/src/tier/iot-monorepo'
-- vim.g["test#filename_modifier"] = ':p'
-- vim.cmd [[
--   let g:test#javascript#runner = 'pwd'
--   let g:test#filename_modifier = ':p'
-- ]]
-- vim.cmd [[
--   let g:test#javascript#runner = 'yarn test'
--   let g:test#javascript#jest#file_pattern = '\v(.*|(spec|test))\.(js|jsx|coffee|ts|tsx)$'
-- ]]
-- require('nvim-test').setup {
--   run = true, -- run tests (using for debug)
--   commands_create = true, -- create commands (TestFile, TestLast, ...)
--   filename_modifier = ":.", -- modify filenames before tests run(:h filename-modifiers)
--   silent = false, -- less notifications
--   term = "terminal", -- a terminal to run ("terminal"|"toggleterm")
--   termOpts = {
--     direction = "vertical", -- terminal's direction ("horizontal"|"vertical"|"float")
--     width = 96, -- terminal's width (for vertical|float)
--     height = 24, -- terminal's height (for horizontal|float)
--     go_back = false, -- return focus to original window after executing
--     stopinsert = "auto", -- exit from insert mode (true|false|"auto")
--     keep_one = true, -- keep only one terminal for testing
--   },
--   runners = { -- setup tests runners
--     cs = "nvim-test.runners.dotnet",
--     go = "nvim-test.runners.go-test",
--     haskell = "nvim-test.runners.hspec",
--     javascriptreact = "nvim-test.runners.jest",
--     javascript = "nvim-test.runners.jest",
--     lua = "nvim-test.runners.busted",
--     python = "nvim-test.runners.pytest",
--     ruby = "nvim-test.runners.rspec",
--     rust = "nvim-test.runners.cargo-test",
--     typescript = "nvim-test.runners.jest",
--     typescriptreact = "nvim-test.runners.jest",
--   }
-- }

-- require('nvim-test.runners.jest'):setup {
--   command = "yarn test", -- a command to run the test runner
--   -- command = "~/node_modules/.bin/jest", -- a command to run the test runner
--   args = { "--collectCoverage=false" }, -- default arguments
--   -- env = { CUSTOM_VAR = 'value' }, -- custom environment variables

--   file_pattern = "\\v(__tests__/.*|(spec|test))\\.(js|jsx|coffee|ts|tsx)$", -- determine whether a file is a testfile
--   find_files = { "{name}.test.{ext}", "{name}.spec.{ext}" }, -- find testfile for a file

--   filename_modifier = nil, -- modify filename before tests run (:h filename-modifiers)
--   working_directory = nil, -- set working directory (cwd by default)
-- }

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- vim.api.nvim_create_autocmd("BufEnter", {
--   pattern = { "*.json", "*.jsonc" },
--   -- enable wrap mode for json files only
--   command = "setlocal wrap",
-- })
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })
