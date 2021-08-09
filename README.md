# `chmd`

- Make CHANGELOG.md from git-log and git-tag


## Usage

```bash
$ curl -Lo chmd&&
# inside git repo
$ ./chmd | less # check output
$ ./chmd > CHANGELOG.md
# outside git repo
$ ./chmd
Error: outside git repo, or git is not installed.
```

- If you want to globally run this command,

```bash
$ install -m 755 chmd /usr/local/bin/chmd
$ which chmd
/usr/local/bin/mkch
```

## Sample

- [face-symmetrizer/CHANGELOG.md](https://github.com/eggplants/face-symmetrizer/blob/master/CHANGELOG.md)
  - Made by `chmd`

## Requirements

- Ruby

## License

MIT
