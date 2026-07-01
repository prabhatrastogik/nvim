# Neovim Config

A batteries-included Neovim setup built on lazy.nvim. Covers Python, Go, TypeScript, Lua, and more — with LSP, debugging, testing, AI, and Jupyter support.

---

## Prerequisites

Install these before cloning:

| Tool | Purpose | Install |
|------|---------|---------|
| Neovim ≥ 0.11 | Required | `brew install neovim` |
| git | Required | `brew install git` |
| Node.js + npm | Several LSP servers | `brew install node` |
| ripgrep | Live grep in fzf | `brew install ripgrep` |
| A [Nerd Font](https://www.nerdfonts.com/) | Icons in UI | Install & set in terminal |
| lazygit | LazyGit TUI (optional) | `brew install lazygit` |

---

## Installation

```bash
# 1. Create ~/.config if it doesn't already exist
mkdir -p ~/.config

# 2. Clone into ~/.config/nvim
git clone git@github.com:prabhatrastogik/nvim.git ~/.config/nvim

# 3. Open Neovim — lazy.nvim will auto-install all plugins on first launch
nvim
```

### Python provider (required for Jupyter / molten)

```bash
python3 -m venv ~/.config/nvim/.venv
~/.config/nvim/.venv/bin/pip install pynvim
```

### Formatters (install the ones you need)

```bash
brew install stylua shfmt          # Lua, Shell
pip install ruff sqlfluff          # Python, SQL
npm install -g @fsouza/prettierd  # JS / TS
go install mvdan.cc/gofumpt@latest # Go
```

### First-launch checklist

1. `:Lazy` — wait for all plugins to finish installing
2. `:Mason` — LSP servers auto-install; watch the progress bar
3. `:checkhealth` — verify everything is green

---

## Key Bindings

`<leader>` is **Space**.

### Navigation

| Key | Action |
|-----|--------|
| `<leader>e` | Toggle file explorer (left sidebar) |
| `<leader>a` | Toggle code outline (classes / functions) |
| `{` / `}` | Jump to prev / next symbol in file |
| `<leader><Right>` | Next buffer |
| `<leader><Left>` | Previous buffer |
| `<C-h/j/k/l>` | Move between splits (no `<C-w>` needed) |

### Fuzzy Find

| Key | Action |
|-----|--------|
| `<leader>ff` | Find files in project |
| `<leader>fg` | Live grep (search text across all files) |
| `<leader>fb` | Switch between open buffers |
| `<leader>fd` | All workspace diagnostics (errors/warnings) |
| `<leader>fl` | LSP references for symbol under cursor |
| `<leader>fi` | LSP implementations for symbol under cursor |
| `<leader>fs` | Git status — changed files |
| `<leader>fc` | Preview and switch colorscheme |

### LSP — Code Intelligence

These activate when a language server is attached (i.e. when editing a supported file type).

| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gi` | Go to implementation |
| `gr` | Show all references |
| `K` | Hover — show type info and docs |
| `<leader>ls` | Signature help (parameter hints) |
| `<leader>lt` | Jump to type definition |
| `<leader>ln` | Rename symbol across project |
| `<leader>lc` | Code actions (fixes, refactors) |

### Diagnostics — Errors and Warnings

| Key | Action |
|-----|--------|
| `<leader>tx` | Workspace diagnostics panel (all files) |
| `<leader>tX` | Buffer diagnostics panel (current file only) |
| `<leader>tl` | LSP references / definitions panel |
| `<leader>tq` | Quickfix list |
| `<leader>tL` | Location list |

### Completion

Completion triggers automatically. Inside the popup:

| Key | Action |
|-----|--------|
| `<Tab>` / `<S-Tab>` | Cycle through suggestions |
| `<CR>` | Confirm selection |
| `<C-Space>` | Manually trigger completion |
| `<C-e>` | Close popup |
| `<C-d>` / `<C-u>` | Scroll docs panel down / up |

Tab also jumps between snippet placeholders after confirming a snippet.

### Formatting

Formatting runs **automatically on save** for: Python, Go, JavaScript, TypeScript, Lua, SQL, Shell.

| Key | Action |
|-----|--------|
| `<leader>fo` | Format current buffer manually |

### Editing

| Key | Action |
|-----|--------|
| `gcc` | Toggle line comment |
| `gbc` | Toggle block comment |
| `gc{motion}` | Comment over motion — e.g. `gcip` comments a paragraph |
| `<C-/>` | Toggle comment (normal or visual — IDE-style) |
| `<leader>ng` | Generate docstring for function / class under cursor |
| `<leader>D` | Delete to black hole (doesn't overwrite clipboard) |
| `<leader><Up/Down>` | Move current line / selection up or down |
| `<` / `>` | Indent left / right in visual mode (stays in visual) |
| `p` (visual) | Paste over selection without losing clipboard |

#### Surrounding delimiters (mini.surround)

| Key | Action |
|-----|--------|
| `sa{motion}{char}` | **Add** surrounding — e.g. `saiw"` wraps word in `"` |
| `sd{char}` | **Delete** surrounding — e.g. `sd"` removes `"` |
| `sr{old}{new}` | **Replace** surrounding — e.g. `sr'"` swaps `'` for `"` |
| `sf` / `sF` | Find next / prev surrounding |
| `sh` | Highlight surrounding |

#### Text objects (mini.ai)

Use with `c`, `d`, `y`, `v`, etc.:

| Object | Selects |
|--------|---------|
| `af` / `if` | Around / inside **function** body |
| `ac` / `ic` | Around / inside **class** |
| `aa` / `ia` | Around / inside **argument** (including comma) |
| `a"` / `i"` | Around / inside **quotes** (handles nesting) |
| `an` / `in` | Next occurrence of the object |
| `al` / `il` | Previous (last) occurrence of the object |

### Git

| Key | Action |
|-----|--------|
| `]c` / `[c` | Jump to next / prev changed hunk |
| `<leader>lg` | Open LazyGit (full TUI — stage, commit, rebase, stash) |
| `<leader>gd` | Diff view — working tree vs HEAD |
| `<leader>gh` | File history — commit log for current file |
| `<leader>fs` | Git status (fuzzy, opens changed file on select) |

### Testing

| Key | Action |
|-----|--------|
| `<leader>tt` | Run test nearest to cursor |
| `<leader>tf` | Run all tests in current file |
| `<leader>ts` | Toggle test summary tree (all tests in project) |
| `<leader>to` | Toggle test output panel (stdout / stderr) |
| `<leader>td` | Debug nearest test (launches DAP) |

Supports: **pytest** (Python), **go test** (Go).

### Debugging (DAP)

| Key | Action |
|-----|--------|
| `<F5>` | Continue / Start session |
| `<F9>` | Toggle breakpoint |
| `<F10>` | Step over |
| `<F11>` | Step into |
| `<F12>` | Step out |
| `<leader>dbr` | Open REPL |
| `<leader>dbl` | Re-run last debug configuration |
| `<leader>dbu` | Toggle debug UI (variables, call stack, watches) |

The UI opens automatically when a session starts and closes when it ends.

Supported adapters: **debugpy** (Python — install in each project venv), **delve** (Go — `go install github.com/go-delve/delve/cmd/dlv@latest`).

### AI — Copilot

Inline completions are always active in insert mode (grey ghost text, `<Tab>` to accept).

| Key | Action |
|-----|--------|
| `<leader>cc` | Open / close chat panel |
| `<leader>ce` | Explain selected code |
| `<leader>cr` | Review selection for bugs |
| `<leader>cf` | Ask Copilot to fix selection |
| `<leader>ct` | Generate tests for selection |

Select code in visual mode before using `ce/cr/cf/ct` for context-aware responses.

### Python — Virtual Environments

| Key | Action |
|-----|--------|
| `<leader>pv` | Pick a venv (fuzzy — searches `.venv`, `venv`, `~/.venvs`, etc.) |
| `<leader>pc` | Reuse the last-selected venv (useful on reopen) |

Switching venvs immediately updates ruff and pyright so completions and type errors reflect the right `site-packages`.

### Python — Jupyter / REPL (molten)

Run code inline inside a `.py` file — output appears below each cell without leaving the editor.

**One-time setup per project venv:**
```bash
pip install pynvim jupyter_client ipykernel
# then in Neovim:
:UpdateRemotePlugins
```

| Key | Action |
|-----|--------|
| `<leader>ji` | Attach to a running Jupyter kernel (or `:!jupyter kernel` first) |
| `<leader>jl` | Evaluate current line |
| `<leader>jv` | Evaluate visual selection (select a cell block first) |
| `<leader>jo` | Show output for cell under cursor |
| `<leader>jd` | Delete cell output |
| `<leader>jr` | Restart kernel |

---

## Language Support

| Language | LSP | Formatter | Debug | Test |
|----------|-----|-----------|-------|------|
| Python | ruff | ruff | debugpy | pytest |
| Go | gopls | gofumpt | delve | go test |
| TypeScript / JS | ts_ls | prettierd | — | — |
| Lua | lua_ls | stylua | — | — |
| C / C++ | clangd | clang-format (LSP) | — | — |
| SQL | sqlls | sqlfluff | — | — |
| Shell | bashls | shfmt | — | — |
| YAML / TOML / JSON | yamlls / taplo / jsonls | LSP | — | — |
| CSS / HTML | cssls / html | LSP | — | — |

To add Python type checking, uncomment `"basedpyright"` in `lua/plugins/lsp.lua`.

---

## Useful Commands

| Command | Purpose |
|---------|---------|
| `:Lazy` | Plugin manager — update, install, profile |
| `:Mason` | LSP / formatter package manager |
| `:ConformInfo` | Show which formatters are active for current file |
| `:LspInfo` | Show attached LSP clients for current buffer |
| `:TSInstall {lang}` | Install a treesitter parser for a language |
| `:checkhealth` | Diagnose configuration issues |
