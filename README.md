# CHANGELOG.md generator: `chmd`

## TL;DR

[![Gem](https://img.shields.io/gem/v/chmd?color=%23dc3519)](https://rubygems.org/gems/chmd) [![Codacy Badge](https://api.codacy.com/project/badge/Grade/3e754783cb5b4f5789376cdef143d8d8)](https://app.codacy.com/gh/eggplants/chmd?utm_source=github.com&utm_medium=referral&utm_content=eggplants/chmd&utm_campaign=Badge_Grade_Settings) [![Release Gem](https://github.com/eggplants/chmd/actions/workflows/release.yml/badge.svg)](https://github.com/eggplants/chmd/actions/workflows/release.yml)

- CHANGELOG.md generator specializing in github repo

## Syntax

- See example: [chmd/CHANGELOG.md](CHANGELOG.md)

```txt
# Changelog
<blank line>
## [<tagname>](<gh_url>/releases/tag/<tagname>) - <timestamp> ([compare](<gh_url>/compare/<prev_tagname | init_commit_hash>...<tagname>))
<blank line>
- [<commit_hash>](<gh_url>/commit/<commit_hash>)
  - <message>
- [<commit_hash>](<gh_url>/commit/<commit_hash>)
  - <message>
...
- [<commit_hash>](<gh_url>/commit/<commit_hash>)
  - <message>
<blank line>
```

## Install

```bash
gem install chmd
```

## Usage

- Within git repo:

```bash
chmd
```

![scs01](img/scs01.png)

- And output to CHANGELOG.md

```bash
chmd > CHANGELOG.md
```

- Raise an error when executing outside git repo:

```bash
chmd # Error: You are not in a git repo.
```

## License

MIT
