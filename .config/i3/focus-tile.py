#!/usr/bin/env python3
"""Focus in a direction, escaping any tabbed/stacked container first.

Without this, `focus left/right` cycles tabs inside a stacked/tabbed
container before moving to the next tile. We walk up the tree past any
tabbed/stacked ancestors so the directional move jumps straight to the
next tile.
"""
import sys
from i3ipc import Connection

direction = sys.argv[1]
i3 = Connection()
focused = i3.get_tree().find_focused()

node = focused.parent
while node and node.layout in ("tabbed", "stacked"):
    i3.command("focus parent")
    node = node.parent

i3.command(f"focus {direction}")
