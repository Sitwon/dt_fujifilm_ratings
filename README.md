# Fujifilm Ratings

This script enables darktable to detect and import the in-camera star ratings on
images shot with a Fujifilm camera.

## Installation

From the directory containing `fujifilm_ratings.lua`, run the following:
```
$ mkdir -p ~/.config/darktable/lua/
$ ln -sf lib ~/.config/darktable/lua/lib
$ ln -sf fujifilm_ratings.lua ~/.config/darktable/lua/
$ echo 'require "fujifilm_ratings"' >> ~/.config/darktable/luarc
```

## Dependencies

This script relies on the `exiftool` command-line utility. It should be
available in your distro's repository.  
https://www.sno.phy.queensu.ca/~phil/exiftool/
