# `chmd`

- Make CHANGELOG.md from git-log and git-tag

## Syntax

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

## Usage

```bash
$ curl -L https://git.io/JRuUu -o chmd && chmod +x $_
# inside git repo
$ ./chmd | less # check output
$ ./chmd > CHANGELOG.md
# outside git repo
$ ./chmd
Error: outside git repo, or git is not installed.
```

- If you want to globally run this command,

```bash
$ sudo install -m 755 chmd /usr/local/bin/chmd
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
