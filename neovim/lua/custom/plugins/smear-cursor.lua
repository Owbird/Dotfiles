-- Smear-cursor plugin configuration for cursor trail effects
-- Provides a smear effect when the cursor moves quickly
return {
  "sphamba/smear-cursor.nvim",
  opts = {
    -- Cursor color. Defaults to Cursor GUI color if not set.
    cursor_color = "#d9e0ee",
    
    -- Background color. Defaults to Normal GUI background color if not set.
    normal_bg = "#11111b",
    
    -- Smear cursor when switching buffers or windows.
    smear_between_buffers = true,
    
    -- Smear cursor when moving in insert mode.
    smear_between_neighbor_lines = true,
    
    -- Use floating windows to display smears over wrapped lines or outside buffers.
    -- May have performance implications when used with very long wrapped lines.
    use_floating_windows = true,
    
    -- Set to `true` if your font supports legacy computing symbols (block unicode symbols).
    -- Smears will blend better on all backgrounds.
    legacy_computing_symbols_support = false,
    
    -- Attempt to hide the real cursor when smearing.
    hide_target_hack = true,
  },
}