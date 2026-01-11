<div align="center">

# asdf-hugo [![CI](https://github.com/eng618/asdf-hugo/actions/workflows/ci.yml/badge.svg)](https://github.com/eng618/asdf-hugo/actions/workflows/ci.yml)

[hugo](https://github.com/gohugoio/hugo) plugin for the [asdf version manager](https://asdf-vm.com), supporting both regular and extended versions.

</div>

# Contents

- [asdf-hugo](#asdf-hugo-)
- [Contents](#contents)
- [Dependencies](#dependencies)
- [Install](#install)
- [Contributing](#contributing)
- [License](#license)

# Dependencies

- `bash`, `curl`, `tar`: generic POSIX utilities.

# Install

Plugin:

```shell
asdf plugin add hugo https://github.com/eng618/asdf-hugo.git
```

hugo:

```shell
# Show all installable versions (regular and extended)
asdf list-all hugo

# Install specific version
asdf install hugo latest

# Install specific extended version (for Sass/SCSS support)
asdf install hugo extended_X.Y.Z

# Set a version globally (on your ~/.tool-versions file)
asdf global hugo latest

# Now hugo commands are available
hugo version
```

Check [asdf](https://github.com/asdf-vm/asdf) readme for more instructions on how to
install & manage versions.

# Contributing

Contributions of any kind welcome! See the [contributing guide](contributing.md).

[Thanks goes to these contributors](https://github.com/eng618/asdf-hugo/graphs/contributors)!

# License

See [LICENSE](LICENSE) © [eng618](https://github.com/eng618/)
