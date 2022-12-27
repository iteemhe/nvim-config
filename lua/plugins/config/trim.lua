local config = {
    -- if you want to ignore markdown file.
    -- you can specify filetypes.
    -- disable = { "markdown" },

    -- if you want to remove multiple blank lines
    patterns = {
        [[%s/\(\n\n\)\n\+/\1/]], -- replace multiple blank lines with a single line
    },
}

require("trim").setup(config)
