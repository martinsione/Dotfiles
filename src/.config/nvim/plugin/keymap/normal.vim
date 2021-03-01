nnoremap <silent> <C-s>  <cmd>w<CR>
nnoremap <silent> <expr> <CR> {-> v:hlsearch ? ":nohl\<CR>" : "\<CR>"}()

" Buffers
nnoremap <silent> <TAB>   		<cmd>bnext<CR>
nnoremap <silent> <S-TAB>   	<cmd>bprevious<CR>
nnoremap <silent> <space>bd  	<cmd>bd<CR>

" Window Navigation
nnoremap <C-h> <C-\><C-N><C-w>h
nnoremap <C-j> <C-\><C-N><C-w>j
nnoremap <C-k> <C-\><C-N><C-w>k
nnoremap <C-l> <C-\><C-N><C-w>l

" Window Resizing
nnoremap <silent> <Up>        <C-w>-
nnoremap <silent> <Down>      <C-W>+
nnoremap <silent> <Left>      <C-W><
nnoremap <silent> <Right>     <C-w>>
nnoremap <silent> <space>=    <C-w>=

" ---------------------------------------------------------------------"
" ---------------------------------------------------------------------"

" Lsp
nnoremap <silent>K          <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent>gd         <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent>gi         <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent>gr         <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent><space>ca  <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <silent><space>gh  <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent><space>rn  <cmd>lua vim.lsp.buf.rename()<CR>

" Telescope
nnoremap <silent> <space>p    <Nop>
nnoremap <silent> <C-p>     	<cmd>lua require('telescope.builtin').find_files()<CR>
nnoremap <silent> <space>pr 	<cmd>lua require('telescope.builtin').oldfiles()<CR>
nnoremap <silent> <space>pw 	<cmd>lua require('telescope.builtin').live_grep()<CR>
nnoremap <silent> <space>pb 	<cmd>lua require('telescope.builtin').buffers()<CR>
nnoremap <silent> <space>ph 	<cmd>lua require('telescope.builtin').help_tags()<CR>
nnoremap <silent> <space>gf 	<cmd>lua require('telescope.builtin').git_files()<CR>
nnoremap <silent> <space>gs   <cmd>lua require('telescope.builtin').git_status()<CR>
nnoremap <silent> <space>gc   <cmd>lua require('telescope.builtin').git_commits()<CR>
" Custom Telescope functions
nnoremap <silent> <space>pd 	<cmd>lua require('plugin.telescope.custom').edit_dotfiles()<CR>

" Tree
nnoremap <silent> <C-n>     <cmd>NvimTreeToggle<CR>

" Custom functions
nnoremap <silent> <C-t> :call TerminalToggle()<CR>
nnoremap <silent> <space>tt :call Toggle_transparent_background()<CR>
