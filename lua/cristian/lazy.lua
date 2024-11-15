require("lazy").setup({
    {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim', },
    },
    { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
    { "nvim-treesitter/playground" },
    {
        "theprimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" }
    },
    { "mbbill/undotree" },
    { "tpope/vim-fugitive" },
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v4.x',
        dependencies = {
            -- LSP Support
            { 'neovim/nvim-lspconfig', },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },
            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'hrsh7th/cmp-cmdline' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },
            { 'dmitmel/cmp-digraphs' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        }
    },
    { 'nvim-telescope/telescope-project.nvim' },
    { "mfussenegger/nvim-dap" },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio", },
    },
    { "jay-babu/mason-nvim-dap.nvim", },
    { "theHamsta/nvim-dap-virtual-text" },
    { "ThePrimeagen/vim-be-good" },
    { 'nvim-telescope/telescope-ui-select.nvim' },
    {
        "folke/trouble.nvim",
        dependencies = "nvim-tree/nvim-web-devicons",
        config = function()
            require("trouble").setup {}
        end
    },
    { "nvim-lualine/lualine.nvim" },
    { 'nvim-treesitter/nvim-treesitter-context' },
    { "sbdchd/neoformat" },
    { "mracos/mermaid.vim" },
    { "hrsh7th/cmp-nvim-lua" },
    { "NvChad/nvim-colorizer.lua" },
    {
        "stevearc/oil.nvim",
        config = function()
            require("oil").setup()
        end,
    },
    { "LhKipp/nvim-nu" },
    {
        'rose-pine/neovim',
        name = 'rose-pine'
    },
    {
        "folke/neodev.nvim",
        opts = {}
    },
    { "HiPhish/rainbow-delimiters.nvim" },
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
        }
    },
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
            signs = false,
            gui_style = {
                fg = "NONE", -- The gui style to use for the fg highlight group.
                bg = "BOLD", -- The gui style to use for the bg highlight group.
            }
        }
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
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release '
            .. '&& cmake --build build --config Release '
            .. '&& cmake --install build --prefix build',
    },
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = true
    },
    { "lewis6991/gitsigns.nvim" },
    { "tpope/vim-dadbod", },
    {
        'kristijanhusak/vim-dadbod-ui',
        dependencies = {
            { 'tpope/vim-dadbod',                     lazy = true },
            { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true }, -- Optional
        },
        cmd = {
            'DBUI',
            'DBUIToggle',
            'DBUIAddConnection',
            'DBUIFindBuffer',
        },
        init = function()
            -- Your DBUI configuration
            vim.g.db_ui_use_nerd_fonts = 1
        end,
    },
    { 'dmmulroy/tsc.nvim' },
    -- TODO: Prevent tailwind plugin from crashing.
    -- {
    --     "luckasRanarison/tailwind-tools.nvim",
    -- --     -- build = ":UpdateRemotePlugins",
    -- --     dependencies = {
    -- --         "nvim-treesitter/nvim-treesitter",
    -- --     },
    --     opts = require("after.plugin.tailwind")
    -- }
    { "windwp/nvim-ts-autotag" },
})
