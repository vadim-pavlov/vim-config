require('nvim-test').setup {
    termOpts = {
        direction = "horizontal",   -- terminal's direction ("horizontal"|"vertical"|"float")
    },
    runners = {
        python = "nvim-test-my-runners.django",
    }
}
require('nvim-test-my-runners.django'):setup {
    command = "python",
    args = { "manage.py", "test" },
}
