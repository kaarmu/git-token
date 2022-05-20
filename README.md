# git-token
Manage git tokens with password encrypted files.

*This repository is for my convenience, please see the original [gist](https://gist.github.com/kaarmu/2bad1f7bba79868e4bf894c280c51ade).*

## Installation

### `make install`

This repo contains a submodule, clone and install by:
```
git clone --recurse-submodules https://github.com/kaarmu/git-token
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

To save a token: `git-token adam xxyyzz`
The program will encrypt with gnupg a file named `adam`
containing `xxyyzz` to the directory `~/.local/share/git-token`.

To load a token: `git-token adam`
The program will try to decrypt the file
`~/.local/share/git-token/adam` and put the content in the
clipboard using xclip.

That is not all! Now `git-token` will also create a temporary `~/.git-credentials` file. For those who don't
know, your `https` credentials can be saved and automatically inserted by `git` if such a file exist. No more
pain with multiple submodules that all require authentication! You can simply run `git token USERNAME` and
enjoy life.

To use `git-credentials` you need to run `git config credential.helper store` in your repository once (you
need to do it again for new repositories), or alternatively, run  `git config --global credential.helper store`
(then you don't have to do it again for new repositories). This command will tell `git` to use `~/.git-credentials`
if it finds the file.

However, the `~/.git-credentials` file contains both your username and token in pure text (this is how `git`
implemented it). Therefore, to still keep your credentials secure, will `git-token` automatically delete the
file after 10 minutes.

## Dependencies:
- `gnupg`, installed almost everywhere
- `xclip`, maybe not installed on your system
