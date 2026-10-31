# November — Omarchy theme

A cozy dark autumn theme for [Omarchy](https://omarchy.org): espresso backgrounds, warm cream text, pumpkin accent, cranberry, and harvest gold. Seven day-of-week wallpapers cycle automatically.

Art by Arty for John Bracich.

## Install the theme

```bash
omarchy theme install https://github.com/JB3AZ/omarchy-november-theme.git
```

Or use **Install → Style → Theme** in the Omarchy menu with that same URL.

Then pick **November** in the theme menu (or run `omarchy-theme-set november`).

## Daily wallpaper cycling

Each day of the week has its own wallpaper (Sunday = harvest ledge … Saturday = cornucopia). To turn on automatic cycling:

```bash
cd ~/.config/omarchy/themes/november
bash install-daily.sh
```

That installs a small systemd user timer that sets today’s wallpaper at login and again just after midnight.

To set today’s wallpaper once by hand:

```bash
~/.config/omarchy/themes/november/bin/november-daily-wallpaper
```

To stop cycling later:

```bash
systemctl --user disable --now november-wallpaper.timer
```

## Palette

| Role | Color | Hex |
|------|-------|-----|
| Background | Espresso | `#1E1612` |
| Foreground | Warm cream | `#EADBC8` |
| Accent | Pumpkin | `#E07A2E` |
| Cranberry | — | `#A3243B` |
| Gold | — | `#D9A441` |

Icons: `Yaru-wartybrown`

## Wallpapers

1. Sunday — harvest ledge  
2. Monday — dusk fields  
3. Tuesday — pumpkin patch  
4. Wednesday — fireside  
5. Thursday — thanksgiving table  
6. Friday — forest pond  
7. Saturday — cornucopia  

## License

MIT — see `LICENSE`.
