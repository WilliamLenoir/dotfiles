-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Constants
local BLUE = "#dbe9ff"

-- Helper function
--  on utilise cette fonction pour créer un nouveau augroup (groupe d'événements)
local function augroup(name)
  return vim.api.nvim_create_augroup("william_augroup_" .. name, { clear = true })
end

-- Generic
vim.cmd("highlight Normal guifg=black guibg=NONE ")
vim.cmd("highlight VertSplit guibg=white guifg=black")
vim.cmd("highlight NonText guifg=NONE guibg=NONE")
vim.cmd("highlight Pmenu guibg=black guifg=#f6f6f6")
vim.cmd("highlight PmenuSel  guibg=black guifg=#dbe9ff")
vim.cmd("highlight SpellBad  guifg=red")
vim.cmd("highlight Visual guifg=#dbe9ff guibg=black")
vim.cmd("highlight Comment guifg=#3465A4")
vim.cmd("highlight CursorLine guibg=NONE")
vim.cmd("highlight CursorLineNr guibg=#f3f3f3 guifg=#000000 gui=bold,underline")
vim.cmd("highlight Indent guifg=Lightgrey guibg=white")
vim.cmd("highlight QuickFixLine guifg=black guibg=#dbe9ff gui=bold")
vim.cmd("highlight FocusedSymbol guibg=#FFD866")
vim.cmd("highlight Search guibg=#FFD866 guifg=Black gui=bold")
vim.cmd("highlight MatchParen guibg=#dbe9ff guifg=black")
vim.cmd("highlight TabLine guifg=black guibg=#f3f3f3")
vim.cmd("highlight TabLineFill guifg=black guibg=NONE")
vim.cmd("highlight NormalFloat guibg=#f6f6f6 guifg=black")
--  Couleurs pour les infos de completion (lsp, cmp)
vim.cmd("highlight PmenuSbar guifg=#f6f6f6") -- la couleur de la barre de l'ascenseur
vim.cmd("highlight PmenuThumb guifg=black") -- la couleur du curseur de l'ascenseur

-- No-frills override
vim.cmd("hi Directory term=NONE cterm=NONE ctermfg=53 ctermbg=NONE gui=NONE guifg=black guibg=NONE")
vim.cmd("hi ModeMsg term=NONE cterm=NONE ctermfg=53 ctermbg=NONE gui=NONE guifg=black guibg=NONE")
vim.cmd("hi MoreMsg term=NONE cterm=NONE ctermfg=53 ctermbg=NONE gui=NONE guifg=black guibg=NONE")
vim.cmd("hi Question term=NONE cterm=NONE ctermfg=53 ctermbg=NONE gui=NONE guifg=black guibg=NONE")

-- remove the blue color
vim.cmd("hi Cursor guifg=fg guibg=NONE")
vim.cmd("hi CursorIM guifg=fg guibg=NONE")

-- remove the purple color
-- WARNING: la couleur mauve est tenance et elle exite à plusieurs endroits
-- la couleur à supprimer est :
-- #87005f  ok
-- #80005a  ok
-- #760053  ok
-- other purple
-- vim.cmd("hi BufferLineWarningVisible guifg=black guibg=#d1d1d1")
-- vim.cmd("hi BufferLineInfo guifg=black guibg=#c8c8c8 guisp=#add8e6")
-- vim.cmd("hi BufferLineGroupLabel guifg=#b6b6b6 guibg=black")
-- vim.cmd("hi BufferLineNumbers guifg=black guibg=#c8c8c8")
-- vim.cmd("hi BufferLineBufferVisible guifg=black guibg=#d1d1d1")
-- vim.cmd("hi BufferLineGroupSeparator guifg=black guibg=#b6b6b6")
-- vim.cmd("hi BufferLineTruncMarker guifg=black guibg=#b6b6b6")
-- vim.cmd("hi BufferLineInfoVisible guifg=black guibg=#d1d1d1")
-- vim.cmd("hi BufferLineHintVisible guifg=black guibg=#d1d1d1")
-- vim.cmd("hi BufferLineErrorVisible guifg=black guibg=#d1d1d1")
-- vim.cmd("hi BufferLineBuffer guifg=black guibg=#c8c8c8")
-- vim.cmd("hi BufferLineError guifg=black guibg=#c8c8c8 guisp=#ff0000")
-- vim.cmd("hi BufferLineWarning guifg=black guibg=#c8c8c8 guisp=#ffa500")
-- vim.cmd("hi BufferLineNumbersVisible guifg=black guibg=#d1d1d1")
-- vim.cmd("hi BufferLineHint guifg=black guibg=#c8c8c8 guisp=#d3d3d3")
-- -- other purple
-- vim.cmd("hi BufferLineDuplicateVisible cterm=italic gui=italic guifg=#80005a guibg=#d1d1d1")
-- vim.cmd("hi BufferLineDuplicate cterm=italic gui=italic guifg=#80005a guibg=#c8c8c8")
-- vim.cmd("hi BufferLineDuplicateSelected cterm=italic gui=italic guifg=#80005a guibg=#e4e4e4")
-- -- other purple
-- vim.cmd("hi BufferLineDiagnostic guifg=#760053 guibg=#c8c8c8")
-- vim.cmd("hi BufferLineInfoDiagnosticVisible guifg=#760053 guibg=#d1d1d1")
-- vim.cmd("hi BufferLineErrorDiagnosticVisible guifg=#760053 guibg=#d1d1d1")
-- vim.cmd("hi BufferLineErrorDiagnostic guifg=#760053 guibg=#c8c8c8 guisp=#e00000")
-- vim.cmd("hi BufferLineWarningDiagnosticVisible guifg=#760053 guibg=#d1d1d1")
-- vim.cmd("hi BufferLineWarningDiagnostic guifg=#760053 guibg=#c8c8c8 guisp=#e09100")
-- vim.cmd("hi BufferLineInfoDiagnostic guifg=#760053 guibg=#c8c8c8 guisp=#98beca")
-- vim.cmd("hi BufferLineHintDiagnosticVisible guifg=#760053 guibg=#d1d1d1")
-- vim.cmd("hi BufferLineHintDiagnostic guifg=#760053 guibg=#c8c8c8 guisp=#b9b9b9")
-- vim.cmd("hi BufferLineDiagnosticVisible guifg=#760053 guibg=#d1d1d1")

-- Texte affiché par les suggestions (cmp ghost)
vim.cmd("highlight CmpGhostText guifg=grey")
-- Couleur du premier match après recherche
vim.cmd("highlight IncSearch guibg=orange guifg=black gui=bold")

-- NeoTree
vim.cmd("highlight NeoTreeDirectoryIcon guibg=white guifg=black")
vim.cmd("highlight NeoTreeDirectoryName guibg=white guifg=black")
vim.cmd("highlight NeoTreeCursorLine guifg=black guibg=#dbe9ff")
vim.cmd("highlight NeoTreeGitUntracked guifg=darkgreen")
vim.cmd("highlight NeoTreeGitModified guifg=#da5e38")
vim.cmd("highlight NeoTreeNormal guibg=white") -- no transparent background for readability (neotree focused)
vim.cmd("highlight NeoTreeNormalNC guibg=white") -- no transparent background for readability (neotree not focused)

-- Telescope
vim.cmd("highlight TelescopeSelection guifg=black guibg=#dbe9ff gui=bold")

-- custom W functions
vim.cmd("highlight wGetTagTag guifg=darkorange guibg=NONE")
vim.cmd("highlight wGetTagMatch guifg=darkgreen guibg=NONE")
vim.cmd("highlight wGetTagTag guifg=orange guibg=NONE")
vim.cmd("highlight wTagList guifg=orange guibg=NONE")
vim.cmd("highlight wTag guifg=orange guibg=NONE")
vim.cmd("highlight WEchomInfo guifg=black guibg=#f6f6f6")

-- Others
vim.cmd("highlight ConflictMarkerBegin guibg=#e8fceb")
vim.cmd("highlight ConflictMarkerOurs guibg=#e8fceb")
vim.cmd("highlight ConflictMarkerTheirs guibg=#e3f4ff")
vim.cmd("highlight ConflictMarkerEnd guibg=#e3f4ff")
vim.cmd("highlight ConflictMarkerCommonAncestorsHunk guibg=#754a81")

-- Jenkinsfile

-- Ajouter une commande automatique au groupe
--  Exemple en vimscript
--  legacy : vim.cmd("autocmd BufRead,BufNewFile Jenkinsfile set filetype=groovy")
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  group = augroup("jenkins"), -- will create william_augroup_jenkins
  pattern = "*Jenkinsfile",
  callback = function()
    vim.bo.filetype = "groovy"
  end,
})

