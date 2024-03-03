# 💤 LazyVim

A starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.

## Official Documentation website

- https://www.lazyvim.org

## Demo Video

- https://www.youtube.com/watch?v=N93cTbtLCIM&t=417s

## How to install a new LSP server ?

1. Identifier le nom du LSP à installer
2. :LspInstall
3. OU :Masson puis ctrl-f markdon taper 2 pour aller dans l'onglet LSP
4. on repère marksman (on le copie)
5. aller dans ./lua/plugins/lsp.lua
6. ajouter la ligne :

```lua
        marksman = {},
```

7. redémarrer
8. ouvrir le même fichier
9. on voit que mason-lspconfig.nvim installe automatiquement le lsp server

## Keymaps

### Comprendre d'où vient un keymap

```
map <keymap>

# exemple
map S
```

### override n keymap dans lazyvim

Exemple : changer <leader>ut

1. ctrl-f le keymap (<leader>ut) dans https://www.lazyvim.org/keymaps
2. on voit que le plugin est nvim-treesitter-context
3. on ajoute ce code pour disable au niveau du plugin le keymap

```lua
  {
    "nvim-treesitter/nvim-treesitter-context",
    keys = {
      { "<leader>ut", false }, -- pour disable
    },
  },
```

4. Maintenant on peut ajouter le keymap au nouveau plugin

```lua
  {
    "mbbill/undotree",
    cmd = "UndotreeToggle",
    keys = {
      { "<leader>ut", "<cmd>UndotreeToggle<cr>", { desc = "Open UndoTree" } },
    },
  }
```

NB: si le mapping est set dans général et pas via un plugin particulier,
alors il NE FAUT PAS le désactiver dans ./lua/config/keymaps.lua

```lua
-- NOT NEEDED
-- NOT vim.keymap.del("n", "<leader>gg")

-- INSTEAD:

return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-live-grep-args.nvim",
    },
    keys = {
      { "<leader>gg", searchWithRipGrep, mode = { "n" }, desc = "Search with RipGrep" },
    }
  }
}
```

### LSP

cf. https://www.lazyvim.org/keymaps#lsp

```
Key Description
<leader>cl Lsp Info
gd Goto Definition
gr References
gD Goto Declaration
gI Goto Implementation
gy Goto T[y]pe Definition
K Hover
gK Signature Help
<c-k> Signature Help
<leader>ca Code Action
<leader>cA Source Action
<leader>cr Rename

<leader>fs Search lsp symbol in the workspace
```

### Diagnostics in real time

- <leader>fd for Telescope diagnostics
- or
- <leader>xx for TroubleToggle workspace_diagnostics (in the workspace)
- <leader>xf for TroubleToggle document_diagnostics (in the current file)

### Diagnostics errors

- for a better readability the diagnostics errors are disabled in ./init.lua
- you can re-enable it with <leader>ud
- or with :

```lua
require("lazyvim.util").toggle.diagnostics()
```

## Git

### Ouvrir la diffview de la PR

- utilise le plugin https://github.com/sindrets/diffview.nvim

```
<leader>pr
:DiffviewOpen
```

### Ouvrir la diffview d'un commit en particulier

- utilise le plugin https://github.com/sindrets/diffview.nvim

```
:DiffviewOpen <ID COMMIT>
```

### Rebase interactif

- utilise le plugin Neogit

```
<leader>gr
:Neogit rebase
```

### Faire une PR Review

```
:DiffviewOpen master
```

### Travailler avec les Hunks

- lazyvim utilise le plugin gitsigns.nvim
- les mappings sont définis ici : https://www.lazyvim.org/plugins/editor#gitsignsnvim

```
# git reset un buffer
<leader>ghR

# Annuler un hunk (une section du fichier modifiée)
<leader>ghr

# Obtenir le blame d'une ligne
<leader>ghb

# Obtenir la diff
<leader>ghd

# Naviguer entre les hunks d'un fichier
]h
[h
```

## LUA

### Executer du lua en ligne de commande

```vimscript
:lua print("hello")
```

## VIM

### How to Vim

#### Quel est le filetype du fichier courant ?

```lua
:set filetype?
```

### Vim options

#### Ne pas insérer des commentaires automatiquement

- cf. https://vi.stackexchange.com/questions/1983/how-can-i-get-vim-to-stop-putting-comments-in-front-of-new-lines

```lua
:set formatoptions?
```

## LUA

### Debug a variable

```vimscript
:lua print(vim.inspect(YOUR_VAR))
:lua print(vim.inspect(vim.v.argv))
```

## Colors

### Toggle Transparent background

- pour améliorer la lisibilité

```vimscript
<leader>bg
:ToggleTransparentBackground
```

### Supprimer une couleur tenace

