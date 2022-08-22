# git-token
Manage git tokens with password encrypted files.

*This repository is for my convenience, please see the original [gist](https://gist.github.com/kaarmu/2bad1f7bba79868e4bf894c280c51ade).*

## Installation

### `make install`

This repo contains a submodule, clone and install by:
```
git clone https://github.com/kaarmu/git-token
cd git-token
make install
```

*Note:* `~/.local/bin` *needs to be in* `PATH`.

### Manual

Clone the repo and submodule
```
git clone --recurse-submodules https://github.com/kaarmu/git-token
```
The script needs to be moved to somewhere in `PATH`, e.g. `~/.local/bin` is a good directory for this.
After making sure `~/.local/bin~` is in `PATH` then copy the script to there and set it to executable.
Aslo, move existing tokens to `~/.local/share/git-token`.
```
cp git-token/src/git-token ~/.local/bin
sudo chmod 775 ~/.local/bin/git-token
mkdir -p ~/.local/share/git-token
cp git-token/tokens/* ~/.local/share/git-token
```

## Usage

To save a token: git-token adam xxyyzz
The program will encrypt with gnupg a file named "adam"
containing "xxyyzz" to the directory ~/.local/share/git-token.

To load a token: git-token adam
The program will try to decrypt the file
~/.local/share/git-token/adam, print the contents, and call
git credential to save the login credentials for a limited time.

To use git credential you only need to specify the `-e` option
and `git-token` will enable `git-credential-cache`. And that is
not all! Now `git-token` will also configure the user & email if 
it can. Read more using the `-h` option.

## Dependencies:
- `git`, of course
- `gnupg`, installed almost everywhere
