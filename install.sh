#!/bin/bash

LOCAL_DIR=$(dirname "$0")

DT_DIR="$HOME/.config/darktable"
LUA_DIR="$DT_DIR/lua"

mkdir -p "$LUA_DIR"
cp "$LOCAL_DIR/fujifilm_ratings.lua" "$LUA_DIR"
echo 'require "fujifilm_ratings"' >> "$DT_DIR/luarc"
