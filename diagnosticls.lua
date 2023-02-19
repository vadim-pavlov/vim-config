require('lspconfig').diagnosticls.setup{
    filetypes = { "python" },
    init_options = {
        filetypes = {
            python = "flake8"
        },
        linters = {
            flake8 = {
                command = "flake8",
                debounce = 100,
                args = {
                    "--format=%(row)d,%(col)d,%(code).1s,%(code)s: %(text)s",
                    "-"
                },
                offsetLine = 0,
                offsetColumn = 0,
                sourceName = "flake8",
                formatLines = 1,
                formatPattern = {
                    "(\\d+),(\\d+),([A-Z]),(.*)(\\r|\\n)*$",
                    {
                        line = 1,
                        column = 2,
                        security = 3,
                        message = 4
                    }
                },
                securities = {
                    W = "warning",
                    E = "error",
                    F = "error",
                    C = "error",
                    N = "error"
                }
            }
        }
    }
}
