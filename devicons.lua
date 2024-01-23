local jshtml = {
    icon = "",
    color = "#428850",
    cterm_color = "65",
    name = "jshtml"
}

require('nvim-web-devicons').setup({
    override = {
        jshtml = jshtml
    },
    override_by_extension = {
        ["tpl"] = jshtml
    }
});
