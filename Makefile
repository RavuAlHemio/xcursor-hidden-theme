XCURSORGEN=xcursorgen
SYMLINK=ln -sf
RMF=rm -f
INSTALL=install
DESTDIR=
PREFIX=/usr

# borrowed from weston/clients/window.c
CURSORS=bottom_left_corner \
  sw-resize \
  bottom_right_corner \
  se-resize \
  bottom_side \
  s-resize \
  grabbing \
  closedhand \
  208530c400c041818281048008011002 \
  left_ptr \
  default \
  top_left_arrow \
  left-arrow \
  left_side \
  w-resize \
  size_hor \
  right_side \
  e-resize \
  top_left_corner \
  nw-resize \
  size_fdiag \
  top_right_corner \
  ne-resize \
  size_bdiag \
  top_side \
  n-resize \
  size_ver \
  xterm \
  ibeam \
  text \
  hand1 \
  pointer \
  pointing_hand \
  e29285e634086352946a0e7090d73106 \
  watch \
  wait \
  0426c94ea35c87780ff01dc239897213 \
  dnd-move \
  dnd-copy \
  dnd-none \
  dnd-no-drop

all: transparent32

transparent32: transparent32.png transparent32.txt
	$(XCURSORGEN) transparent32.txt transparent32

clean:
	$(RMF) transparent32

install:
	$(INSTALL) -m 0755 -d $(DESTDIR)$(PREFIX)/share/icons/xcursor-hidden/cursors
	$(INSTALL) -m 0644 transparent32 $(DESTDIR)$(PREFIX)/share/icons/xcursor-hidden/cursors
	for cur in $(CURSORS); do $(SYMLINK) "transparent32" "$(DESTDIR)$(PREFIX)/share/icons/xcursor-hidden/cursors/$$cur"; done

.PHONY: all clean install
