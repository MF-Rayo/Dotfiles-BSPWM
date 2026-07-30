## Installation & Setup

Clone the repository and run the automated installation script:

```bash
git clone https://github.com/MF-Rayo/Dotfiles-BSPWM.git
```

```bash
cd Dotfiles-BSPWM &&  chmod +x ./Installer.sh
```

```bash
./Installer.sh
```


### API Keys Configuration (Optional)

To enable integration with **OpenWeather** (for weather widgets) and **Wallhaven** (for downloading wallpapers), you need to provide your own API keys.

1. **Get your free API keys:**
    
    - **OpenWeather API:** [openweathermap.org](https://openweathermap.org/)
        
    - **Wallhaven API:** [wallhaven.cc](https://wallhaven.cc)
        
2. **Edit your local configuration file:**
```bash
nvim ~/.config/theme/config.json
```

```bash
{
  "theme": "White",
  "polybar": "Cuts",
  "bspwmrc": {
    "left_padding": "4",
    "right_padding": "4",
    "top_padding": "34",
    "bottom_padding": "34",
    "bar": "/home/r4yx/.config/polybar/launch.sh"
  },
  "api": {
    "wallhaven": "YOUR_WALLHAVEN_API_KEY",
    "openweather": "YOUR_OPENWEATHER_API_KEY"
  },
  "city": "YOUR_CITY_NAME"
}
```


# Keybindings & Shortcuts 
---

This guide lists all configured keybindings managed by `sxhkd` for **BSPWM** and system shortcuts.

> **Note:** `Super` refers to the **Windows / Command** key.

---

### Applications & Custom Scripts

| Keybinding | Action / Command | Description |
| :--- | :--- | :--- |
| `Super` + `Return` | `kitty` | Open Terminal (with software GL) |
| `Alt` + `s` | `ScratchPad.sh` | Toggle Scratchpad Window |
| `Shift` + `l` | `i3lock-everblush` | Lock Screen |
| `Super` + `Shift` + `f` | `firefox` | Launch Firefox Web Browser |
| `Super` + `Shift` + `b` | `burpsuite` | Launch Burp Suite |
| `F1` | `copy_ip.sh --myip` | Copy Local IP Address to Clipboard |
| `F2` | `copy_ip.sh --target` | Copy Target IP Address to Clipboard |
| `Super` + `k` | `keyboard.sh` | Switch Keyboard Layout / Settings |
| `Alt` + `r` | `pkill -USR1 -x sxhkd` | Reload `sxhkd` Configuration |

---

### Rofi Menus & Pickers

| Keybinding | Action / Command | Description |
| :--- | :--- | :--- |
| `Super` + `d` | `apps.rasi` | Application Launcher |
| `Super` + `p` | `power` | Power Menu (Shutdown, Reboot, Lock) |
| `Alt` + `m` | `player.sh` | Music Player Control Menu |
| `Alt` + `n` | `notes` | Quick Notes Menu |
| `Print` | `screenshot` | Take Screenshot Menu |
| `Super` + `Ctrl` + `t` | `ThemeSelect` | Rofi Theme Selector |
| `Super` + `Ctrl` + `w` | `WallSelect` | Wallpaper Selector |
| `Super` + `Ctrl` + `p` | `PolySelect` | Polybar Theme Selector |
| `Super` + `Ctrl` + `d` | `download_wallpaper.sh` | Download Wallpaper Script |

---

### Window Management (BSPWM)

| Keybinding | Action / Command | Description |
| :--- | :--- | :--- |
| `Super` + `Alt` + `r` | `bspc wm -r` | Restart BSPWM |
| `Super` + `Alt` + `q` | `bspc quit` | Quit BSPWM |
| `Super` + `q` | `bspc node -c` | Close Window |
| `Super` + `Shift` + `q` | `bspc node -k` | Kill Window |
| `Super` + `m` | `bspc desktop -l next` | Toggle Layout (Tiled / Monocle) |
| `Super` + `g` | `bspc node -s biggest.window` | Swap current window with biggest |
| `Super` + `t` | State: `tiled` | Set Window to Tiled |
| `Super` + `Shift` + `t` | State: `pseudo_tiled` | Set Window to Pseudo-Tiled |
| `Super` + `s` | State: `floating` | Set Window to Floating |
| `Super` + `f` | State: `fullscreen` | Toggle Fullscreen |
| `Super` + `Ctrl` + `m` | Flag: `marked` | Toggle Marked Flag |
| `Super` + `Ctrl` + `x` | Flag: `locked` | Toggle Locked Flag |
| `Super` + `Ctrl` + `y` | Flag: `sticky` | Toggle Sticky Flag |
| `Super` + `Ctrl` + `z` | Flag: `private` | Toggle Private Flag |

---

### Focus, Navigation & Resizing

| Keybinding | Action / Command | Description |
| :--- | :--- | :--- |
| `Super` + `← ↓ ↑ →` | Focus direction | Focus window in given direction |
| `Super` + `Shift` + `← ↓ ↑ →` | Swap direction | Swap window in given direction |
| `Super` + `1-0` | Desktop `1-10` | Switch to Desktop N |
| `Super` + `Shift` + `1-0` | Move to Desktop | Send window to Desktop N |
| `Super` + `Tab` / `` ` `` | Desktop `last` | Switch to last used desktop/node |
| `Super` + `Alt` + `← ↓ ↑ →` | Resize outward | Expand window size |
| `Super` + `Alt` + `Shift` + `← ↓ ↑ →` | Resize inward | Contract window size |
| `Super` + `Ctrl` + `← ↓ ↑ →` | Move floating | Move floating window position |

---

### Media & Volume Controls

| Keybinding | Command | Description |
| :--- | :--- | :--- |
| `XF86AudioRaiseVolume` | `pactl set-sink-volume +1%` | Volume Up (+1%) |
| `XF86AudioLowerVolume` | `pactl set-sink-volume -1%` | Volume Down (-1%) |
| `XF86AudioMute` | `pactl set-sink-mute toggle` | Mute / Unmute Audio |
| `XF86AudioNext` | `playerctl next` | Next Track |
| `XF86AudioPrev` | `playerctl previous` | Previous Track |
| `XF86AudioPlay` | `playerctl play-pause` | Play / Pause |
