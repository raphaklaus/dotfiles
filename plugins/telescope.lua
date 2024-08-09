lvim.builtin.telescope.defaults = {
  path_display = { "truncate" },
  wrap_results = true,
  vimgrep_arguments = {
    "rg",
    "--color=never",
    "--no-heading",
    "--with-filename",
    "--line-number",
    "--column",
    "--smart-case",
    "--hidden"
  },
  pickers = {
    find_files = {
      disable_devicons = false,
      hidden = true
    },
    live_grep = {
      additional_args = { "--hidden" }
    },
    git_files = {
      disable_devicons = false,
      hidden = true
    },
  },
}


lvim.builtin.telescope.on_config_done = function(telescope)
  pcall(telescope.load_extension, "live_grep_args")
end

lvim.builtin.which_key.mappings.s["q"] = { ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
  "Text with arguments" }
