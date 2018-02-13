#!/bin/bash

LOCAL_DIR=$(dirname "$BASH_SOURCE")

DT_DIR="$HOME/.config/darktable"
LUA_DIR="$DT_DIR/lua"

mkdir -p "$LUA_DIR"
ln -sf "$LOCAL_DIR/lib" "$LUA_DIR/lib"
ln -sf "$LOCAL_DIR/fujifilm_ratings.lua" "$LUA_DIR"

REQUIRE_LINE='require "fujifilm_ratings"'
if ! grep -q "$REQUIRE_LINE" "$DT_DIR/luarc"; then
    echo "$REQUIRE_LINE" >> "$DT_DIR/luarc"
fi