-- TransparentBG

-- we do not want a transparent background for the following filetypes
-- so that we can read their content easily
local filetypes_without_transparent_bg = {
  "Outline",
  "NeogitLogView",
  -- nb: neo-tree is handled above
}

vim.cmd("highlight NoTransparentBG guibg=white")
vim.cmd("highlight TransparentBG guibg=NONE")

vim.api.nvim_create_autocmd({ "FileType" }, {
  group = augroup("outlinebackground"),
  pattern = filetypes_without_transparent_bg,
  callback = function()
    vim.cmd("setlocal winhighlight=Normal:NoTransparentBG")
  end,
})

-- Toggle Transparent Background Command

function ToggleTransparentBackground()
  if vim.b.backgroundToggled then
    -- Si la couleur de fond est actuellement blanche, la rendre transparente
    vim.cmd("hi Normal guibg=NONE")
    vim.b.backgroundToggled = false
  else
    -- Si la couleur de fond est actuellement transparente, la rendre blanche
    vim.cmd("hi Normal guibg=white")
    vim.b.backgroundToggled = true
  end
end

vim.cmd("command! ToggleTransparentBackground lua ToggleTransparentBackground()")

-- BUG: escape ne fonctionne pas et limiter au buffer
vim.api.nvim_create_autocmd({ "FileType" }, {
  group = augroup("terminal"),
  pattern = "floaterm",
  callback = function()
    vim.cmd("highlight Normal guifg=black guibg=white")

    vim.cmd("noremap <Left> <Esc><Esc>:FloatermPrev<CR><Esc><Esc>")
    vim.cmd("noremap <Right> <Esc><Esc>:FloatermNext<CR><Esc><Esc>")
    vim.cmd("noremap fj <Esc><Esc>:FloatermNext<CR><Esc><Esc>")
    vim.cmd("noremap <C-s> <Esc><Esc>:FloatermNew<CR>")
    vim.cmd("noremap <C-w>o <C-w>_") -- maximize the terminal height
  end,
})

