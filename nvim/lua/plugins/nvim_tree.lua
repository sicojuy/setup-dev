local nnoremap = require('../common').nnoremap

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  open_on_setup = true,
  open_on_tab = false,
  view = {
    adaptive_size = false,
    mappings = {
      list = {
        { key = "t", action = "tabnew" },
        { key = "s", action = "split" },
        { key = "v", action = "vsplit" },
        { key = "u", action = "dir_up" },
        { key = "x", action = "close_node" },
        { key = "m", action = "cut" },
        { key = "y", action = "copy" },
      },
    },
  },
  renderer = {
    group_empty = true,
    icons = {
      webdev_colors = true,
      git_placement = "after",
      padding = " ",
      symlink_arrow = " => ",
      show = {
        file = true,
        folder = true,
        folder_arrow = false,
        git = true,
      },
      glyphs = {
        default = " ",
        symlink = " ",
        folder = {
          arrow_closed = "▸",
          arrow_open = "▾",
          default = "▸",
          open = "▾",
          empty = "▸",
          empty_open = "▾",
          symlink = "▸",
          symlink_open = "▾",
        },
        git = {
          unstaged = "✗",
          staged = "✓",
          unmerged = "",
          renamed = "➜",
          untracked = "★",
          deleted = "",
          ignored = "◌",
        },
      },
    },
  },
  filters = {
    dotfiles = true,
  },
})

nnoremap('<leader>n', '<cmd>NvimTreeToggle<cr>')
