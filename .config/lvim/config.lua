-- vim options
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.relativenumber = true
vim.opt.timeoutlen = 150
vim.opt.guifont = { "LiterationMono Nerd Font:h11" }
vim.g.neovide_transparency = 0.8

-- general
lvim.log.level = "info"
lvim.format_on_save = true
lvim.leader = "space"

lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"

lvim.builtin.which_key.mappings["W"] = { "<cmd>noautocmd w<cr>", "Save without formatting" }
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["z"] = {
	name = "Trouble",
	r = { "<cmd>Trouble references<cr>", "References" },
	f = { "<cmd>Trouble definitions<cr>", "Definitions" },
	d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
	q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
	l = { "<cmd>Trouble loclist<cr>", "LocationList" },
	w = { "<cmd>Trouble workspace_diagnostics<cr>", "Diagnostics" },
}

-- -- Change theme settings
vim.g.gruvbox_material_background = "hard"
vim.g.gruvbox_material_transparent_background = 1
vim.g.gruvbox_material_ui_contrast = "high"
vim.g.gruvbox_material_foreground = "original"

vim.g.everforest_transparent_background = 1
vim.g.everforest_ui_contrast = "high"

lvim.colorscheme = "gruvbox-material"

lvim.transparent_window = false

lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

-- Automatically install missing parsers when entering buffer
lvim.builtin.treesitter.auto_install = true

local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
	{ command = "stylua" },
	{
		command = "prettier",
		extra_args = { "--print-width", "100" },
		filetypes = { "typescript", "typescriptreact" },
	},
	{ command = "rustfmt", filetypes = { "rust" } },
})

local linters = require("lvim.lsp.null-ls.linters")
linters.setup({
	{ command = "flake8", filetypes = { "python" } },
	{
		command = "shellcheck",
		args = { "--severity", "warning" },
	},
})

lvim.plugins = {
	{
		"folke/trouble.nvim",
		cmd = "TroubleToggle",
	},
	{ "sainnhe/sonokai" },
	{ "sainnhe/gruvbox-material" },
	{ "sainnhe/everforest" },
	{ "catppuccin/nvim", name = "catppuccin" },
	{
		"ggandor/lightspeed.nvim",
		event = "BufRead",
	},
	{
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	},
	{
		"mrjones2014/nvim-ts-rainbow",
	},
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup({ "css", "scss", "html", "javascript" }, {
				RGB = true, -- #RGB hex codes
				RRGGBB = true, -- #RRGGBB hex codes
				RRGGBBAA = true, -- #RRGGBBAA hex codes
				rgb_fn = true, -- CSS rgb() and rgba() functions
				hsl_fn = true, -- CSS hsl() and hsla() functions
				css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
				css_fn = true, -- Enable all CSS *functions*: rub_fn, hsl_fn
			})
		end,
	},
	{
		"tpope/vim-surround",
	},
	-- RUST
	{
		"simrat39/rust-tools.nvim",
		config = function()
			-- local lsp_installer_servers = require("nvim-lsp-installer.servers")
			-- local _, requested_server = lsp_installer_servers.get_server("rust_analyzer")
			require("rust-tools").setup({
				tools = {
					autoSetHints = true,
					-- hover_with_actions = true,
					-- options same as lsp hover / vim.lsp.util.open_floating_preview()
					hover_actions = {

						-- the border that is used for the hover window
						-- see vim.api.nvim_open_win()
						border = {
							{ "╭", "FloatBorder" },
							{ "─", "FloatBorder" },
							{ "╮", "FloatBorder" },
							{ "│", "FloatBorder" },
							{ "╯", "FloatBorder" },
							{ "─", "FloatBorder" },
							{ "╰", "FloatBorder" },
							{ "│", "FloatBorder" },
						},

						-- whether the hover action window gets automatically focused
						-- default: false
						auto_focus = true,
					},
					runnables = {
						use_telescope = true,
					},
				},
				server = {
					on_init = require("lvim.lsp").common_on_init,
					on_attach = function(client, bufnr)
						require("lvim.lsp").common_on_attach(client, bufnr)
						local rt = require("rust-tools")
						-- Hover actions
						vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
						-- Code action groups
						vim.keymap.set("n", "<leader>lA", rt.code_action_group.code_action_group, { buffer = bufnr })
					end,
				},
			})
		end,
		ft = { "rust", "rs" },
	},
}
