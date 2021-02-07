let mapleader= ","

" Tab completion
inoremap <silent> <expr><TAB>   pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <silent> <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Escape insert-mode
inoremap kj <esc>
inoremap jk <esc>

nnoremap <silent> <C-s>         <cmd>w<CR>
nnoremap <silent> <expr> <CR> {-> v:hlsearch ? ":nohl\<CR>" : "\<CR>"}()

" Move Code in Visual mode
vnoremap < <gv
vnoremap > >gv
xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv

" Buffers
nnoremap <silent> <TAB>   		<cmd>bnext<CR>
nnoremap <silent> <S-TAB>   	<cmd>bprevious<CR>
nnoremap <silent> <space>bd  	<cmd>bd<CR>
nnoremap <silent> <space>BD  	<cmd>bd!<CR>
nnoremap <silent> <S-Up>      <C-w>-
nnoremap <silent> <S-Down>    <C-W>+
nnoremap <silent> <Left>      <C-W><
nnoremap <silent> <Right>     <C-w>>
nnoremap <silent> <space>=    <C-w>=


" Terminal window navigation
inoremap <C-h> <C-\><C-N><C-w>h
inoremap <C-j> <C-\><C-N><C-w>j
inoremap <C-k> <C-\><C-N><C-w>k
inoremap <C-l> <C-\><C-N><C-w>l
tnoremap <C-h> <C-\><C-N><C-w>h
tnoremap <C-j> <C-\><C-N><C-w>j
tnoremap <C-k> <C-\><C-N><C-w>k
tnoremap <C-l> <C-\><C-N><C-w>l

" Command line
cnoremap %P <C-R>=expand('%:p')<CR>

" ---------------------------------------------------------------------"
" ---------------------------------------------------------------------"

" Lsp
nnoremap <silent>K          <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent>gd         <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent>gi         <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent>gr         <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent><space>ca  <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <silent><space>gh  <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent><space>cw  <cmd>lua vim.lsp.buf.rename()<CR>

" Telescope
nnoremap <silent> <C-p>     	<cmd>lua require('telescope.builtin').find_files()<CR>
nnoremap <silent> <space>pg 	<cmd>lua require('telescope.builtin').git_files()<CR>
nnoremap <silent> <space>pw 	<cmd>lua require('telescope.builtin').live_grep()<CR>
nnoremap <silent> <space>pb 	<cmd>lua require('telescope.builtin').buffers()<CR>
nnoremap <silent> <space>ph 	<cmd>lua require('telescope.builtin').help_tags()<CR>
" Custom Telescope functions
nnoremap <silent> <leader>en 		<cmd>lua require('plugin.telescope').edit_neovim()<CR>
nnoremap <silent> <leader>ez 		<cmd>lua require('plugin.telescope').edit_zsh()<CR>
nnoremap <silent> <leader>dot 	<cmd>lua require('plugin.telescope').edit_dotfiles()<CR>

" Tree
nnoremap <silent> <C-n> <cmd>NvimTreeToggle<CR>

" Goyo
nnoremap <silent> z <cmd>Goyo<CR>
