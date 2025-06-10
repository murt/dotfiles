return {
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            require "configs.lspconfig"
        end,
    },
    { "mason-org/mason.nvim", lazy = false, opts = {} },
    {
        "mfussenegger/nvim-lint"
    },
    {
        "stevearc/conform.nvim",
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
       	    "mason-org/mason.nvim",
            "neovim/nvim-lspconfig",
        },
    },
    {
        "rshkarin/mason-nvim-lint",
        lazy = false,
        dependencies = {
            "mason-org/mason.nvim",
            "mfussenegger/nvim-lint",
        },
    },
    {
        "zapling/mason-conform.nvim",
        lazy = false,
        dependencies = {
            "mason-org/mason.nvim",
            "stevearc/conform.nvim",
        },
    },
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
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
