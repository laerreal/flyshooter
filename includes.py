#!/usr/bin/python

from sys import (
    argv,
)
from os.path import (
    dirname,
    join,
)


def main():
    if len(argv) < 2:
        print("specify starting file")
        return 1

    stack = [argv[1]]
    processed = set()

    while stack:
        fname = stack.pop()
        dname = dirname(fname)
        # print(fname)
        with open(fname, "r") as f:
            for l in f.readlines():
                ls = l.strip()
                if ls.startswith("include"):
                    inclusion = ls[7:].strip(" \t\r\n'\"")
                    incfname = join(dname, inclusion)
                    # print(fname + " <- " + incfname)
                    print(incfname)
                    if incfname not in processed:
                        processed.add(incfname)
                        stack.append(incfname)


if __name__ == "__main__":
    exit(main() or 0)
