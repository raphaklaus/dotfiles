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
