# Keyboard Shortcuts

This document outlines custom keyboard mappings configured for NeoVim, improving efficiency and productivity. The mappings are organized by mode: Insert, Normal, Visual, and Terminal.

## Insert Mode Mappings

- **Ctrl + a**: Move the cursor to the beginning of the line.
- **Ctrl + e**: Move the cursor to the end of the line.
- **Ctrl + d**: Delete the character in front of the cursor (forward delete).
- **Ctrl + k**: If the current line is empty, delete the entire line; otherwise, delete everything from the cursor's position to the end of the line. This decision is made dynamically based on the content of the current line.
- **Ctrl + s**: Save the file while remaining in insert mode.

## Normal Mode Mappings

- **d**: Cut the selection or line (without yanking).
- **D**: Cut to the end of the line (without yanking).
- **dd**: Cut the entire line (without yanking).
- **Alt + Up**: Move the current line up.
- **Alt + Down**: Move the current line down.
- **;**: Enter command mode.
- **Esc**: Clear search highlights.
- **Tab**: Switch to the next buffer.
- **Shift + Tab**: Switch to the previous buffer.
- **Ctrl + h**: Move to the window to the left.
- **Ctrl + l**: Move to the window to the right.
- **Ctrl + j**: Move to the window below.
- **Ctrl + k**: Move to the window above.
- **Ctrl + s**: Save the file.
- **Ctrl + c**: Copy the entire file to the clipboard.
- **Leader + n**: Toggle line numbers.
- **Leader + rn**: Toggle relative line numbers.
- **j**: Move down one display line (not necessarily one line in the file).
- **k**: Move up one display line.
- **Up**: Alias for moving up, considering display lines.
- **Down**: Alias for moving down, considering display lines.
- **Leader + b**: Open a new buffer.
- **Leader + h**: Open a horizontal split with a terminal.
- **Leader + v**: Open a vertical split with a terminal.
- **Leader + x**: Close the current buffer. If it's a terminal buffer, no action is taken. If there is more than one buffer, switch to the previous buffer before closing the current one. Otherwise, open a new buffer before closing the current one.

## Visual Mode Mappings

- **d**: Cut the selection (without yanking).
- **D**: Cut to the end of the line from the cursor (without yanking).
- **<**: Decrease the indent level of the selection, reselecting the text afterward.
- **>**: Increase the indent level of the selection, reselecting the text afterward.

## Terminal Mode Mappings

- **Ctrl + x**: Switch from terminal mode to normal mode.

