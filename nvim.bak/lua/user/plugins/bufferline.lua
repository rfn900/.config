local status, bufferline = pcall(require, "bufferline")
if not status then
	return
end

bufferline.setup({
	highlights = {
		separator = {
			fg = "#073642",
		},
		separator_selected = {
			fg = "#9c78d6",
		},
		background = {
			fg = "#657b83",
			bg = "#232831",
		},
		buffer_selected = {
			fg = "#c99564",
			bold = true,
		},
		fill = {
			bg = "#232831",
		},
	},
})
vim.opt.termguicolors = true

-- vim.keymap.set("n", "<S-l>", "<Cmd>BufferLineCycleNext<CR>", {})
-- vim.keymap.set("n", "<S-h>", "<Cmd>BufferLineCyclePrev<CR>", {})
