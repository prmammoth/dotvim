"st the termguicolors
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

set nu
syntax enable
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set foldmethod=syntax

"Folding options for the files
"set foldmethod=syntax


"Highlight the line containing cursor
set cursorline
hi cursorline cterm=none term=none
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline
highlight CursorLine guibg=#303000 ctermbg=234

"General set of options
"Vim would not auto detect file types
filetype off
"Let the plugin decide the indentation and let plugins decide the filetype I
"am using
filetype plugin indent on


"Create a new tab
nnoremap <Leader>T :tabnew<CR>
nnoremap <Leader>. :tabnext<CR>
nnoremap <Leader>, :tabprev<CR>

"Set up navigation to move between panes in nvim
nnoremap <C-Down> <C-W>j
nnoremap <C-Up> <C-W>k
nnoremap <C-Right> <C-W>l
nnoremap <C-Left> <C-W>h

"Set mapleader key
let mapleader=" "

"My Function Key Bindings

"Indent the whole file
map <F7> gg=G<C-o><C-o>

"Toggle the tagbar
nnoremap <M-g> :Rg<CR>
nnoremap <M-f> :Files<CR>
nnoremap <M-t> :TagbarToggle<CR>

"Set the sign column whenever the language needs it
set signcolumn=yes

"How soon should the plugins trigger
set updatetime=700

"My Alt Key Bindings

map <M-Down> :cnext<cr>
map <M-Up> :cprev<cr>

nnoremap <F12> :put=strftime('%a, %d %b %Y%n################')<CR>

"get the right theme and background

colorscheme gruvbox
set background=dark
let gruvbox_italic=1
set termguicolors


" Ignore case in search
set ic
" highlight searched items
set hlsearch

"Commenting productivity
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

"Settings to move between buffers next and previous
set hidden
nnoremap <C-N> :bnext<CR>
nnoremap <C-P> :bprev<CR>

map <Leader>nf :NERDTreeToggle<CR>
" Settings for the Clap plug
let g:clap_theme = 'material_design_dark'
"Configuration specific to jedi-language-server
let g:jedi#use_tabs_not_buffers = 1
let g:jedi#completions_command = "<C-Space>"
let g:jedi#completions_enabled=1

" have a fixed column for the diagnostics to appear in
" this removes the jitter when warnings/errors flow in
set signcolumn=yes

" Set updatetime for CursorHold
" 300ms of no cursor movement to trigger CursorHold
set updatetime=300

"lua chunk for RishabRD/pofix plugin
"lua <<EOF
" vim.lsp.callbacks['textDocument/codeAction'] = require'lsputil.codeAction'.code_action_handler
" vim.lsp.callbacks['textDocument/references'] = require'lsputil.locations'.references_handler
" vim.lsp.callbacks['textDocument/definition'] = require'lsputil.locations'.definition_handler
" vim.lsp.callbacks['textDocument/declaration'] = require'lsputil.locations'.declaration_handler
" vim.lsp.callbacks['textDocument/typeDefinition'] = require'lsputil.locations'.typeDefinition_handler
" vim.lsp.callbacks['textDocument/implementation'] = require'lsputil.locations'.implementation_handler
" vim.lsp.callbacks['textDocument/documentSymbol'] = require'lsputil.symbols'.document_handler
" vim.lsp.callbacks['workspace/symbol'] = require'lsputil.symbols'.workspace_handler
"
"
" vim.g.lsp_utils_location_opts = {
"     height = 24,
"     mode = 'editor',
"     preview = {
"         title = 'Location Preview'
"     },
"     keymaps = {
"         n = {
"             ['<C-n>'] = 'j',
"             ['<C-p>'] = 'k',
"         }
"     }
" }
" vim.g.lsp_utils_symbols_opts = {
"     height = 0,
"     mode = 'editor',
"     preview = {
"         title = 'Symbol Preview'
"     },
"     keymaps = {
"         n = {
"             ['<C-n>'] = 'j',
"             ['<C-p>'] = 'k',
"         }
"     }
" }
" EOF

"Do word wrapping only in vimwiki files
"autocmd FileType vimwiki set wrap textwidth=80 formatoptions-=t
"autocmd FileType rst set wrap textwidth=80 formatoptions-=t

set formatoptions=crqto

let g:diagnostic_enable_underline = 1


"Settings related to fzf and ripgrep
let g:fzf_layout = { 'down': '~25%' }



"Get to the terminal
nnoremap T :terminal<CR>


"open current file in browser
nnoremap <F12>f :exe ':silent !firefox %'<CR>

"paste from clipboard
nnoremap <Leader>v "+gP

"set guifont
set guifont=Monospace\ 11
autocmd FileType vimwiki let b:coc_suggest_disable = 1

au bufreadpre,bufnewfile *.bnf set ft=bnf" 
au bufreadpre,bufnewfile wiki setlocal textwidth=80" 

"For codelens
nmap <silent> <M-q> <Plug>(coc-codelens-action)

abbr *[ * [ ]


set number relativenumber

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END


"auto insert closing braces

"inoremap " ""<left>
"inoremap ' ''<left>
"inoremap ( ()<left>
"inoremap [ []<left>
"inoremap { {}<left>
"inoremap {<CR> {<CR>}<ESC>O
"inoremap {;<CR> {<CR>};<ESC>O

" Fix auto-indentation for YAML files
augroup yaml_fix
    autocmd!
    autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab indentkeys-=0# indentkeys-=<:>
augroup END

" The following few lines are for the coc-spell-checker. reference https://github.com/iamcco/coc-spell-checker
vmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>a <Plug>(coc-codeaction-selected)

"This is to ensure that only the comments break at certain number of columns
augroup comment_textwidth
    autocmd!
    autocmd TextChanged,TextChangedI * :call AdjustTextWidth()
augroup END

function! AdjustTextWidth()
    let syn_element = synIDattr(synID(line("."), col(".") - 1, 1), "name")
    let &textwidth = syn_element =~? 'comment' ? 72 : 79
endfunction

"Configuration for vim-doge the documentation plugin
let g:doge_enable_mappings = 0
let g:doge_doc_standard_python = 'google'
nmap <Leader>cd <Plug>(doge-generate)

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

nnoremap <silent> K :call <SID>show_documentation()<CR>


set cmdheight=2
let g:echodoc_enable_at_startup = 1
let g:echodoc_type = "signature"
