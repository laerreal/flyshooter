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
unindented_right_comments = compile(b";(?=\w)")
unindented_left_comments = compile(b"(?<=[\w]);")

def fixup_coding_style(file_name):
    with open(file_name, "rb") as f:
        original = f.read()

    fixed = non_unix_newlines.sub(b"\n", original)

    # add new line at and of file
    if fixed[-1:] != b"\n":
        fixed += b"\n"

    fixed = trailing_whitespaces.sub(b"\n", fixed)
    # Add space at beginning of word-like commetns.
    # Special symbol starting comments like ;------ are ignored.
    fixed = unindented_right_comments.sub(b"; ", fixed)
    # Add space after word.
    fixed = unindented_left_comments.sub(b" ;", fixed)

    with open(file_name, "wb") as f:
        f.write(fixed)


if __name__ == "__main__":
    for fn in argv[1:]:
        print("formatting " + fn + " ...")
        fixup_coding_style(fn)
