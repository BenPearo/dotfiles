# dotfiles

Terminal configuration managed as a bare git repository.

## Bootstrap on a new machine

```bash
git clone --bare <repo-url> ~/dotfiles/
git --git-dir=~/dotfiles/ --work-tree=~ checkout
git --git-dir=~/dotfiles/ --work-tree=~ config status.showUntrackedFiles no
```

Add an alias to your shell so you can run `dotfiles <git-command>` from anywhere:

```bash
alias dotfiles='git --git-dir=~/dotfiles/ --work-tree=~'
```

---

## Tracked files

```
.config/nvim/          Neovim configuration
.config/tmux/          Tmux configuration
.config/herdr/         Herdr configuration
.local/bin/            Shell scripts (sessionizers)
.zshrc                 Zsh shell configuration
```

---

## Neovim

**Location:** `~/.config/nvim/`  
**Base:** [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim)  
**Plugin manager:** [packer.nvim](https://github.com/wbthomason/packer.nvim)

### Prerequisites

```bash
# LSP servers installed automatically via Mason on first launch
# Requires: git, make, a C compiler (for telescope-fzf-native)
```

On first launch packer will bootstrap itself and install all plugins. Restart nvim once after the initial install.

### Plugins

| Plugin | Purpose |
|---|---|
| `nvim-lspconfig` + `mason` | LSP client, automatic server installation |
| `nvim-cmp` + `luasnip` | Autocompletion + snippets |
| `nvim-treesitter` | Syntax highlighting, text objects, incremental selection |
| `telescope.nvim` | Fuzzy finder for files, buffers, grep, LSP |
| `harpoon` (v2) | Fast file navigation via a pinned list |
| `gitsigns.nvim` | Git hunk indicators in the sign column |
| `vim-fugitive` + `vim-rhubarb` | Git commands and GitHub integration |
| `which-key.nvim` | Keymap hints (3 second delay) |
| `lualine.nvim` | Status line |
| `undotree` | Visual undo history |
| `vim-surround` | Surrounds (brackets, quotes, tags) |
| `hlargs.nvim` | Highlight function arguments |
| `nvim-treesitter-context` | Sticky function/class context header |
| `beacon.nvim` | Cursor flash on large jumps |
| `Comment.nvim` | `gc` to comment lines/regions |
| `vim-sleuth` | Auto-detect tabstop and shiftwidth |

**LSP servers installed:** `clangd`, `rust_analyzer`, `tsserver`  
**Treesitter languages:** C, C++, Go, Lua, Python, Rust, TypeScript, TSX, JavaScript

### Settings (`lua/custom/set.lua`)

- Relative + absolute line numbers
- 4-space tabs (`tabstop=4 softtabstop=4 shiftwidth=4 expandtab`)
- No swapfile; persistent undo stored in `~/.vim/undodir`
- `scrolloff=10` — always keep 10 lines of context above/below cursor
- `colorcolumn=80` — 80-character ruler
- Word wrap on, breaking at spaces
- True color enabled

### Keymaps

**Leader key:** `<Space>`

#### Custom remaps (`lua/custom/remap.lua`)

| Key | Action |
|---|---|
| `<leader>y` / `<leader>Y` | Yank to system clipboard |
| `<leader>pv` | Open netrw file explorer |
| `<C-d>` / `<C-u>` | Half-page jump + re-center cursor |
| `n` / `N` | Next/prev search result + re-center cursor |

#### Harpoon (`after/plugin/harpoon.lua`)

| Key | Action |
|---|---|
| `<leader>a` | Add current file to harpoon list |
| `<C-e>` | Toggle harpoon quick menu |
| `<C-h>` | Jump to harpoon slot 1 |
| `<C-t>` | Jump to harpoon slot 2 |
| `<C-n>` | Jump to harpoon slot 3 |
| `<C-s>` | Jump to harpoon slot 4 |
| `<C-S-P>` / `<C-S-N>` | Previous / next in harpoon list |

#### Telescope

| Key | Action |
|---|---|
| `<leader>?` | Recently opened files |
| `<leader><space>` | Open buffers |
| `<leader>/` | Fuzzy search in current buffer |
| `<leader>sf` | Find files |
| `<leader>sh` | Search help tags |
| `<leader>sw` | Search word under cursor |
| `<leader>sg` | Live grep |
| `<leader>sd` | Search diagnostics |

#### LSP (active when an LSP attaches to a buffer)

| Key | Action |
|---|---|
| `<leader>rn` | Rename symbol |
| `<leader>ca` | Code action |
| `gd` | Go to definition |
| `gr` | Go to references |
| `gI` | Go to implementation |
| `gD` | Go to declaration |
| `<leader>D` | Go to type definition |
| `<leader>ds` | Document symbols |
| `<leader>ws` | Workspace symbols |
| `K` | Hover documentation |
| `<C-k>` | Signature help |
| `[d` / `]d` | Previous / next diagnostic |
| `<leader>e` | Open diagnostic float |
| `<leader>q` | Diagnostic list (setloclist) |
| `:Format` | Format buffer with LSP |

#### Treesitter text objects

| Key | Action |
|---|---|
| `aa` / `ia` | Outer / inner parameter |
| `af` / `if` | Outer / inner function |
| `ac` / `ic` | Outer / inner class |
| `]m` / `[m` | Next / prev function start |
| `]M` / `[M` | Next / prev function end |
| `]]` / `[[` | Next / prev class start |
| `<c-space>` | Expand treesitter selection |
| `<c-backspace>` | Shrink treesitter selection |
| `<leader>s` / `<leader>S` | Swap parameter forward / backward |

#### nvim-cmp (completion)

| Key | Action |
|---|---|
| `<C-Space>` | Trigger completion |
| `<CR>` | Confirm selection |
| `<Tab>` / `<S-Tab>` | Next / prev completion item |
| `<C-d>` / `<C-f>` | Scroll docs up / down |

---

## Tmux

**Location:** `~/.config/tmux/tmux.conf`  
**Plugin manager:** [TPM](https://github.com/tmux-plugins/tpm) (`~/.config/tmux/plugins/tpm`)

### Plugins

| Plugin | Purpose |
|---|---|
| `catppuccin/tmux` | Catppuccin color theme |

### Settings

- **Prefix:** `C-a` (rebound from default `C-b`)
- Mouse: enabled
- True color: enabled (`xterm*:Tc`)
- Window and pane index: starts at 1
- Status right: shows current git branch name

### Keybindings

All bindings use `C-a` as prefix.

| Key | Action |
|---|---|
| `C-a H` | Open or switch to a session rooted at `~/` |
| `C-a W` | Open or switch to a session rooted at `~/Projects/mt-server/` |
| `C-a E` | Open or switch to a session rooted at `~/Projects/web-client/` |
| `C-a f` | Interactive fzf project picker (opens new window, searches `~/`, `~/Projects/`, `~/Personal/`) |
| `C-a D` | Open `TODO.md` in the current directory (falls back to `~/todo.md`) in nvim |

### Sessionizer (`~/.local/bin/tmux-sessionizer.sh`)

Creates a new tmux session named after the selected directory (dots replaced with underscores) and switches to it, or switches to the existing session if one already exists for that directory. The fzf picker searches `~/`, `~/Projects/`, and `~/Personal/` one level deep.

---

## Herdr

**Location:** `~/.config/herdr/config.toml`  
**Version:** 0.7.3+

Herdr is a terminal workspace manager with AI agent integration. The configuration mirrors the tmux setup so muscle memory carries over.

### Settings

- **Prefix:** `C-a` — matches tmux prefix
- **Theme:** catppuccin (`auto_switch = false` — no automatic light/dark switching)
- `new_cwd = "follow"` — new panes inherit the current directory
- `pane_history = true` — pane contents preserved across server restarts
- `resume_agents_on_restore = true` — AI agent sessions restored after restart
- `show_agent_labels_on_pane_borders = true` — agent name shown in split pane borders

### Keybindings

All bindings use `C-a` as prefix, matching tmux.

| Key | Type | Action |
|---|---|---|
| `C-a H` | shell | Switch to or create a workspace rooted at `~/` |
| `C-a W` | shell | Switch to or create a workspace rooted at `~/Projects/mt-server/` |
| `C-a E` | shell | Switch to or create a workspace rooted at `~/Projects/web-client/` |
| `C-a f` | pane | Interactive fzf project picker |
| `C-a D` | pane | Open `TODO.md` in current pane's directory (falls back to `~/todo.md`) in nvim |
| `j` / `k` | navigate | Move down / up in the workspace list (navigate mode) |
| `C-a S` | — | Toggle sidebar |

`shell` type runs detached in the background (no visible pane). `pane` type opens a temporary pane that closes when the command exits.

### Sessionizer (`~/.local/bin/herdr-sessionizer.sh`)

Herdr-native replacement for `tmux-sessionizer.sh`. Same project-picking logic but uses `herdr workspace` commands instead of `tmux` commands.

Workspace labels use `basename` of the directory with dots replaced by underscores. Exception: the home directory (`~`) is always labeled `~`.

**Fast path (cached):** workspace IDs are stored in `~/.cache/herdr-sessionizer/<label>` on first use. Subsequent calls to pinned bindings (H/W/E) skip `herdr workspace list` entirely and call `herdr workspace focus <id>` directly — one socket call. Stale cache entries (closed workspaces) are detected and auto-cleared.

**Slow path (first use or stale cache):**
- Calls `herdr workspace list` and finds the workspace by label
- If found: focuses it and writes the ID to cache
- If not found: calls `herdr workspace create --cwd <path> --label <name> --focus` and caches the new ID

---

## Zsh

**Location:** `~/.zshrc`  
**Framework:** [oh-my-zsh](https://ohmyz.sh/) with `robbyrussell` theme  
**Startup time:** ~1.0s (down from ~2.6s; see optimizations below)

### Plugins

| Plugin | Purpose |
|---|---|
| `git` | Git aliases and prompt info |
| `colored-man-pages` | Colorized man pages |
| `colorize` | Syntax highlighting for `cat` |
| `zsh-autosuggestions` | Fish-style command suggestions |
| `fzf-zsh-plugin` | fzf key bindings (`Ctrl+R`, `Ctrl+T`, `Alt+C`) and `FZF_DEFAULT_COMMAND` |
| `fzf-tab` | fzf-powered tab completion menu |
| `brew` | Homebrew completion |
| `macos` | macOS-specific aliases |

### Startup optimizations

- `ZSH_DISABLE_COMPFIX=true` — skips compaudit's directory permission scan on every shell open (~60ms saved)
- `pip` and `python` plugins removed — unused

### Modular config

Additional config files are sourced from `~/.config/zsh/modules/*.zsh` (not tracked in this repo).

### Tools

| Tool | Purpose |
|---|---|
| [mise](https://mise.jdx.dev/) | Runtime version manager (replaces nvm, rbenv, etc.) |
| [zoxide](https://github.com/ajeetdsouza/zoxide) | Smart `cd` — jumps to frecently used directories |
| fzf | Fuzzy finder; default command excludes `.git` and `node_modules` |

### PATH additions (in order)

```
~/.local/bin           Scripts (sessionizers, mise, etc.)
~/Library/Python/3.9/bin
$PNPM_HOME             pnpm global binaries
$ANDROID_HOME/...      Android SDK tools
```
