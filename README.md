# .dotfiles
.dotfiles from theonekingboo

This repo is mostly for me to easily replicate my neovim, nix, window manager and tmux configurations elsewhere

Feel free to use tho!

## NixOS

As i have switched to NixOS, there is now an availible config for use.

If you are planning to use anything else on this config, i highly reccomend that you use my nix config so that the needed packages are installed.

make sure to add stylix.enable to the old nix config

## Neovim

To use the Neovim config (Nvchad) you will need a few things

- Nvchad
- Rust language installed
- Go language installed
- Node and npm installed
- .NET SDK
- Github Copilot (optional)

This is so you can download the packages for the 4 languages 

There is also now Copilot in the config, but you will need to pay for Copilot in order to use it here.

> [!IMPORTANT]
> The way the files are installed means that you will need to be using an older version of nvchad
>
> You can install that version with this command below :

> ### Linux
> ```
> git clone -b v2.0 https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
> ```
> ### Windows (powershell)
> ```
> git clone -b v2.0 https://github.com/NvChad/NvChad $ENV:USERPROFILE\AppData\Local\nvim --depth 1
> ```

## Hyprland

Hyprland is currently my main window manager, because of that, this is the most up-to-date and functional option out of the three

## Tofi

If you're using the tofi launcher, make sure to create the folder in .config/tofi and put my file in that folder

## i3

My i3 config is about to change as i am switching distros and will most likely use Sway in the future.

The config will be fully working for me, but you will need to do some changes yourself in order to work.

As this config is pretty much the config from [Tester Tech's video¸](https://www.youtube.com/watch?v=hz3plDLZ3kI&t=669s), i reccommend that you go watch his tutorial on his config and how it works:
https://github.com/TesterTech/rice-i3-from-scratch-pywal

## Sway

The config uploaded is very simple BUT keep in mind that this config is for [SwayFX](https://github.com/WillPower3309/swayfx)

If you want to use this on a normal Sway environment, make sure to edit some of the lines.
