# Keyboard Shortcuts

This document outlines custom keyboard mappings configured for NeoVim, improving efficiency and productivity. The mappings are organized by mode: Insert, Normal, Visual, and Terminal.

In all the mappings `Leader` is the `Space` key.

## Insert Mode Mappings

- `Ctrl + a`: Move the cursor to the beginning of the line.
- `Ctrl + e`: Move the cursor to the end of the line.
- `Ctrl + d`: Delete the character in front of the cursor (forward delete).
- `Ctrl + k`: If the current line is empty, delete the entire line; otherwise, delete everything from the cursor's position to the end of the line. This decision is made dynamically based on the content of the current line.
- `Ctrl + s`: Save the file while remaining in insert mode.

## Normal Mode Mappings

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

## Visual Mode Mappings

- `d`: Cut the selection (without yanking).
- `D`: Cut to the end of the line from the cursor (without yanking).
- `<`: Decrease the indent level of the selection, reselecting the text afterward.
- `>`: Increase the indent level of the selection, reselecting the text afterward.

## Terminal Mode Mappings

- `Ctrl + x`: Switch from terminal mode to normal mode.

---

## Plugin Mappings

This document provides an overview of custom keyboard mappings for various Neovim plugins, enhancing functionality related to version control, searching, commenting, and file navigation.

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

