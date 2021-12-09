vim.opt.listchars = {
  space = "⋅",
  eol = "↴",
}

vim.opt.termguicolors = true
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#555555  gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#333333  gui=nocombine]]

require("indent_blankline").setup {
    -- char = "|",
    buftype_exclude = {"terminal", "telescope"},
    filetype_exclude = {"help", "dashboard", "packer", "NvimTree", "Trouble"},
    space_char_blankline = " ",
    show_current_context = false,
    show_end_of_line = true,
    use_treesitter = true,
    space_char_blankline = " ",
    char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
    },
}
