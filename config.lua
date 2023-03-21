--[[
 THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT
 `lvim` is the global options object
]]
-- vim options
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.relativenumber = false

-- general
lvim.log.level = "info"
lvim.format_on_save = {
    enabled = true,
    pattern = "*.lua",
    timeout = 1000,
}
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings <https://www.lunarvim.org/docs/configuration/keybindings>
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["gt"] = ":bnext<cr>"
lvim.keys.normal_mode["gT"] = ":bprevious<cr>"

lvim.keys.normal_mode["C"] = false

lvim.keys.normal_mode["<leader>S"] = function()
    require('spectre').open()
end

lvim.keys.normal_mode["<leader>Sw"] = function()
    require('spectre').open_visual({
        select_word = true
    })
end


lvim.keys.normal_mode["<leader>Sf"] = function()
    require('spectre').open_file_search()
end

lvim.keys.normal_mode["<leader>rn"] = vim.lsp.buf.rename
lvim.keys.normal_mode["<leader>."] = vim.lsp.buf.code_actions


-- -- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["W"] = { "<cmd>noautocmd w<cr>", "Save without formatting" }
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }

-- -- Change theme settings
-- lvim.colorscheme = "lunar"

lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

-- Automatically install missing parsers when entering buffer
lvim.builtin.treesitter.auto_install = true

local nvimtree = lvim.builtin.nvimtree
nvimtree.setup.update_focused_file.update_cwd = false

local project = lvim.builtin.project
project.manual_mode = true

-- lvim.builtin.treesitter.ignore_install = { "haskell" }

-- -- always installed on startup, useful for parsers without a strict filetype
-- lvim.builtin.treesitter.ensure_installed = { "comment", "markdown_inline", "regex" }

-- -- generic LSP settings <https://www.lunarvim.org/docs/languages#lsp-support>

-- --- disable automatic installation of servers
-- lvim.lsp.installer.setup.automatic_installation = false

-- ---configure a server manually. IMPORTANT: Requires `:LvimCacheReset` to take effect
-- ---see the full default list `:lua =lvim.lsp.automatic_configuration.skipped_servers`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. IMPORTANT: Requires `:LvimCacheReset` to take effect
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- linters and formatters <https://www.lunarvim.org/docs/languages#lintingformatting>
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   { command = "stylua" },
--   {
--     command = "prettier",
--     extra_args = { "--print-width", "100" },
--     filetypes = { "typescript", "typescriptreact" },
--   },
-- }
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "flake8", filetypes = { "python" } },
--   {
--     command = "shellcheck",
--     args = { "--severity", "warning" },
--   },
-- }

-- -- Additional Plugins <https://www.lunarvim.org/docs/plugins#user-plugins>
lvim.plugins = {
    {
        "gbprod/yanky.nvim",
        config = function()
            require("yanky").setup({
            })
        end,
    },
    {
        "nathom/filetype.nvim",
        config = function()
            require("filetype").setup({
            })
        end,
    },
    {
        "posva/vim-vue",
        ft = {
            "vue"
        }
    },
    {
        "shmup/vim-sql-syntax",
        ft = {
            "sql"
        }
    },
    {
        "weilbith/nvim-code-action-menu",
        cmd = "CodeActionMenu"
    },
    {
        "terryma/vim-expand-region"
    },
    {
        "tpope/vim-surround"
    },
    {
        "vim-scripts/copypath.vim"
    },
    {
        "phaazon/hop.nvim",
        cmd = {
            "HopWord",
            "HopLine",
            "HopChar1",
            "HopChar2",
            "HopPattern"
        },
        config = function()
            require 'hop'.setup()
            vim.api.nvim_set_keymap("n", "s", ":HopChar2<cr>", { silent = true })
            vim.api.nvim_set_keymap("n", "S", ":HopWord<cr>", { silent = true })
        end
    },
    {
        "mg979/vim-visual-multi",
        event = "BufRead"
    },
    {
        "tpope/vim-fugitive",
        cmd = {
            "G"
        }
    },
    {
        "tpope/vim-sleuth"
    },
    {
        "qpkorr/vim-bufkill",
        event = "BufRead",
        cmd = {
            "BUN",
            "BD",
            "BW",
            "BB",
            "BF",
            "BA"
        }
    },
    {
        "ray-x/lsp_signature.nvim",
        event = "BufRead",
        config = function()
            require("lsp_signature").setup()
        end,
    },
    {
        "mbbill/undotree",
        cmd = {
            "UndotreeToggle"
        }
    },
    {
        "udalov/kotlin-vim",
        ft = {
            "kotlin"
        }
    },
    {
        "jparise/vim-graphql",
        ft = {
            "graphql"
        }
    },
    {
        "digitaltoad/vim-pug",
        ft = {
            "pug", "vue"
        }
    },
    {
        "mg979/vim-visual-multi",
        event = "BufRead"
    },
    {
        "FotiadisM/tabset.nvim",
        config = function()
            require("tabset").setup({
                defaults = {
                    tabwidth = 4
                },
                lua = {
                    tabwidth = 2
                }
            })
        end
    },
    {
        "prettier/vim-prettier",
        ft = {
            'javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml',
            'html', 'typescriptreact'
        },
        cmd = {
            'Prettier',
            'PrettierAsync',
            'PrettierPartial',
            'PrettierFragment'
        }
    },
    {
        "gpanders/editorconfig.nvim",
    },
    {
        "nvim-pack/nvim-spectre",
    },
    {
        "L3MON4D3/LuaSnip",
        config = function()
            require("luasnip.loaders.from_snipmate").lazy_load()
        end
    }
}

-- -- Autocommands (`:help autocmd`) <https://neovim.io/doc/user/autocmd.html>
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })
