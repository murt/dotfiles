return {
    {
        "neovim/nvim-lspconfig",
        config = function()
            require "configs.lspconfig"
        end,
    },
    {
        "mfussenegger/nvim-lint"
    },
    {
        "stevearc/conform.nvim",
        -- event = 'BufWritePre', -- uncomment for format on save
        opts = require "configs.conform",
    },

    -- File Explorer
    {
        "nvim-tree/nvim-tree.lua",
        opts = {
            view = {
                width = 35,
                side = "left",
                preserve_window_proportions = true,
            },
            actions = {
                open_file = { quit_on_open = false },
            },
            update_focused_file = {
                enable = true,
                update_root = true,
            },
            tab = {
                sync = {
                    open = true,
                    close = false,
                },
            },
        },
    },

    -- Tabs
    {
        "nanozuki/tabby.nvim",
        lazy = false,
        config = function()
            require("configs.tabby")
        end
    },

    -- Dropbar
    {
        "Bekaboo/dropbar.nvim",
        -- optional, but required for fuzzy finder support
        dependencies = {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
        },
    },

    -- mason & friends
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {},
        dependencies = {
            "neovim/nvim-lspconfig",
        },
    },
    {
        "rshkarin/mason-nvim-lint",
        dependencies = {
            "mfussenegger/nvim-lint",
        },
    },
    {
        "zapling/mason-conform.nvim",
        dependencies = {
            "stevearc/conform.nvim",
        },
    },

    -- test new blink
    { import = "nvchad.blink.lazyspec" },

    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                "vim",
                "lua",
                "vimdoc",
                "html",
                "css",
                "python",
            },
        },
    },
}
