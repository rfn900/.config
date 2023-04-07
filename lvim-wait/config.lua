lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "nordfox"

lvim.leader = "space"
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["sh"] = ":split<CR>"
lvim.keys.normal_mode["ca"] = "F>lct<"
lvim.keys.normal_mode["cA"] = "F<lct>"
lvim.keys.normal_mode["sv"] = ":vsplit<CR>"
lvim.keys.normal_mode["<C-b>"] = "ggVGy"
lvim.keys.normal_mode["<leader>mp"] = ":MarkdownPreview<CR>"
lvim.keys.normal_mode["<leader>n"] = ":set relativenumber<CR>"
lvim.keys.normal_mode["<leader>N"] = ":set norelativenumber<CR>"
lvim.keys.normal_mode["<leader>zi"] = ":set foldmethod=indent<CR>"
lvim.keys.normal_mode["<leader>zn"] = ":set nofoldenable<CR>"
lvim.keys.normal_mode["<leader>o"] = ":! ~/scripts/readNotes.sh<CR>"
lvim.keys.normal_mode["<leader>gn"] =
	":FloatermNew --height=0.9 --autoclose=2 --autoinsert=true --width=0.9 --wintype=float --name=gcop --position=center ~/scripts/gcop.sh<CR>"
lvim.keys.normal_mode["<leader>gg"] =
	":FloatermNew --autoclose=2 --autoinsert=true --height=0.9 --width=0.9 --wintype=float --name=lazygit --position=center lazygit<CR>"
lvim.keys.normal_mode["<leader>tn"] =
	":FloatermNew --height=0.9 --width=0.9 --wintype=float --name=takeNotes --position=center ~/scripts/takeNotes.sh<CR>"
lvim.keys.normal_mode["<leader>rb"] =
	":FloatermNew --height=0.9 --autoclose=0 --width=0.9 --wintype=float --name=build --position=center rush build<CR>"
lvim.keys.normal_mode["<leader>ru"] =
	":FloatermNew --height=0.9 --autoclose=0 --width=0.9 --wintype=float --name=build --position=center rush update<CR>"
lvim.keys.normal_mode["<leader>ri"] =
	":FloatermNew --height=0.9 --autoclose=0 --width=0.9 --wintype=float --name=build --position=center rush install<CR>"
lvim.keys.normal_mode["<leader>rl"] =
	":FloatermNew --height=0.9 --autoclose=0 --width=0.9 --wintype=float --name=lint --position=center PRE_MERGE_LINT=true rush lint<CR>"
lvim.keys.normal_mode["<leader>tg"] =
	":FloatermNew --height=0.9 --width=0.9 --wintype=float --name=adg --position=center aimos dump-schema && aimos generate-gql-ts-types<CR>"
lvim.keys.normal_mode["<leader>rs"] =
	":FloatermNew --autoclose=2 --height=0.9 --width=0.9 --wintype=float --name=reRunServer --position=center ~/scripts/reRunServer.sh<CR>"

lvim.keys.normal_mode["<leader><leader>h"] = ":FloatermHide!<CR>"
lvim.keys.normal_mode["<leader><leader>m"] = ":FloatermNext<CR>"
lvim.keys.normal_mode["<leader><leader>k"] = ":FloatermKill!<CR>"
lvim.keys.normal_mode["<leader><leader>i"] = ":PickIcons<CR>"
lvim.keys.normal_mode["<leader>to"] = ":TypescriptOrganizeImports<CR>"
lvim.keys.normal_mode["<leader>tu"] = ":TypescriptRemoveUnused<CR>"
lvim.keys.normal_mode["<leader>tm"] = ":TypescriptAddMissingImports<CR>"
lvim.keys.normal_mode["<C-a>"] = "^v$h"
lvim.keys.insert_mode["<C-i>"] = ":PickInsert<CR>"
lvim.keys.insert_mode["<A-i>"] = ":PickAltFontAndSymbolsInsert<CR>"
lvim.keys.insert_mode["<C-s>"] = "<ESC>:w<CR>"

lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

lvim.builtin.treesitter.ensure_installed = {
	"bash",
	"c",
	"javascript",
	"json",
	"lua",
	"python",
	"typescript",
	"tsx",
	"css",
	"rust",
	"java",
	"yaml",
}

vim.g["floaterm_autoinsert"] = false

local graphql_lsp_opts = {
	filetypes = { "graphql", "typescriptreact", "javascriptreact", "typescript" },
}

require("lspconfig").graphql.setup({
	cmd = { "graphql-lsp", "server", "-m", "stream" },
	filetypes = { "typescript", "graphql", "typescriptreact", "javascriptreact", "javascript" },
})

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
	{
		command = "prettier",
		filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact", "html", "markdown", "css" },
	},
})
require("typescript").setup({
	disable_commands = false, -- prevent the plugin from creating Vim commands
	debug = false, -- enable debug logging for commands
	go_to_source_definition = {
		fallback = true, -- fall back to standard LSP definition on failure
	},
})
require("treesitter-context").setup({
	max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
	trim_scope = "outer", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
	patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
		-- For all filetypes
		-- Note that setting an entry here replaces all other patterns for this entry.
		-- By setting the 'default' entry below, you can control which nodes you want to
		-- appear in the context window.
		default = {
			"class",
			"function",
			"method",
			"for",
			"while",
			"if",
			"switch",
			"case",
		},
		-- Patterns for specific filetypes
		-- If a pattern is missing, *open a PR* so everyone can benefit.
		tex = {
			"chapter",
			"section",
			"subsection",
			"subsubsection",
		},
		rust = {
			"impl_item",
			"struct",
			"enum",
		},
		scala = {
			"object_definition",
		},
		vhdl = {
			"process_statement",
			"architecture_body",
			"entity_declaration",
		},
		markdown = {
			"section",
		},
		elixir = {
			"anonymous_function",
			"arguments",
			"block",
			"do_block",
			"list",
			"map",
			"tuple",
			"quoted_content",
		},
		json = {
			"pair",
		},
		yaml = {
			"block_mapping_pair",
		},
	},
	exact_patterns = {
		-- Example for a specific filetype with Lua patterns
		-- Treat patterns.rust as a Lua pattern (i.e "^impl_item$" will
		-- exactly match "impl_item" only)
		-- rust = true,
	},

	-- [!] The options below are exposed but shouldn't require your attention,
	--     you can safely ignore them.

	zindex = 99, -- The Z-index of the context window
	mode = "cursor", -- Line used to calculate context. Choices: 'cursor', 'topline'
	-- Separator between context and content. Should be a single character string, like '-'.
	-- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
	separator = nil,
})

require("scrollbar").setup()
require("nvim-ts-autotag").setup()

require("telescope").setup({
	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_dropdown({}),
		},
	},
})
require("telescope").load_extension("ui-select")

vim.g["user_emmet_leader_key"] = "<C-x>"
lvim.plugins = {
	{ "EdenEast/nightfox.nvim" },
	{ "raks/vim-one" },
	{
		"folke/trouble.nvim",
		cmd = "TroubleToggle",
	},
	{ "iamcco/markdown-preview.nvim", run = "cd app && yarn install" },
	{ "preservim/vim-markdown" },
	{
		"norcalli/nvim-colorizer.lua",
	},
	{ "tpope/vim-surround" },
	{ "mattn/emmet-vim" },
	{ "nvim-telescope/telescope-ui-select.nvim" },
	{ "voldikss/vim-floaterm" },
	{ "ziontee113/icon-picker.nvim" },
	{ "petertriho/nvim-scrollbar" },
	{ "f-person/git-blame.nvim" },
	{ "nvim-treesitter/nvim-treesitter-context" },
	{ "windwp/nvim-ts-autotag" },
	{ "jose-elias-alvarez/typescript.nvim" },
	{ "jupyter-vim/jupyter-vim" },
}

require("icon-picker")
require("colorizer").setup()
