# git-token

Manage git tokens with password encrypted files.

## Installation

```
git clone https://github.com/kaarmu/git-token
cd git-token
make install
```

**Note:** `~/.local/bin` needs to be in `PATH`.

## Usage

**Saving a token**

git-token will encrypt (using gnupg) and store user data
to the directory ~/.local/share/git-token.

```
> git-token adam xxyyzz
...
```

**Loading a token**

The program will try to decrypt the token, print it, and
call git-credential to save the login credentials for a
limited time.

```
> git-token adam
Password:
Found token "xxyyzz" and cached it for a limited time.
```

**Enabling git credentials**

To use `git-credential-cache`, an important part of `git-token`,
you only need to call `git-token` the `-e` option once and
`git-token` will enable `git-credential-cache` for you.

**Fixing author**

If you have made a commit under the wrong authorship `git-token`
will help you easily solve that with one command. Call
`git-token` with the `--recommit` option and `git-token` will
re-commit the last commit (with the same message) using you
as the author

```
> git token --recommit adam
```

## Dependencies:
- `git`, of course
- `gnupg`, installed almost everywhere
- `make`, for installation
