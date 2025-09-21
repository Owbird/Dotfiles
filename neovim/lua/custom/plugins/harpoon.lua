-- Harpoon plugin configuration for quick file navigation
-- Harpoon allows you to mark files and quickly jump between them
return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")

    -- REQUIRED
    harpoon:setup()

    -- Basic telescope configuration for Harpoon (optional)
    local conf = require("telescope.config").values
    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
          results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
      }):find()
    end

    -- Harpoon keymaps
    vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end, { desc = "[H]arpoon [A]dd file" })
    vim.keymap.set("n", "<leader>hh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "[H]arpoon toggle menu" })
    vim.keymap.set("n", "<leader>ht", function() toggle_telescope(harpoon:list()) end, { desc = "[H]arpoon [T]elescope" })
    vim.keymap.set("n", "<leader>hr", function() 
      local harpoon_list = harpoon:list()
      local current_file_abs = vim.fn.expand("%:p")
      local current_file_rel = vim.fn.expand("%")
      
      -- Debug: print what we're looking for
      print("Looking for: " .. current_file_abs)
      print("Relative: " .. current_file_rel)
      
      -- Find the index of the current file
      for i, item in ipairs(harpoon_list.items) do
        print("Item " .. i .. ": " .. item.value)
        if item.value == current_file_abs or item.value == current_file_rel or 
           vim.fn.resolve(item.value) == current_file_abs then
          harpoon_list:remove_at(i)
          print("Removed " .. vim.fn.expand("%:t") .. " from harpoon at position " .. i)
          return
        end
      end
      print("Current file not found in harpoon list")
    end, { desc = "[H]arpoon [R]emove current file" })

    -- Navigate to specific files
    vim.keymap.set("n", "<leader>h1", function() harpoon:list():select(1) end, { desc = "[H]arpoon file [1]" })
    vim.keymap.set("n", "<leader>h2", function() harpoon:list():select(2) end, { desc = "[H]arpoon file [2]" })
    vim.keymap.set("n", "<leader>h3", function() harpoon:list():select(3) end, { desc = "[H]arpoon file [3]" })
    vim.keymap.set("n", "<leader>h4", function() harpoon:list():select(4) end, { desc = "[H]arpoon file [4]" })

    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end, { desc = "Harpoon previous" })
    vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end, { desc = "Harpoon next" })

    -- Alternative keybindings for quick navigation (using Ctrl+number)
    vim.keymap.set("n", "<C-1>", function() harpoon:list():select(1) end, { desc = "Harpoon file 1" })
    vim.keymap.set("n", "<C-2>", function() harpoon:list():select(2) end, { desc = "Harpoon file 2" })
    vim.keymap.set("n", "<C-3>", function() harpoon:list():select(3) end, { desc = "Harpoon file 3" })
    vim.keymap.set("n", "<C-4>", function() harpoon:list():select(4) end, { desc = "Harpoon file 4" })
  end,
}