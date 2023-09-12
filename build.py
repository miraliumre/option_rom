#!/usr/bin/env python3

import os
import subprocess

def add_checksum(path: str) -> None:
    with open(path, 'rb') as f:
        data = f.read()

    sum = 0
    for b in data:
        sum += b
    sum &= 0xff
    checksum = (-sum) & 0xff

    with open(path, 'ab') as f:
        f.write(bytes([checksum]))

def get_base_directory() -> str:
    return os.path.dirname(os.path.abspath(__file__))

def main() -> None:
    base_directory = get_base_directory()
    src_directory = os.path.join(base_directory, 'src')
    src = os.path.join(src_directory, 'main.asm')
    bin = os.path.join(base_directory, 'bin', 'option.rom')

    assembler = subprocess.run(['nasm', '-f', 'bin', src, '-o', bin],
                               cwd=src_directory)
    assembler.check_returncode()

    add_checksum(bin)

if __name__ == '__main__':
    main()