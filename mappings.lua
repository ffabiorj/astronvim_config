-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    -- Moving like vscode
    ["<A-j>"] = {":m .+1<CR>=="},
    ["<A-k>"] = {":m .-2<CR>=="},
    -- kept the cursour in the middle
    ["<C-d>"] =  {"<C-d>zz"},
    ["<C-u>"] = {"<C-u>zz"},
    -- movie buffers 
    ["<S-h>"] = { ":bprevious<cr>"},
    ["<S-l>"] = { ":bnext<cr>"},
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(function(bufnr) require("astronvim.utils.buffer").close(bufnr) end)
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
  v = {
        -- Better indenting
    ["<"] = {"<gv"},
    [">"] = {">gv"},
  },
  i = {
   -- Move current line / block with Alt-j/k ala vscode.
    ["<A-j>"] = {"<Esc>:m .+1<CR>==gi"},
    -- Move current line / block with Alt-j/k ala vscode.
    ["<A-k>"] = {"<Esc>:m .-2<CR>==gi"},
  },
}
