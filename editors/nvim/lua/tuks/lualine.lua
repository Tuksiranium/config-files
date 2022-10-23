-- Bubbles config for lualine
-- Author (base): lokesh-krishna
-- Author (remake): Tuksiranium
-- MIT license, see LICENSE for more details.

-- stylua: ignore
local colors = {
  blue       = '#205991',
  cyan       = '#79dac8',
  green      = '#4f9b2a',
  black      = '#080808',
  white      = '#c6c6c6',
  red        = '#bd281b',
  white_grey = '#7d7d7d',
  grey       = '#303030',
  orange     = '#d36b33',
}

local th1tks_theme = {
  normal = {
    a = { fg = colors.black, bg = colors.white_grey },
    b = { fg = colors.white, bg = colors.grey },
    c = { fg = colors.black, bg = colors.black },
  },

  insert = { a = { fg = colors.white, bg = colors.blue } },
  visual = { a = { fg = colors.white, bg = colors.green } },
  replace = { a = { fg = colors.black, bg = colors.red } },
  command = { a = { fg = colors.black, bg = colors.orange } },

  inactive = {
    a = { fg = colors.white, bg = colors.black },
    b = { fg = colors.white, bg = colors.black },
    c = { fg = colors.black, bg = colors.black },
  },
}

require('lualine').setup {
  options = {
    theme = th1tks_theme,
    component_separators = '|',
    section_separators = { left = '', right = '' },
  },
  sections = {
    lualine_a = {
      { 'mode', separator = { left = '' }, right_padding = 2 },
    },
    lualine_b = { 'filename', 'branch' },
    lualine_c = { 'diff', 'diagnostics' },
    lualine_x = { 'encoding', 'fileformat' },
    lualine_y = { 'filetype', 'progress' },
    lualine_z = {
      { 'location', separator = { right = '' }, left_padding = 2 },
    },
  },
  inactive_sections = {
    lualine_a = { 'filename' },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = { 'location' },
  },
  tabline = {},
  extensions = {
    'fugitive', 'fzf', 'man', 'nvim-dap-ui', 'quickfix', 'toggleterm',
  },
}
