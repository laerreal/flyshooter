#!/usr/bin/python3
from sys import (
    argv
)
from re import (
    compile,
    MULTILINE
)


non_unix_newlines = compile(b"(\r\n)|(\r)")
trailing_whitespaces = compile(b"[ \t]+\n")

def fixup_coding_style(file_name):
    with open(file_name, "rb") as f:
        original = f.read()

    fixed = non_unix_newlines.sub(b"\n", original)
    fixed = trailing_whitespaces.sub(b"\n", fixed)

    with open(file_name, "wb") as f:
        f.write(fixed)


if __name__ == "__main__":
    for fn in argv[1:]:
        print("formatting " + fn + " ...")
        fixup_coding_style(fn)
