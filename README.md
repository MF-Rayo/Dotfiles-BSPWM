## Dotfiles BSPWM

A fully customized BSPWM desktop environment and auto-installer designed for **Debian-based distributions running X11**. 

While specifically tailored and optimized for penetration testing distros like **Parrot OS** and **Kali Linux**, this setup can easily be adapted for any other Debian-based distribution running an X11 display server with minimal tweaks.

## Table of Contents

- [Install](#install)
- [Themes](#themes)
- [Bars](#bars)
- [Keybindings](#shortcuts)
- [Api Keys](#apikey)
- [Virtual Machine Setup](#tips)

---

## Credits & External Resources

This project integrates tools, configurations, and inspiration from several open-source repositories. Visit the original projects below to learn more about their setup and inner workings:

### Base Inspiration & Configurations
* **[gh0stzk/dotfiles](https://github.com/gh0stzk/dotfiles):** Primary inspiration for adapting the **Polybar** and **EWW** configurations, as well as the design architecture for the theme, wallpaper, and bar selectors.
* **[adi1090x/polybar-themes](https://github.com/adi1090x/polybar-themes):** Source for various Polybar layouts and theme designs.
* **[adi1090x/rofi](https://github.com/adi1090x/rofi):** Source for Rofi themes and menu styles.

---

### Core Tools & Dependencies
* **[polybar/polybar](https://github.com/polybar/polybar):** Fast and easy-to-use status bar.
* **[elkowar/eww](https://github.com/elkowar/eww):** ElKowar's Wacky Widgets for custom desktop popups and widgets.
* **[yshui/picom](https://github.com/yshui/picom):** X compositor for transparency, animations, and shadows.
* **[karlstav/cava](https://github.com/karlstav/cava):** Console-based Audio Visualizer for ALSA / PulseAudio / PipeWire.
* **[ujjwal96/xwinwrap](https://github.com/ujjwal96/xwinwrap):** Utility to allow applications/animated wallpapers as desktop backgrounds.
* **[Raymo111/i3lock-color](https://github.com/Raymo111/i3lock-color):** Feature-rich screen locker with customization support.
* **[vinceliuice/Qogir-icon-theme](https://github.com/vinceliuice/Qogir-icon-theme):** Modern icon theme for Linux desktops.
* **[romkatv/powerlevel10k](https://github.com/romkatv/powerlevel10k):** Fast and feature-packed Zsh theme (configured for both standard users and root).
* **[akinomyoga/ble.sh](https://github.com/akinomyoga/ble.sh):** Bash Line Editor for syntax highlighting and enhanced autocompletion.

---

<a name="install"></a>
## Installation & Setup

Clone the repository and run the automated installation script:

```bash
git clone https://github.com/MF-Rayo/Dotfiles-BSPWM.git
```

```bash
cd Dotfiles-BSPWM && chmod +x Installer.sh
```

```bash
./Installer.sh
```

---

<a name="themes"></a>
## Themes

Here are the built-in color schemes included in this configuration:

| :---: | :---: |
| **Nord** <br> <img width="100%" alt="Nord Theme" src="https://github.com/user-attachments/assets/3c526f3a-5b0c-4be7-83d1-3408e15701a7" /> |
| **Purple** <br> <img width="100%" alt="Purple Theme" src="https://github.com/user-attachments/assets/d4fcf6de-c3c5-4a17-8517-fe21928cc02d" /> |
| **Green** <br> <img width="100%" alt="Green Theme" src="https://github.com/user-attachments/assets/a6946ff2-e309-4b8a-87ad-ec7ee173f8ca" /> |
| **Yellow** <br> <img width="100%" alt="Yellow Theme" src="https://github.com/user-attachments/assets/b17c9ad7-a70b-457e-afc3-a6221ec01e36" /> |
| **Blue** <br> <img width="100%" alt="Blue Theme" src="https://github.com/user-attachments/assets/42464cae-4455-42b7-838e-f5596235c4d1" /> |
| **Red** <br> <img width="100%" alt="Red Theme" src="https://github.com/user-attachments/assets/c1b06c3e-1693-4c1f-a45a-8a9d8e7748c5" /> |
| **Black** <br> <img width="100%" alt="Black Theme" src="https://github.com/user-attachments/assets/6d361bcf-f106-48b6-9f56-18c10bff6a81" /> |
| **White** <br> <img width="100%" alt="White Theme" src="https://github.com/user-attachments/assets/c2efdb6a-1938-47f5-b197-a133fe735402" /> |
| **ZeroColor** <br> <img width="100%" alt="ZeroColor Theme" src="https://github.com/user-attachments/assets/2951f0da-cebc-4211-a539-756fbab0b81e" /> |

### Demo

<video width="100%" height="auto" src="https://github.com/user-attachments/assets/66e23de6-dd6f-401b-9d77-880d7111c642"></video>
---

<a name="bars"></a>
## Bars

This setup offers modular status bars powered by **Polybar** and **EWW (ElKowar's Wacky Widgets)** to display key system info, workspace indicators, and system metrics. 

Both configurations are highly customizable, allowing you to add, edit, or remove widgets according to your preferences.

---

### Polybar
Polybar handles the main top/bottom panel with multiple theme layouts.
* **Configuration Path:** `~/.config/polybar/themes/`
* **Selector:** Use `Super` + `Ctrl` + `p` to open the launcher and switch Polybar styles on the fly.

---

### EWW (ElKowar's Wacky Widgets)
EWW is used for modern, stand-alone widgets and custom desktop popups.
* **Configuration Path:** `~/.config/eww/`

---

<img width="1917" height="1078" alt="Image" src="https://github.com/user-attachments/assets/341c9286-78d1-40b5-bdb1-96552d52c35c" />

---

<a name="apikey"></a>
### API Keys Configuration (Optional)

To enable integration with **OpenWeather** (for weather widgets) and **Wallhaven** (for downloading wallpapers), you need to provide your own API keys.

1. **Get your free API keys:**
    
    - **OpenWeather API:** [openweathermap.org](https://openweathermap.org/)
        
    - **Wallhaven API:** [wallhaven.cc](https://wallhaven.cc)
        
2. **Edit your local configuration file:**
```bash
nvim ~/.config/theme/config.json
```

```json
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
---

<a name="shortcuts"></a>
# Keybindings & Shortcuts 
---

This guide lists all configured keybindings managed by `sxhkd` for **BSPWM** and system shortcuts.

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

----
<a name="tips"></a>
## Virtual Machine Setup

If you are running this environment inside a Virtual Machine, you may experience performance issues, graphical glitches, or lag with window animations. 

> [!NOTE]
> **Note for VMware users:** Go to **Virtual Machine Settings** ➔ **Display** ➔ Check **Accelerate 3D graphics** and increase the **Graphics Memory** slider.

<img width="986" height="422" alt="Image" src="https://github.com/user-attachments/assets/2717b6a1-8084-4a35-acd3-b52b150dc77b" />


### Enabling Battery Passthrough on Laptops (VMware Only)

If you are running VMware on a laptop, the guest OS may not detect your battery status by default (showing `No Battery` in Polybar or system widgets). 

To allow the Virtual Machine to read your host laptop's battery and AC adapter status, follow these steps:

1. **Power off** your Virtual Machine completely.
2. Locate and open your virtual machine's `.vmx` configuration file using a text editor (e.g., `Notepad` or `nano`).
3. Add the following lines at the end of the file:

```ini
batterymeter.enable = "TRUE"
acpi.present = "TRUE"
chipset.useAcpiBattery = "TRUE"
chipset.useApmBattery = "TRUE"
```

> [!NOTE]
> If you do not need audio input inside your VM, you can also disable the microphone completely by adding/editing these parameters in the .vmx file.

```ini
sound.startConnected = "FALSE"
sound.record.enable = "FALSE"
sound.record.autodetect = "FALSE"
```