```vimscript
# write the colors in a buffer
:enew|pu=execute('hi')

# get only the lines with the color to remove
g!/80005a/d

# then go to ./lua/config/autocmds.lua and override those hi
```

### Colors model

- For bufferline, we try to use some colors from monokai pro
  - you can find the colors definition here with the web dev tools : https://monokai.pro
  - better here : https://color.adobe.com/fr/Monokai-Pro-color-theme-10112742/

## CMP

### Ne pas utiliser enter pour accepter les suggestions

```lua
-- INFO: Utiliser enter uniquement pour les sauts de ligne
-- CR pour cmp est désactivé
-- il faut impérativement appeler fallback() pour que le saut de ligne soit effectué
["<CR>"] = function(fallback)
  if cmp.visible() then
    cmp.abort()
  end
  fallback() -- IMPORTANT sinon le saut de ligne n'est pas effectué
end,
```

### Snippet

- We are using luasnip
- Add the snippet here : ./lua/plugins/luasnip.lua
- Then use <c-j> to show the snippets

## How to use it correctly

### Command line

- we have disabled the cmdline except for the files

#### Navigate with the files

```
# first type
:e ./
# it will open the completion
# navigate with <c-j> and <c-k> and accpet with <c-l>
# it will show you the others files contained in the target
# you can use <c-w> to go back
```

#### FIND

- we have decided to not use cmp for find
- therefore we use the built in only (old menu, not the fancy one)
- it is mandatory to have this option set for fuzzy search :
  - `vim.opt.path:append("**")`

```
:find :

:find quickfix   <TAB>

# =>
# ./lua/libs/theprimeagen/quickfix.lua
# < and others >

# This is equivalent to

:find **/quickfix   <TAB>
or
:find **quickfix   <TAB>
because of `vim.opt.path:append("**")`

# COMPLEX QUERIES

# ./lua/libs/theprimeagen/quickfix.lua

:find li*/**/qui   <TAB>
:find li*/**/qui   <TAB>
:find li**/qui     <TAB>

# FONCTIONNE A CHAQUE FOIS

:find *ib**/*qui
:find *ua**/*ib**/*qui

# * <SEARCH> ** /
#                 *<SEARCH> ** /
```

## Formatter

### Comment je peux formatter mon code ?

- si le **formatter** est configuré : **<leader>i** ou sauvegarder le buffer
- si le formatter n'est pas installé => lire "Ajouter un nouveau formatter"

### Ajouter un nouveau formatter

- pour l'indentation etc.
- exemple pour python
- En résumé :
  - Plugin Masson : pour installer le **Formatter**
  - Plugin Conform : pour que le formatter soit lancé automatiquement lors de la sauvegarde du buffer

Workflow

1. Identifier le formatter à utiliser
2. Ouvrir :Masson puis <c-f>python, on repère un formatter (exemple black)
3. Installer le formatter depuis l'UI ou mieux le rajouter dans la config masson ./lua/plugins/mason.lua

```lua
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "prettier",
        "mdformat",
        "black",              -- <= we add this
      },
    },
  },
```

4. Redémarrer neovim, si on ouvre :Masson on verra que le formatter est installé automatiquement au démarrage
5. Configurer l'autoformat on save
6. Éditer ./lua/plugins/conform.lua
7. Ajouter dans conform le nom du formatter qu'il faut utiliser pour le filetype dans notre exemple nous voulons utiliser black

```lua
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        -- Conform will run multiple formatters sequentially
        python = { "black" },
      },
    },
  },
```

8. Redémarrer et ouvrir le fichier python, le modifier et sauvegarder : il est formaté automatiquement
   NB: si rien ne se passe : il faut bien s'assurer que le fichier est modifié (si on enregistre sans apporter de changement le formatage n'est pas déclenché)

## Proxy

### Erreurs liées au proxy

- le proxy peut être à l'origine d'erreurs avec les plugins suivants:
  - neovim-treesitter
  - massonc

```vimscript
" Check if you have an error with nvim-treesitter due to the proxy
:TSInstall go
" => should install the go parser for nvim-treesitter
" you may have an error like 'check your internet connection'

"Check if you have an error with masson due to the proxy
:Masson
" => check if the packages have been downloaded by masson
" you can also check the logs
:MasonLog

" you should find errors similar to
[ERROR ] .../nvim/lazy/mason.nvim/lua/mason-core/installer/init.lua:249: Installation failed for Package(name=yamlfmt) error='spawn: wget failed with exit code 5 and signal 0. \nFailed to download file "https://github.com/google/yamlfmt/releases/download/v0.10.0/yamlfmt_0.10.0_Linux_x86_64.tar.gz".'

" in this case check that you can curl
" curl https://github.com/google/yamlfmt/releases/download/v0.10.0/yamlfmt_0.10.0_Linux_x86_64.tar.gz


" => at this point you should have an SSL error

" open firefox and go to https://github.com/google/yamlfmt
" => open the certificate (take the bundle with all)
" => create a file in /usr/local/share/ca-certificates/fix.crt
" be carefull .crt is really important

" then update the certificates
update-ca-certificates

" you should see 'added 1 certificate' if not, you have an error with your certificate
" try again the curl command
" curl https://github.com/google/yamlfmt/releases/download/v0.10.0/yamlfmt_0.10.0_Linux_x86_64.tar.gz

" => you should be able to download the file
" => now restart neovim and it should work

```

