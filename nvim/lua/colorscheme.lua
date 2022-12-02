-- vim.o.background = "dark"
-- vim.g.material_style = "darker" -- day / night
---- 半透明
-- vim.g.kanagawa_transparent = true
-- vim.g.material_transparent_sidebar = true
local colorscheme = "kanagawa"
-- tokyonight
-- Material
-- kanagawa
-- OceanicNext
-- gruvbox
-- zephyr
-- nord
-- onedark
-- nightfox

-- Default options:
require("kanagawa").setup({
  undercurl = true, -- enable undercurls
  commentStyle = { italic = true },
  functionStyle = {},
  keywordStyle = { italic = true },
  statementStyle = { bold = true },
  typeStyle = {},
  variablebuiltinStyle = { italic = true },
  specialReturn = true, -- special highlight for the return keyword
  specialException = true, -- special highlight for exception handling keywords
  transparent = false, -- do not set background color
  dimInactive = false, -- dim inactive window `:h hl-NormalNC`
  globalStatus = false, -- adjust window separators highlight for laststatus=3
  colors = {},
  overrides = {},
})

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme: " .. colorscheme .. " 没有找到！")
  return
end
