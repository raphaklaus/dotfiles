lvim.builtin.telescope.on_config_done = function(telescope)
  pcall(telescope.load_extension, "macros")
end

lvim.builtin.which_key.mappings["M"] = { "<cmd>Telescope macros<CR>", "Macros" }
