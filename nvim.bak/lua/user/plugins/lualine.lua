local status, lualine = pcall(require, "lualine")
if not status then
	return
end

-- configure lualine with modified theme
lualine.setup({
	-- theme = "nordfox",
})

vim.cmd([[let g:lightline = { 'colorscheme': 'palenight' }]])
