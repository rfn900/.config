-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
vim.g.mapleader = " "

local keymap = vim.keymap --for conciseness

-- general keymaps

keymap.set("n", "<leader>h", ":nohl<CR>")
keymap.set("n", "<leader>ss", ":so %<CR>")

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>") -- increment
keymap.set("n", "<leader>-", "<C-x>") -- decrement

-- hacks for html tags
keymap.set("n", "ca", "F>lct<") -- Delete between tags
keymap.set("n", "cA", "F<lct>") -- "

-- folding
keymap.set("n", "zi", ":set foldmethod=indent<CR>") -- set folding
keymap.set("n", "zn", ":set nofoldenable<CR>") -- set folding
--
-- life savers
keymap.set("n", "<C-x>", "^v$h") -- select current line on tex
keymap.set("n", "gv", ":vsplit<CR>:Telescope lsp_definitions<CR>")

-- basic stuff
keymap.set("n", "<leader>q", ":q<CR>") -- quit neovim
keymap.set("n", "<leader>w", ":w<CR>") -- save
keymap.set("n", "<leader>ss", ":so %<CR>") -- save

-- window management
keymap.set("n", "sv", "<C-w>v") -- split window vertically
keymap.set("n", "sh", "<C-w>s") -- split window horizontally
keymap.set("n", "se", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "sx", ":close<CR>") -- close current split window

-- Re-order to previous/next
keymap.set("n", "<S-b>", "<Cmd>BufferLineMovePrev<CR>")
keymap.set("n", "<S-m>", "<Cmd>BufferLineMoveNext<CR>")

-- Sort automatically byj..
keymap.set("n", "<Space>bb", "<Cmd>BufferLinePick<CR>")
keymap.set("n", "<Space>br", "<Cmd>BufferCloseBuffersRight<CR>")
keymap.set("n", "<Space>bl", "<Cmd>BufferCloseBuffersLeft<CR>")
keymap.set("n", "<Space>bv", "<Cmd>BufferCloseAllButVisible<CR>")
keymap.set("n", "<Space>bc", "<Cmd>BufferCloseAllButCurrent<CR>")

-- floaterm stuff

keymap.set(
  "n",
  "<leader>rb",
  ":FloatermNew --height=0.9 --autoclose=0 --width=0.3 --wintype=vsplit --name=build --position=center RUSH_BUILD_CACHE_CREDENTIAL=minioadmin:minioadmin rush build -T @aimos/app<CR>"
)
keymap.set(
  "n",
  "<leader>ru",
  ":FloatermNew --height=0.9 --autoclose=0 --width=0.3 --wintype=vsplit --name=update --position=center rush update<CR>"
)
keymap.set(
  "n",
  "<leader>ri",
  ":FloatermNew --height=0.9 --autoclose=0 --width=0.3 --wintype=vsplit --name=install --position=center rush install<CR>"
)
keymap.set(
  "n",
  "<leader>rl",
  ":FloatermNew --height=0.9 --autoclose=0 --width=0.3 --wintype=vsplit --name=lint --position=center PRE_MERGE_LINT=true rush lint<CR>"
)
keymap.set(
  "n",
  "<leader>tg",
  ":FloatermNew --height=0.9 --width=0.9 --wintype=float --name=adg --position=center aimos dump-schema && aimos generate-gql-ts-types<CR>"
)

keymap.set(
  "n",
  "<leader>rs",
  ":FloatermNew --autoclose=2 --height=0.9 --width=0.9 --wintype=float --name=reRunServer --position=center ~/scripts/reRunServer.sh<CR>"
)
keymap.set(
  "n",
  "<leader>ra",
  ":FloatermNew --autoclose=2 --height=0.9 --width=0.9 --wintype=float --name=reRunServer --position=center ~/scripts/reRunBackendServer.sh<CR>"
)
keymap.set(
  "n",
  "<leader>rm",
  ":FloatermNew --autoclose=2 --height=0.9 --width=0.9 --wintype=float --name=reRunServer --position=center ~/scripts/runMigrate.sh<CR>"
)
keymap.set(
  "n",
  "<leader>rS",
  ":FloatermNew --autoclose=2 --height=0.9 --width=0.9 --wintype=float --name=reRunServer --position=center ~/scripts/reRunMainApp.sh<CR>"
)

keymap.set("n", "<leader><leader>h", ":FloatermHide!<CR>")
keymap.set("n", "<leader><leader>m", ":FloatermNext<CR>")
keymap.set("n", "<leader><leader>k", ":FloatermKill!<CR>")

-- git signs
keymap.set("n", "<leader>gr", ":Gitsigns reset_hunk<CR>")
keymap.set("n", "<leader>gR", ":Gitsigns reset_buffer<CR>")
keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>")
keymap.set("n", "<leader>gk", ":Gitsigns prev_hunk<CR>")
keymap.set("n", "<leader>gj", ":Gitsigns next_hunk<CR>")
keymap.set("n", "<leader>gs", ":Gitsigns stage_hunk<CR>")
keymap.set("n", "<leader>gb", ":Gitsigns stage_buffer<CR>")

-- open keymaps config
keymap.set("n", "<leader>Lk", ":e ~/.config/nvim/lua/user/core/keymaps.lua<CR>")

-- Typescript server stuff
keymap.set("n", "<leader>to", ":TypescriptOrganizeImports<CR>")
keymap.set("n", "<leader>tu", ":TypescriptRemoveUnused<CR>")
keymap.set("n", "<leader>tm", ":TypescriptAddMissingImports<CR>")

-- Leap reconfigurations
keymap.set("n", "m", "<Plug>leap-foward-to")

-- Lsp commands
keymap.set("n", "<leader>LL", ":LspRestart<CR>")

-- Override vim-surround key map
keymap.set("x", "M", "<Plug>VSurround")

-- Markdown preview
keymap.set("n", "<leader>mm", ":PeekOpen<CR>")
keymap.set("n", "<leader>mc", ":PeekClose<CR>")

-- Relative number on/off
keymap.set("n", "<leader>n", ":set relativenumber<CR>")
keymap.set("n", "<leader>N", ":set norelativenumber<CR>")

-- go to diagnostics
keymap.set("n", "<leader>mj", ":vim.diagnostic.goto_next")