vim.cmd([[
" Conceal replace some char
" Disable conceal when the cursor move or when insert mode is started
augroup Conceal
    autocmd!
    autocmd BufNewFile,BufRead *.md syntax match Normal '#-' conceal cchar=🐱
    autocmd BufNewFile,BufRead *.md syntax match Normal '\v^\zs##\ze\s' conceal cchar=🟥
    autocmd BufNewFile,BufRead *.md syntax match Normal '\v^\zs###\ze\s' conceal cchar=🟨
    autocmd BufNewFile,BufRead *.md syntax match Normal '\v^\zs####\ze\s' conceal cchar=💭

    autocmd BufNewFile,BufRead *.md syntax match Normal '\v\zs\[\s\]\ze\s' conceal cchar=🔳
    autocmd BufNewFile,BufRead *.md syntax match Normal '\v\zs\[x\]\ze\s' conceal cchar=✅

    autocmd BufNewFile,BufRead *.md highlight markdownH1Delimiter guibg=NONE guifg=black gui=bold
    autocmd BufNewFile,BufRead *.md highlight markdownH1 guibg=NONE guifg=black gui=bold

    autocmd BufNewFile,BufRead *.md syntax match Normal '```' conceal cchar=⏭
augroup END
]])

-- Ne pas insérer des commenaires automatiquement
-- cf. https://vi.stackexchange.com/questions/1983/how-can-i-get-vim-to-stop-putting-comments-in-front-of-new-lines
-- et cf. ../../README.md
vim.api.nvim_create_autocmd({ "BufEnter" }, {
  group = augroup("no-auto-comment"),
  pattern = "*", -- for all the files
  callback = function()
    vim.cmd("set fo-=c fo-=r fo-=o")
  end,
})

-- Do not conceal the quotes in json or yaml files
vim.api.nvim_create_autocmd({ "FileType" }, {
  group = augroup("no-json-conceal"),
  pattern = { "json", "yaml" },
  callback = function()
    vim.cmd("setlocal conceallevel=0")
  end,
})

vim.cmd("highlight QuickFixLineBG guibg=#f3f3f3 gui=bold")

vim.api.nvim_create_autocmd({ "FileType" }, {
  group = augroup("quickfixlinebackground"),
  pattern = { "qf" },
  callback = function()
    vim.cmd("setlocal winhighlight=CursorLine:QuickFixLineBG")
  end,
})

