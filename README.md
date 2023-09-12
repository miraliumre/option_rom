# Option ROM

This is a base template for a legacy [Option ROM]. It can be freely used
for your upcoming projects or experimentations.

### Running

To run the Option ROM, you will need to assemble it by running the
`build.py` script.

The assembled file will be placed under the `bin` directory and named
`option.rom`. It can be tested on QEMU via the `-option-rom` command
line option, as follows:

```bash
qemu-system-i386 -option-rom bin/option.rom
```

In order to run it on actual hardware, you might need to customize the
code for your specific system, such as by changing the values in the
`src/includes/header.asm` file.

### Contributing

Contributions are welcome! If you'd like to contribute, please fork this
repository, make your changes, and submit a pull request.

### License

This project is released under [The Unlicense].

[Option ROM]: https://en.wikipedia.org/wiki/Option_ROM
[The Unlicense]: LICENSE.txt