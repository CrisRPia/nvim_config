require("lazy").setup({
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
    },
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
    { "nvim-treesitter/playground" },
    {
        "theprimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
    },
    { "mbbill/undotree" },
    { "tpope/vim-fugitive" },
    { "neovim/nvim-lspconfig" },
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    { "L3MON4D3/LuaSnip" },
    { "nvim-telescope/telescope-project.nvim" },
    { "mfussenegger/nvim-dap" },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    },
    { "jay-babu/mason-nvim-dap.nvim" },
    { "theHamsta/nvim-dap-virtual-text" },
    { "ThePrimeagen/vim-be-good" },
    { "nvim-telescope/telescope-ui-select.nvim" },
    {
        "folke/trouble.nvim",
        dependencies = "nvim-tree/nvim-web-devicons",
        config = function()
            require("trouble").setup({})
        end,
    },
    { "nvim-lualine/lualine.nvim" },
    { "nvim-treesitter/nvim-treesitter-context" },
    { "sbdchd/neoformat" },
    { "mracos/mermaid.vim" },
    { "NvChad/nvim-colorizer.lua" },
    {
        "stevearc/oil.nvim",
        config = function()
            require("oil").setup()
        end,
    },
    { "LhKipp/nvim-nu" },
    {
        "rose-pine/neovim",
        name = "rose-pine",
    },
    { "HiPhish/rainbow-delimiters.nvim" },
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
        },
    },
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
            signs = false,
            gui_style = {
                fg = "NONE", -- The gui style to use for the fg highlight group.
                bg = "BOLD", -- The gui style to use for the bg highlight group.
            },
        },
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
    },
    { "romainl/vim-cool" },
    { "mfussenegger/nvim-jdtls" },
    -- {
    --     "numToStr/Comment.nvim",
    --     opts = {
    --         -- add any options here
    --     },
    --     lazy = false,
    -- },
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release "
            .. "&& cmake --build build --config Release "
            .. "&& cmake --install build --prefix build",
    },
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = true,
    },
    { "lewis6991/gitsigns.nvim" },
    { "dmmulroy/tsc.nvim" },
    { "windwp/nvim-ts-autotag" },
    { "nvim-java/nvim-java" },
    { "nat-418/boole.nvim" },
    {
        "saghen/blink.cmp",
        dependencies = {
            "rafamadriz/friendly-snippets",
            "mikavilpas/blink-ripgrep.nvim",
        },
        version = "*",
    },
    { "karb94/neoscroll.nvim" },
    { "Apeiros-46B/qalc.nvim" },
    {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
            library = {
                -- See the configuration section for more details
                -- Load luvit types when the `vim.uv` word is found
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            },
        },
    },
})
