# Neovim Configuration

This document provides a detailed overview of the plugins used in the Neovim configuration. Each plugin is aimed at enhancing the development workflow in various aspects such as navigation, version control, code formatting, and more.

- **Diffview.nvim (`sindrets/diffview.nvim`)**: Offers a rich interface to visualize and navigate through diffs, including git diffs. It provides a side-by-side diff view, making it easier to compare changes.

- **Gitsigns.nvim (`lewis6991/gitsigns.nvim`)**: Enhances the git experience by adding inline git blame and change annotations. It supports previewing diffs of hunks inline.

- **Telescope.nvim (`nvim-telescope/telescope.nvim`)**: A highly extendable fuzzy finder over lists, from files to git commits. It offers an interface to quickly search and filter through various data sources.

- **Telescope UI Select (`nvim-telescope/telescope-ui-select.nvim`)**: An extension for `telescope.nvim` that enhances the selection interface, making it more intuitive and visually appealing.

- **Todo Comments.nvim (`folke/todo-comments.nvim`)**: Integrates with Telescope to provide a searchable list of TODO comments within your project, helping keep track of tasks and important notes.

- **Treesitter (`nvim-treesitter/nvim-treesitter`)**: Improves syntax highlighting for a wide range of programming languages, ensuring accurate and performant code readability.

- **LSP Config (`neovim/nvim-lspconfig`)**: Simplifies the configuration of language servers, supporting code completion, linting, and navigation with seamless integration for completions.

- **Comment.nvim (`numToStr/Comment.nvim`)**: Facilitates easy commenting of code lines and blocks across multiple programming languages.

- **CMP (`hrsh7th/nvim-cmp`)**: A completion engine that provides smart autocompletion for code, configured to work with various sources, including LSP and snippets.

- **LuaSnip (`L3MON4D3/LuaSnip`)**: A snippet engine that allows defining and using complex snippets efficiently, integrated with `nvim-cmp` for snippet completions.

- **Conform.nvim (`stevearc/conform.nvim`)**: Automatically formats code upon saving, supporting a variety of formatters for different file types to ensure consistent code style.

- **Indent Blankline (`lukas-reineke/indent-blankline.nvim`)**: Adds indentation guides to the editor, helping visually distinguish code blocks and their hierarchical structure.

- **Bufferline (`akinsho/bufferline.nvim`)**: Enhances buffer management with a tabbed interface for efficient navigation between open files, supporting pinning, hiding, and custom actions.

- **Catppuccin Theme (`catppuccin/nvim`)**: Provides a soothing color scheme for Neovim, configured to use the "mocha" variant for a balance between contrast and harmony.

- **Lualine (`nvim-lualine/lualine.nvim`)**: A customizable and lightweight status line plugin, configured to match the Dracula theme, offering essential information about the current buffer and system status.

- **NvimTree (`nvim-tree/nvim-tree.lua`)**: A file explorer plugin that offers a graphical interface to navigate the file system, view git statuses, and perform file operations directly from the editor.

Each plugin is configured to seamlessly integrate with the Neovim environment, enhancing productivity and making development a more pleasant experience.

## Plugin Mappings

This document provides an overview of custom keyboard mappings for various Neovim plugins, enhancing functionality related to version control, searching, commenting, and file navigation.

In all the mappings `Leader` is the `Space` key.

### Git and Version Control

- `Leader + gd`: Open the Diffview panel to show the current git diff.
- `Leader + gc`: Close the Diffview panel.
- `Leader + ph`: Preview the git hunk at the cursor using `gitsigns`.
- `Leader + cm`: Open a Telescope picker for git commits. Selecting a commit opens a Diffview comparing the commit against its parent.

### Searching and Navigating

- `Leader + ff`: Open Telescope to find files, including hidden and ignored files.
- `Leader + fw`: Open Telescope to perform a live grep search in the project.
- `Leader + ft`: Use Telescope to search for TODO comments in the codebase.

### Commenting

- `Leader + /`: Toggle commenting for the current line in normal mode.
- `Leader + /` (Visual mode): Toggle commenting for selected lines.

### Language Server Protocol (LSP) Mappings

- `Leader + ca`: Trigger the code action menu for the current cursor position.
- `K`: Show hover information for the symbol under the cursor.
- `gd`: Go to the definition of the symbol under the cursor.

### File Exploration

- `Ctrl + n`: Toggle the NvimTree file explorer.
- `Leader + e`: Focus the NvimTree file explorer.

---

## Keyboard Shortcuts

This document outlines general custom keyboard mappings configured for NeoVim, improving efficiency and productivity. The mappings are organized by mode: Insert, Normal, Visual, and Terminal.

In all the mappings `Leader` is the `Space` key.

### Insert Mode Mappings

- `Ctrl + a`: Move the cursor to the beginning of the line.
- `Ctrl + e`: Move the cursor to the end of the line.
- `Ctrl + d`: Delete the character in front of the cursor (forward delete).
- `Ctrl + k`: If the current line is empty, delete the entire line; otherwise, delete everything from the cursor's position to the end of the line. This decision is made dynamically based on the content of the current line.
- `Ctrl + s`: Save the file while remaining in insert mode.

### Normal Mode Mappings

- `d`: Cut the selection or line (without yanking).
- `D`: Cut to the end of the line (without yanking).
- `dd`: Cut the entire line (without yanking).
- `Alt + Up`: Move the current line up.
- `Alt + Down`: Move the current line down.
- `;`: Enter command mode.
- `Esc`: Clear search highlights.
- `Tab`: Switch to the next buffer.
- `Shift + Tab`: Switch to the previous buffer.
- `Ctrl + h`: Move to the window to the left.
- `Ctrl + l`: Move to the window to the right.
- `Ctrl + j`: Move to the window below.
- `Ctrl + k`: Move to the window above.
- `Ctrl + s`: Save the file.
- `Ctrl + c`: Copy the entire file to the clipboard.
- `Leader + n`: Toggle line numbers.
- `Leader + rn`: Toggle relative line numbers.
- `j`: Move down one display line (not necessarily one line in the file).
- `k`: Move up one display line.
- `Up`: Alias for moving up, considering display lines.
- `Down`: Alias for moving down, considering display lines.
- `Leader + b`: Open a new buffer.
- `Leader + h`: Open a horizontal split with a terminal.
- `Leader + v`: Open a vertical split with a terminal.
- `Leader + x`: Close the current buffer. If it's a terminal buffer, no action is taken. If there is more than one buffer, switch to the previous buffer before closing the current one. Otherwise, open a new buffer before closing the current one.

### Visual Mode Mappings

- `d`: Cut the selection (without yanking).
- `D`: Cut to the end of the line from the cursor (without yanking).
- `<`: Decrease the indent level of the selection, reselecting the text afterward.
- `>`: Increase the indent level of the selection, reselecting the text afterward.

### Terminal Mode Mappings

- `Ctrl + x`: Switch from terminal mode to normal mode.

---


