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

git-token will encrypt and store your token. When calling this command,

```
git token adam xxyyzz
```

you will be prompted a few questions. These include, which domain are you
belonging (e.g. an enterprise GitHub solution? Default is just _github.com_),
what is your username there, which password do you want to encrypt the token
with.


**Loading a token**

The program will try to decrypt the token with the supplied password, print it,
and call git-credential to temporarily cache the login credentials. The latter
part will make it easier to interact with git since then the entire git suite
will have access to the cached credentials for a limited time. 

The following is an example of a user retreiving a token with git-token.

```
$ git-token adam
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
as the author.

```
git token --recommit adam
```

## Dependencies:
- `git`, of course
- `gnupg`, for encryption
- `make`, for installation
- `scdoc`, for generating man pages
- `gzip`, for compressing man pages
