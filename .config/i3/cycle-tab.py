#!/usr/bin/env python3
"""Cycle tabs within the nearest tabbed/stacked ancestor, with wrap.

Unlike `focus next/prev`, this never escapes the stack — at the last
tab it wraps to the first (and vice versa). If the focused window is
not inside a tabbed/stacked container, do nothing.
"""
import sys
from i3ipc import Connection

direction = sys.argv[1]  # next | prev
i3 = Connection()
focused = i3.get_tree().find_focused()

# Walk up to find the nearest tabbed/stacked ancestor, remembering
# which of its direct children is on the path to the focused window.
child = focused
parent = focused.parent
while parent and parent.layout not in ("tabbed", "stacked"):
    child = parent
    parent = parent.parent

if parent is None:
    sys.exit(0)

siblings = parent.nodes
idx = next(i for i, n in enumerate(siblings) if n.id == child.id)
step = 1 if direction == "next" else -1
target = siblings[(idx + step) % len(siblings)]
i3.command(f"[con_id={target.id}] focus")
