-- Yazi.nvim plugin configuration for terminal file manager integration
-- Yazi is a blazing fast terminal file manager written in Rust
return {
  "mikavilpas/yazi.nvim",
  event = "VeryLazy",
  keys = {
    -- Open yazi at the current file
    {
      "<leader>dy",
      "<cmd>Yazi<cr>",
      desc = "Open yazi at the current file",
    },
    -- Open yazi at the current working directory
    {
      "<leader>dY",
      "<cmd>Yazi cwd<cr>",
      desc = "Open yazi at the current working directory",
    },
    -- Open yazi at the project root (git root)
    {
      "<leader>dr",
      "<cmd>Yazi toggle<cr>",
      desc = "Resume the last yazi session",
    },
  },
  opts = {
    -- If you want to open yazi instead of netrw, see below for more info
    open_for_directories = false,
    keymaps = {
      show_help = '<f1>',
      open_file_in_vertical_split = '<c-v>',
      open_file_in_horizontal_split = '<c-x>',
      open_file_in_tab = '<c-t>',
      grep_in_directory = '<c-s>',
      replace_in_directory = '<c-g>',
      cycle_open_buffers = '<tab>',
      copy_relative_path_to_selected_files = '<c-y>',
      send_to_quickfix_list = '<c-q>',
    },
    -- Configuration for floating window when yazi is opened
    floating_window_scaling_factor = 0.9,
    yazi_floating_window_winblend = 0,
    yazi_floating_window_border = 'rounded',
  },
}