-- Use enter to jump to help tag
-- cf. https://vim.fandom.com/wiki/Learn_to_use_help#:~:text=Enter%20%3Ah%20to%20open%20the,jump%20to%20the%20quickref%20topic).
vim.api.nvim_create_autocmd({ "FileType" }, {
  group = augroup("help_mappings"),
  pattern = { "help" },
  callback = function()
    vim.cmd("nnoremap <buffer> <CR> <C-]>")
  end,
})

-- couleur de la barre d'indentation
-- attention il faut le set ici et non dans config() de indent-blankline
vim.cmd("hi WIndentLine guifg=#f3f3f3")
-- couleur de la barre d'indentation du scope acctuel
vim.cmd("hi MiniIndentscopeSymbol guifg=grey")

-- vim.cmd([[
-- hi IblWhitespace guibg=#dbe9ff guifg=yellow
-- ]])

-- Problème: en visual mode les indent lines ont un background gris foncé
-- fix: utiliser une autocmd pour désactiver les indentes guides en visual mode
-- puis les réactiver ensuite
-- cf. https://github.com/lukas-reineke/indent-blankline.nvim/issues/132#issuecomment-1781195298
local fix_indent_blankline_visual_mode =
  vim.api.nvim_create_augroup("fix_indent_blankline_visual_mode", { clear = true })
vim.api.nvim_create_autocmd("ModeChanged", {
  group = fix_indent_blankline_visual_mode,
  pattern = "[vV\x16]*:*", -- visual mode désactivé
  callback = function()
    vim.cmd("silent! IBLEnable") -- on remet les indent guide
    vim.cmd("hi MiniIndentscopeSymbol guifg=grey") -- on remet le gris de la ligne courante
  end,
  desc = "Habilita indent-blanklines al salir de modo visual",
})
vim.api.nvim_create_autocmd("ModeChanged", {
  group = fix_indent_blankline_visual_mode,
  pattern = "*:[vV\x16]*", -- visual mode activé
  callback = function()
    vim.cmd("silent! IBLDisable") -- on désactive les indent guides
    vim.cmd("hi MiniIndentscopeSymbol guifg=none") -- on désactive le gris de la ligne courante
  end,
  desc = "Deshabilita indent-blanklines al salir de modo visual",
})

-- format the document when we leave the insert mode
--vim.api.nvim_create_autocmd({ "InsertLeave" }, {
--  group = augroup("autoformat"),
--  pattern = "*", -- for all the files
--  callback = function()
--    vim.cmd("silent! LazyFormat") -- this is the command that is ran on save
--  end,
--})

