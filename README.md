# My emacs config

## Setup

To grab all the dependencies:

    git clone --recursive git://github.com/magnars/.emacs.d.git

## Shortcuts

### Window management

* `M-p    ` Swith window
* `C-x 0  ` Close this window
* `C-x 1  ` Close other windows
* `C-x 2  ` Split window horizontally
* `C-x 3  ` Split window vertically
* `S-arrow` Jump to window to the left/right/up/down

### Killing text

* `C-S-k  ` Kill whole line
* `C-c C-w` Kill to beginning of the line

### Transpose

* `M-t w` Transpose words
* `M-t l` Transpose lines
* `M-t s` Transpose sexps
* `M-t p` Transpose params

### Move lines

* `C-S-<up>` Move line up
* `C-S-<down>` Move line down

### Magit

* `C-x m` Status

### Dired

* `C-x d` Select directory
* `C-x C-f` Create new file
* `wdired-change-to-wdired-mode` Rename mode

#### Dired list commands

* `C` Copy file
* `R` Rename/move file
* `D` Delete file
* `+` Create new directory
* `Z` Compress/Decompress the file by gzip
* `g` Refresh list
* `^` Go to parent
* `m` Mark file
* `u` Unmark file
* `U` Unmark all marked
* `% m` Mark by pattern

### Bookmark

* `C-x r m` Create bookmark
* `C-x r l` List bookmarks

#### Bookmark list commands

* `s` Save bookmarks
* `D` Delete bookmark
* `r` Rename bookmark

### Go to last changes

* `C-.` Go to last change
* `C-,` Go to recursive change

### Indention

* `C-x tab` Indention mode, after use arrow for move code
* `C-u -2 C-x tab` Strip 2 spaces left

### Other

* `C-'` Expand region
* `M-;` Comment/Uncomment line or region
* `C-c d` duplicate region or line
* `C-"` Toggle quotes
* `M-j` Jump to char(prefix possible)
* `M-\` Delete whitespaces around point
* `C-x h` Mark whole buffer