# glib-footprint

GLib footprint experiments.

# Prerequisites

- C compiler
- Meson >= 0.60 (pip3 install meson)
- ninja (brew install ninja)

# Building

```sh
$ VALAC=/home/oleavr/src/frida/build/toolchain-linux-x86_64/bin/valac-0.56 meson setup --force-fallback-for glib,libffi,pcre,zlib build
$ ninja -C build
```
