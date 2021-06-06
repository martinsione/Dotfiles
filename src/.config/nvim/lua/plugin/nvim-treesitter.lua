require'nvim-treesitter.configs'.setup {
  highlight = {enable = true},
  ensure_installed = 'maintained',
  indent = {enable = true, disable = {'python'}},
  rainbow = {enable = true},
  autotag = {enable = true},
  context_commentstring = {enable = true},
}
