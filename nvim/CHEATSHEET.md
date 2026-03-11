# Neovim Cheat Sheet

> Leader key: `,` (comma)

---

## Table of Contents

- [Vim Fundamentals](#vim-fundamentals)
- [Navigation](#navigation)
- [Editing](#editing)
- [Search & Replace](#search--replace)
- [Telescope (Fuzzy Finder)](#telescope-fuzzy-finder)
- [File Browser](#file-browser)
- [LSP (Language Server)](#lsp-language-server)
- [Autocompletion](#autocompletion)
- [Git](#git)
- [Formatting](#formatting)
- [Surround (vim-surround)](#surround-vim-surround)
- [Commenting (Comment.nvim)](#commenting-commentnvim)
- [TODO Comments](#todo-comments)
- [Window Management](#window-management)
- [Buffers & Tabs](#buffers--tabs)
- [Macros & Registers](#macros--registers)
- [Dashboard (Alpha)](#dashboard-alpha)
- [Plugin Management (Lazy)](#plugin-management-lazy)
- [Recipes](#recipes)

---

## Vim Fundamentals

### Modes

| Key       | Action                                  |
|-----------|-----------------------------------------|
| `i`       | Insert mode (before cursor)             |
| `a`       | Insert mode (after cursor)              |
| `I`       | Insert at beginning of line             |
| `A`       | Insert at end of line                   |
| `o`       | Open new line below and enter insert    |
| `O`       | Open new line above and enter insert    |
| `v`       | Visual mode (character selection)       |
| `V`       | Visual line mode (line selection)       |
| `Ctrl-v`  | Visual block mode (column selection)    |
| `R`       | Replace mode (overwrite characters)     |
| `Esc`     | Return to normal mode                   |

### Exiting

| Command   | Action                                  |
|-----------|-----------------------------------------|
| `:w`      | Save file                               |
| `:q`      | Quit (fails if unsaved changes)         |
| `:wq`     | Save and quit                           |
| `:q!`     | Quit without saving                     |
| `:qa`     | Quit all open buffers                   |
| `ZZ`      | Save and quit (normal mode shortcut)    |
| `ZQ`      | Quit without saving (normal mode)       |

---

## Navigation

### Basic Movement

| Key       | Action                                  |
|-----------|-----------------------------------------|
| `h`       | Move left                               |
| `j`       | Move down                               |
| `k`       | Move up                                 |
| `l`       | Move right                              |

### Word Movement

| Key       | Action                                  |
|-----------|-----------------------------------------|
| `w`       | Jump to start of next word              |
| `W`       | Jump to start of next WORD (whitespace-delimited) |
| `b`       | Jump to start of previous word          |
| `B`       | Jump to start of previous WORD          |
| `e`       | Jump to end of current/next word        |
| `E`       | Jump to end of current/next WORD        |

### Line Movement

| Key       | Action                                  |
|-----------|-----------------------------------------|
| `0`       | Jump to beginning of line               |
| `^`       | Jump to first non-blank character       |
| `$`       | Jump to end of line                     |
| `f{char}` | Jump to next occurrence of {char} on line |
| `F{char}` | Jump to previous occurrence of {char}   |
| `t{char}` | Jump to just before next {char}         |
| `;`       | Repeat last f/F/t/T motion forward      |
| `,`       | Repeat last f/F/t/T motion backward (NOTE: this is your leader key, so it only works in operator-pending/visual mode) |

### Scrolling & Pagination

| Key       | Action                                  |
|-----------|-----------------------------------------|
| `Ctrl-f`  | Page down (full screen)                 |
| `Ctrl-b`  | Page up (full screen)                   |
| `Ctrl-d`  | Scroll down half screen                 |
| `Ctrl-u`  | Scroll up half screen                   |
| `Ctrl-e`  | Scroll down one line                    |
| `Ctrl-y`  | Scroll up one line                      |
| `zz`      | Center cursor line on screen            |
| `zt`      | Move cursor line to top of screen       |
| `zb`      | Move cursor line to bottom of screen    |

### File Movement

| Key       | Action                                  |
|-----------|-----------------------------------------|
| `gg`      | Go to first line of file                |
| `G`       | Go to last line of file                 |
| `{n}G`    | Go to line number {n}                   |
| `:{n}`    | Go to line number {n}                   |
| `%`       | Jump to matching bracket/paren          |
| `{`       | Jump to previous paragraph/blank line   |
| `}`       | Jump to next paragraph/blank line       |
| `Ctrl-o`  | Jump back to previous location          |
| `Ctrl-i`  | Jump forward to next location           |

---

## Editing

### Basic Editing

| Key         | Action                                |
|-------------|---------------------------------------|
| `x`         | Delete character under cursor         |
| `X`         | Delete character before cursor        |
| `dd`        | Delete (cut) entire line              |
| `D`         | Delete from cursor to end of line     |
| `cc`        | Change (delete + insert) entire line  |
| `C`         | Change from cursor to end of line     |
| `yy`        | Yank (copy) entire line              |
| `Y`         | Yank from cursor to end of line       |
| `p`         | Paste after cursor                    |
| `P`         | Paste before cursor                   |
| `u`         | Undo                                  |
| `Ctrl-r`    | Redo                                  |
| `.`         | Repeat last command                   |
| `J`         | Join current line with line below     |
| `~`         | Toggle case of character under cursor |
| `>>` / `<<` | Indent / unindent line                |

### Text Objects (use with d, c, y, v)

| Key         | Action                                |
|-------------|---------------------------------------|
| `iw`        | Inner word                            |
| `aw`        | A word (includes surrounding space)   |
| `i"`        | Inside double quotes                  |
| `a"`        | Around double quotes                  |
| `i'`        | Inside single quotes                  |
| `i(`/`ib`   | Inside parentheses                    |
| `a(`/`ab`   | Around parentheses                    |
| `i{`/`iB`   | Inside curly braces                   |
| `i[`        | Inside square brackets                |
| `it`        | Inside HTML/XML tag                   |
| `at`        | Around HTML/XML tag                   |
| `ip`        | Inner paragraph                       |
| `ap`        | A paragraph                           |

### Custom Editor Keymaps

| Key         | Action                                |
|-------------|---------------------------------------|
| `Backspace` | Change inner word (`ciw`) — quickly replace the word under cursor |
| `Ctrl-l`    | Clear search highlighting (works in normal and insert mode) |
| `,ge`       | Edit alternate file — jump to the last file you had open |

---

## Search & Replace

| Key / Command          | Action                                |
|------------------------|---------------------------------------|
| `/{pattern}`           | Search forward for pattern            |
| `?{pattern}`           | Search backward for pattern           |
| `n`                    | Next search match                     |
| `N`                    | Previous search match                 |
| `*`                    | Search forward for word under cursor  |
| `#`                    | Search backward for word under cursor |
| `Ctrl-l`               | Clear search highlighting (custom)   |
| `:%s/old/new/g`        | Replace all occurrences in file       |
| `:%s/old/new/gc`       | Replace all with confirmation         |
| `:'<,'>s/old/new/g`    | Replace in visual selection           |

> **Tip**: Search is case-insensitive by default (smartcase enabled). Typing any uppercase letter makes the search case-sensitive.

---

## Telescope (Fuzzy Finder)

Your main tool for finding files, text, and navigating the project.

| Key    | Action                                         |
|--------|-------------------------------------------------|
| `,ff`  | **Find files** — fuzzy search all files (includes hidden files) |
| `,fg`  | **Live grep** — search for text across all files (ripgrep) |
| `,fb`  | **Browse buffers** — see and switch between open files |
| `,fh`  | **Help tags** — search Neovim help documentation |

### Inside Telescope

| Key        | Action                                     |
|------------|---------------------------------------------|
| `Ctrl-n`   | Move to next item in list                  |
| `Ctrl-p`   | Move to previous item in list              |
| `Enter`    | Open selected file                         |
| `Ctrl-x`   | Open in horizontal split                   |
| `Ctrl-v`   | Open in vertical split                     |
| `Ctrl-t`   | Open in new tab                            |
| `Ctrl-u`   | Scroll preview up                          |
| `Ctrl-d`   | Scroll preview down                        |
| `Esc`      | Close telescope (in insert mode)           |
| `Ctrl-c`   | Close telescope                            |

---

## File Browser

Telescope file browser extension for navigating the filesystem.

| Key    | Action                                         |
|--------|-------------------------------------------------|
| `,fn`  | **File browser** — open from project root      |
| `,fm`  | **File browser (current dir)** — open at the directory of the current file |

### Inside File Browser

| Key        | Action                                     |
|------------|---------------------------------------------|
| `Ctrl-c`   | Create file/directory (append `/` for dirs)|
| `Ctrl-r`   | Rename file                                |
| `Ctrl-d`   | Delete file                                |
| `Ctrl-h`   | Toggle hidden files                        |
| `Backspace` | Go to parent directory                    |

---

## LSP (Language Server)

### Configured Language Servers

| Server                 | Languages                               |
|------------------------|-----------------------------------------|
| `elixirls`             | Elixir                                  |
| `emmet_language_server`| HTML, CSS, JS, TS, React (JSX/TSX), Heex, Svelte |
| `lua_ls`               | Lua                                     |
| `rust_analyzer`        | Rust                                    |
| `ts_ls`                | TypeScript / JavaScript                 |

### LSP Keymaps

| Key    | Action                                         |
|--------|-------------------------------------------------|
| `K`    | **Hover** — show documentation for symbol under cursor |
| `gd`   | **Go to definition** — jump to where the symbol is defined |
| `,ca`  | **Code action** — show available fixes/refactors (works in visual mode too) |
| `,cd`  | **Diagnostic float** — show error/warning details for current line |

### Built-in LSP Commands (no custom keymaps, use `:` commands)

| Command                   | Action                              |
|---------------------------|-------------------------------------|
| `:lua vim.lsp.buf.references()`     | Find all references    |
| `:lua vim.lsp.buf.rename()`         | Rename symbol          |
| `:lua vim.lsp.buf.signature_help()` | Show function signature|
| `:lua vim.lsp.buf.type_definition()`| Go to type definition  |
| `:lua vim.diagnostic.goto_next()`   | Jump to next diagnostic|
| `:lua vim.diagnostic.goto_prev()`   | Jump to prev diagnostic|

### Mason (Language Server Manager)

| Command       | Action                                    |
|---------------|-------------------------------------------|
| `:Mason`      | Open Mason UI to install/manage servers   |
| `:MasonUpdate`| Update all installed servers              |

---

## Autocompletion

Powered by nvim-cmp with LSP, snippet, buffer, and path sources.

| Key          | Action                                    |
|--------------|-------------------------------------------|
| `Ctrl-Space` | Trigger completion menu manually          |
| `Ctrl-n`     | Select next completion item               |
| `Ctrl-p`     | Select previous completion item           |
| `Enter`      | Confirm selected completion               |
| `Ctrl-e`     | Dismiss/abort completion menu             |
| `Ctrl-u`     | Scroll documentation popup up             |
| `Ctrl-d`     | Scroll documentation popup down           |

### Completion Sources (in priority order)

1. **LSP** — language-aware completions (functions, variables, types)
2. **LuaSnip** — code snippets
3. **Buffer** — words from the current file (fallback)

### Command-line Completion

- **`/` or `?` (search)**: completes from buffer words
- **`:` (commands)**: completes paths and vim commands

---

## Git

### Fugitive (vim-fugitive)

Full Git client inside Neovim.

| Command         | Action                                  |
|-----------------|-----------------------------------------|
| `:Git`          | Open git status window (like `git status`) |
| `:Git add %`    | Stage current file                      |
| `:Git commit`   | Open commit message editor              |
| `:Git push`     | Push to remote                          |
| `:Git pull`     | Pull from remote                        |
| `:Git blame`    | Show blame for current file             |
| `:Git log`      | Show git log                            |
| `:Git diff`     | Show diff                               |
| `:Gwrite`       | Stage current file and write            |
| `:Gread`        | Checkout file from index (revert changes) |

### Gitsigns

| Key    | Action                                         |
|--------|-------------------------------------------------|
| `,gh`  | **Preview hunk** — see the diff for the current changed block |
| `,gl`  | **Toggle line blame** — show/hide inline git blame on current line |

### Diffview

| Key / Command    | Action                                  |
|------------------|-----------------------------------------|
| `,gv`            | **Open diff view** — full diff UI for all changes |
| `:DiffviewClose` | Close the diff view                     |
| `:DiffviewFileHistory`    | View git log for all files     |
| `:DiffviewFileHistory %`  | View git log for current file  |

---

## Formatting

Powered by conform.nvim. **Files are auto-formatted on save.**

| Key    | Action                                         |
|--------|-------------------------------------------------|
| `,f`   | **Format buffer** — manually trigger formatting |

### Configured Formatters

| Language         | Formatter   |
|------------------|-------------|
| Lua              | stylua      |
| Elixir / Heex    | mix format  |
| CSS              | prettier    |
| Svelte           | prettier    |
| YAML             | yamlfmt     |
| Everything else  | LSP fallback|

| Command          | Action                                  |
|------------------|-----------------------------------------|
| `:ConformInfo`   | Show which formatter is active for current file |

---

## Surround (vim-surround)

Quickly add, change, or delete surrounding characters (quotes, brackets, tags, etc).

| Command        | Action                                    |
|----------------|-------------------------------------------|
| `cs"'`         | **Change** surrounding `"` to `'`         |
| `cs'<q>`       | **Change** surrounding `'` to `<q>` tag   |
| `ds"`          | **Delete** surrounding `"`                |
| `dst`          | **Delete** surrounding HTML tag           |
| `ysiw"`        | **Add** `"` around inner word             |
| `ysiw)`        | **Add** `()` around inner word (no space) |
| `ysiw(`        | **Add** `( )` around inner word (with space) |
| `yss)`         | **Surround** entire line with `()`        |
| `S"` (visual)  | **Surround** visual selection with `"`    |

### Surround Recipes

```
Hello world     →  ysiw"    →  "Hello" world
"Hello" world   →  cs"'     →  'Hello' world
'Hello' world   →  ds'      →  Hello world
<p>Hello</p>    →  dst      →  Hello
Hello world     →  ysiw<em> →  <em>Hello</em> world
```

---

## Commenting (Comment.nvim)

| Key       | Action                                     |
|-----------|--------------------------------------------|
| `gcc`     | Toggle comment on current line             |
| `gc`      | Toggle comment on selected lines (visual)  |
| `gcap`    | Comment out a paragraph                    |
| `gc3j`    | Comment current line + 3 lines below       |

---

## TODO Comments

Highlights `TODO`, `FIXME`, `HACK`, `WARN`, `NOTE` etc. in comments.

| Command               | Action                              |
|------------------------|-------------------------------------|
| `:TodoTelescope`       | Browse all TODOs in Telescope       |
| `:TodoQuickFix`        | Show all TODOs in quickfix list     |

---

## Window Management

### Custom Window Navigation

| Key    | Action                                         |
|--------|-------------------------------------------------|
| `,ml`  | Move focus to **right** window                 |
| `,mk`  | Move focus to **upper** window                 |
| `,mj`  | Move focus to **lower** window                 |
| `,mh`  | Move focus to **left** window                  |

### Built-in Window Commands

| Key / Command  | Action                                  |
|----------------|-----------------------------------------|
| `:split`       | Horizontal split                        |
| `:vsplit`      | Vertical split                          |
| `Ctrl-w s`     | Horizontal split (shortcut)             |
| `Ctrl-w v`     | Vertical split (shortcut)               |
| `Ctrl-w q`     | Close current window                    |
| `Ctrl-w o`     | Close all other windows                 |
| `Ctrl-w =`     | Make all windows equal size             |
| `Ctrl-w +`     | Increase window height                  |
| `Ctrl-w -`     | Decrease window height                  |
| `Ctrl-w >`     | Increase window width                   |
| `Ctrl-w <`     | Decrease window width                   |
| `Ctrl-w R`     | Rotate windows                          |

> **Tip**: Your config opens new splits to the right (`:vsplit`) and below (`:split`) by default.

---

## Buffers & Tabs

| Key / Command  | Action                                  |
|----------------|-----------------------------------------|
| `:e {file}`    | Open a file in a new buffer             |
| `,ge`          | Switch to alternate (last) file         |
| `,fb`          | Browse open buffers with Telescope      |
| `:bn`          | Next buffer                             |
| `:bp`          | Previous buffer                         |
| `:bd`          | Close/delete current buffer             |
| `:ls`          | List all open buffers                   |

### Tabs

| Key / Command     | Action                               |
|-------------------|---------------------------------------|
| `:tabnew {file}`  | Open file in new tab                  |
| `gt`              | Next tab                              |
| `gT`              | Previous tab                          |
| `:tabclose`       | Close current tab                     |

---

## Macros & Registers

| Key         | Action                                    |
|-------------|-------------------------------------------|
| `q{letter}` | Start recording macro into register {letter} |
| `q`         | Stop recording macro                      |
| `@{letter}` | Play macro from register {letter}         |
| `@@`        | Replay last played macro                  |
| `5@a`       | Play macro `a` five times                 |
| `"{letter}y`| Yank into register {letter}               |
| `"{letter}p`| Paste from register {letter}              |
| `"+y`       | Yank to system clipboard (also default due to config) |
| `:reg`      | View all registers                        |

---

## Dashboard (Alpha)

Shown on startup. Press the key to trigger the action:

| Key | Action                                        |
|-----|-----------------------------------------------|
| `n` | New empty file                                |
| `f` | Find file (searches from home directory)      |
| `t` | Find text (live grep)                         |
| `r` | Recent files                                  |
| `u` | Update plugins                                |
| `c` | Open settings (init.lua)                      |
| `p` | Browse projects directory (`~/dev`)           |
| `d` | Browse dotfiles (`~/.dotfiles`)               |
| `q` | Quit Neovim                                   |

---

## Plugin Management (Lazy)

| Command          | Action                                  |
|------------------|-----------------------------------------|
| `:Lazy`          | Open Lazy plugin manager UI             |
| `:Lazy update`   | Update all plugins                      |
| `:Lazy sync`     | Install, clean, and update plugins      |
| `:Lazy health`   | Check plugin health                     |

---

## Recipes

### Quick Find & Open a File
1. `,ff` to open file finder
2. Start typing the filename
3. `Enter` to open, or `Ctrl-v` for vertical split

### Search & Replace Across Project
1. `,fg` to live grep for the term
2. `Ctrl-q` to send all results to quickfix list
3. `:cdo s/old/new/g` to replace across all matching files
4. `:cdo update` to save all changed files

### Review Git Changes Before Committing
1. `,gv` to open Diffview and see all changes
2. `,gl` to toggle line blame on any file
3. `,gh` on any changed line to preview the hunk
4. `:Git commit` to commit when ready

### Rename a Variable (LSP)
1. Place cursor on the variable
2. `:lua vim.lsp.buf.rename()`
3. Type the new name and press `Enter`

### Multi-cursor-like Editing (without a plugin)
1. Search for the term: `/pattern`
2. `cgn` to change the next match
3. Type the replacement
4. Press `Esc`, then `.` to repeat on next match
5. Use `n` to skip a match, `.` to apply

### Surround a Word with Quotes
1. Place cursor on the word
2. `ysiw"` to wrap it in double quotes
3. Or `ysiw(` to wrap in parentheses with spaces

### Comment Out a Block
1. Select lines with `V` and motion keys
2. Press `gc` to toggle comments

### View File Git History
1. `:DiffviewFileHistory %` to see commits for current file
2. Select a commit to see the diff
3. `:DiffviewClose` when done

### Format Only Current File
1. `,f` to format with the configured formatter
2. Or just save the file — format-on-save is enabled

### Jump Between Two Files Rapidly
1. Open both files
2. Use `,ge` to toggle between the current and last file

### Open a Terminal Inside Neovim
1. `:terminal` to open a terminal buffer
2. `i` to enter terminal mode (type commands)
3. `Ctrl-\ Ctrl-n` to exit back to normal mode

### Emmet Expansion (HTML/CSS)
1. In an HTML file, type an abbreviation like `div.container>ul>li*3`
2. Trigger completion with `Ctrl-Space`
3. Select the emmet expansion and press `Enter`
