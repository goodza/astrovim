# AstroNvim+Goodza Template

**NOTE:** This is for AstroNvim v4+

A template for getting started with [AstroNvim](https://github.com/AstroNvim/AstroNvim)

## 🛠️ Installation

#### Make a backup of your current nvim and shared folder

```shell
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak
```

#### Create a new user repository from this template

Press the "Use this template" button above to create a new repository to store your user configuration.

You can also just clone this repository directly if you do not want to track your user configuration in GitHub.

#### Installation

```shell
git clone git@github.com:goodza/astrovim.git ~/.config/nvim
```

#### Start Neovim

```shell
nvim
```

#### User modifications

Since v4 user's custom confings and boilerplate Astro's one in the same repo
Mappings are defined in astrocore.lua
Home screen in user.lua

#### Update

```shell
:AstroUpdate
```

#### Rich colors support for your terminal

```shell
./24-bit-color.sh
```
