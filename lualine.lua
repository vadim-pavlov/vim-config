require'lualine'.setup {
    options = {
        theme = 'everforest'
    },
    sections = {
        lualine_a = {
            {
                'mode',
                fmt = function(str) return str:sub(1,1) end
            }
        },
        lualine_c = {
            {
                'filename',
                path = 1,
            }
        },
    },
    inactive_sections = {
        lualine_c = {
            {
                'filename',
                path = 1,
            }
        },
    },
}
