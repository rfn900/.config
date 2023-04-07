local status, _ = pcall(vim.cmd, "colorscheme nordfox")
-- vim.cmd([[colorscheme tokyonight-storm]])
if not status then
	print("Colorscheme not found!")
	return
end

vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.winblend = 0
vim.opt.wildoptions = "pum"
vim.opt.pumblend = 5
vim.opt.background = "dark"