## Work

### Change working directory to the current file

```vimscript
" <leader>rf
" (for root file)
" then use <leader>E (capital E) to have the neotree view
```

## Usefull keymaps

### Root to the git project

- <leader>ro

### Root to the current file

- <leader>rf

## Conventions

### Marks

- Mark `n` for the managed temporary operations (ex: go back to the current position with a keymap)

## Tmux

- tmux can be used to facilitate the usage of project workspaces

### Simple setup

```bash
# Just execute this script
./tmux/setup_tmux.sh

# Then
tmux

# And for this first start install the plugins with <c-b>I
```

### Commands

```bash
# create a new session
tmux

# list the current sessions
tmux ls

# restore the previous sessions
tmux attach

# restore a specific session ID (retrieved by ls)
tmux attach -t 0
tmux attach -t <ID>
```

### Keymaps

```bash
# create new window
<c-b>c

# navigate through windows
<c-b>0
<c-b>1

# rename a window
<c-b>,

# delete a window
<c-b>&
or if the latest window
<c-b>x

# a split = a pane

# split vertically
<c-b>%
# split horizontally
<c-b>"

# delete a pane
<c-b>x

# detach the tmux session
<c-b>d
```

## Linters

### How to setup a linter

- the problem that we have : we install cfn-lint
- but this this not a LSP, this is a linter
- so we can't run it with :LspStart
- the solution is :
  - install it with mason (like a LSP)
  - setup it with the plugin **mfussenegger/nvim-lint** here `./lua/plugins/lint.lua`
  - you can add something like that

```lua
linters_by_ft = {
  yaml = { "cfn_lint" },
},
```

- restart neovim, you should see the linters messages
- now you shouls see no error in the message and you have the vim diagnostic
- you can run :Trouble or <leader>xx
- the trouble list should be updated after every save (it is not a full refresh)
- setup video: https://www.youtube.com/watch?v=ybUE4D80XSk

### Erreur with cfn-lint python

- open neovim
- open the terminal, run the command cfn-lint
  - it can work in a normal shell but not in neovim, because with the neovim terminal we are using a virtual env
- you may get :

```
from _bz2 import BZ2Compressor, BZ2Decompressor
ModuleNotFoundError: No module named '_bz2'
```

- in this case, it means that you are missing some libraries
- run

```
cp /usr/lib/python3.9/lib-dynload/*.so   /home/william/.local/share/nvim/mason/packages/cfn-lint/venv/lib/python3.9/site-packages
```

- it should fix your issue
- you can find the solution on this website : https://www.keiruaprod.fr/blog/2023/01/08/_bz2-dependency-error.html

## Yaml and JSON

### JSON to Yaml

```
# select in visual line

:'<,'> !yq --prettyPrint
```

## Navigation

### nvim-treesitter-textobjects

- allow to use nvim-treesitter to enhance the default vip, etc.
- you can use
  - viB (inner Block, to seleciton the whole content of {} or [])
  - vii (object scope) but this part is not provided by nvim-treesitter but by mini https://github.com/echasnovski/mini.ai
  - you can use [i or ]i to go up/down regarding the indentation guides, usefull in yaml files
- this tips comes from https://www.youtube.com/watch?v=FuYQ7M73bC0
- you can find his dotfile here : https://github.com/omerxx/dotfiles/tree/master/nvim

## SpellFile Orthographe

- init the directory with zg on a bad word
- it will create ~/.config/nvim/spell/
- you can add words int ~/.config/nvim/spell/en.utf-8.add
- but you have to build the binary .spl file
- to do that run in vim:
  - mkspell! ~/.config/nvim/spell/en.utf-8.add
- references :
  - https://johncodes.com/posts/2023/02-25-nvim-spell/
  - (how to build the spell binary) https://stackoverflow.com/questions/27240638/is-there-a-quick-way-to-rebuild-spell-files-from-wordlists

## References

### Documentation

- liste de tous les events pour autocmds :
  - https://neovim.io/doc/user/autocmd.html

### Vidéo

- full neovim lua installation for 2024 by ThePrimeagen
  - https://www.youtube.com/watch?v=w7i4amO_zaE&t=361s