vim.cmd([[
" Those colors are used for the diff tools (fugitive, diffthis, diffview)
hi DiffDelete guifg=#ff9999 guibg=#ff9999
hi DiffAdd    guifg=black guibg=#e4f9c7
hi DiffChange guibg=#fef7e0 guifg=black           " the changed code line
hi DiffText gui=bold guibg=#fef7e0 guifg=#9803fc  " the code that has changed in the code line

" We use similar colors but for Neogit
hi NeogitDiffDeleteHighlight guifg=black guibg=#ff9999
hi NeogitDiffAddHighlight guifg=black guibg=#e4f9c7
hi NeogitDiffAdd  guifg=black guibg=#e4f9c7
hi NeogitDiffDelete guifg=black guibg=#ff9999
"hi NeogitCursorLine guibg=none
hi NeogitCommitViewHeader guifg=white guibg=black

hi NeogitSectionHeader cterm=bold gui=bold guifg=black
hi NeogitUnpulledFrom cterm=bold gui=bold guifg=black
hi NeogitUnpushedTo cterm=bold gui=bold guifg=black
hi NeogitUnmergedInto cterm=bold gui=bold guifg=black
hi NeogitChangeModified cterm=bold,italic gui=italic guifg=black
hi NeogitRemote cterm=bold gui=bold guifg=red
hi NeogitBranch cterm=bold gui=bold guifg=black

hi NeogitGraphAuthor guifg=black
hi NeogitTagName guifg=black
hi NeogitTagDistance guifg=black
hi NeogitChangeModified cterm=bold,italic gui=bold,italic guifg=black
hi NeogitDiffHeader cterm=bold gui=bold guibg=black guifg=white
hi NeogitFilePath cterm=italic gui=italic guifg=black
hi NeogitDiffHeaderHighlight cterm=bold gui=bold guifg=white guibg=black

hi NeogitHunkHeaderHighlight cterm=bold gui=bold guifg=white guibg=grey
hi NeogitCommitMessage guifg=black
hi NeogitCommitViewDescription guifg=black guibg=#feffd4
hi NeogitDiffContext guibg=white
" hi NeogitCursorLine
" hi CursorLine
hi NeogitGraphPurple guifg=black gui=bold
hi NeogitBranchHead cterm=bold,underline gui=bold,underline guifg=black

" black on yellow for the git commit message (post-it)
hi NeogitHunkHeader cterm=bold gui=bold guifg=black guibg=#fdffbf

" hi pour Conjure (le plugin pour clojure qui affiche les résultats du repl)
hi clojure_hi guifg=black gui=bold

" FUGITIVE HI GROUPS

" initially GitSignsAdd/GitSignsDelete
" that are used for the left lines in the editor
" are linked to DiffRemove and DiffDelete
" we init those highlight so that we can freely modify the other hi without any impact
hi GitSignsAdd ctermfg=2 guifg=#008000
hi GitSignsDelete ctermfg=1 guifg=#800000

" We can modify those hi that are used by vimfugitive
" it is really important to set them because the No-frills colorscheme
" do not package a hi group for them
hi diffRemoved     guifg=Black guibg=#ff9999 " we want a red color for the fugitive deletion
hi diffAdded       guifg=Black guibg=#e4f9c7 " we want a green color for the fugitive addition

hi gitHash         guifg=#c4f2e2 guibg=black gui=bold,underline
hi gitKeyword      guifg=white guibg=black
hi gitHead         guibg=#f3f3f3 guifg=black

hi gitIdentity     guifg=black guibg=#f3f3f3 
hi gitIdentityKeyword  guifg=black guibg=#f3f3f3
hi gitIdentityHeader  guifg=black guibg=#f3f3f3
hi gitDate         guifg=black guibg=#f3f3f3
hi gitDateHeader   guifg=black guibg=#f3f3f3 
hi gitEmail        guifg=black guibg=#f3f3f3 
hi gitEmailDelimiter guifg=black guibg=#f3f3f3

hi diffLine        guifg=#71a5d1
hi diffFile        gui=bold

" You can use those other hi groups if you want to add more colors to fugitive buffers
" they are set in red so that you can easily identify them

" hi diffOnly        guifg=red
" hi diffIdentical   guifg=red
" hi diffDiffer      guifg=red
" hi diffBDiffer     guifg=red
" hi diffIsA         guifg=red
" hi diffNoEOL       guifg=red
" hi diffCommon      guifg=red
" hi diffRemoved     guifg=red
" hi diffAdded       guifg=red
" hi diffChanged     guifg=red
" hi diffSubname     guifg=red
" hi diffLine        guifg=red
" hi diffFile        guifg=red
" hi diffOldFile     guifg=red
" hi diffNewFile     guifg=red
" hi diffIndexLine   guifg=red
" hi diffComment     guifg=red

" hi gitHead         guifg=red
" hi gitGraph        guifg=red
" hi gitType         guifg=red
" hi gitMode         guifg=red
" hi gitHashStage    guifg=red
" hi gitReference    guifg=red
" hi gitKeyword      guifg=red
" hi gitHash         guifg=red
" hi gitReflogOld    guifg=red
" hi gitReflog       guifg=red
" hi gitDiff         guifg=red
" hi gitDiffMerge    guifg=red
" hi gitDiffAdded    guifg=red
" hi gitDiffRemoved  guifg=red
" hi gitHashAbbrev   guifg=red
" hi gitIdentity     guifg=red
" hi gitIdentityKeyword  guifg=red
" hi gitIdentityHeader  guifg=red
" hi gitDate         guifg=red
" hi gitDateHeader   guifg=red
" hi gitEmail        guifg=red
" hi gitReflogMiddle  guifg=red
" hi gitReflogHeader  guifg=red
" hi gitEmailDelimiter  guifg=red
" hi gitReflogNew    guifg=red
" hi gitStage        guifg=red
]])

-- We use this autocmd to disable the auto Rooter
-- just after its execution (in this case the event DirChanged is triggered)
-- So that we can execute the auto Rooter mode only once
-- in combination with the telescope find repo
vim.api.nvim_create_autocmd("DirChanged", {
  group = augroup("custom_rooter"),
  pattern = "*",
  callback = function()
    -- the Directory was changed
    -- we ensure that auto Rooter is disabled
    -- so that we won't auto root in the future (exception if we use telescope repos)
    vim.g.rooter_manual_only = 1
  end,
  desc = "Disable auto rooter after changing a Directory",
})

-- No spell mode in markdown by default
vim.cmd("autocmd FileType markdown setlocal nospell")
