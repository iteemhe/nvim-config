local config = {
    show_end_of_line = true,
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true,
    show_trailing_blankline_indent = false,
}

require("indent_blankline").setup(config)
