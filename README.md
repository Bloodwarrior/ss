# DOOM Repository

This repository now includes a simple script to install and run **Freedoom** using the
`chocolate-doom` engine. Freedoom is an open-source game that is compatible with the
classic DOOM engine, providing free game data.

## Playing DOOM

Run the script from this repository:

```bash
bash play_doom.sh
```

The script will install the required packages (`chocolate-doom` and `freedoom`) using
`apt-get` if they are not already installed, then launch the game.

## Playing DOOM with swords

An additional script `play_doom_with_sword.sh` is provided to launch Freedoom with a community sword mod. It downloads the mod on first run and then loads it using Chocolate Doom.

Run the script:

```bash
bash play_doom_with_sword.sh
```

This will install any missing packages, download the sword mod to `~/.local/share/doom/sword.wad` (using a placeholder URL), and then start the game with that mod enabled.
