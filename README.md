# Menu 11 Next — Win11 fork (rounded floating menu)

Fork of [Eisteed/menu-11-next](https://github.com/Eisteed/menu-11-next) v1.3
(lineage: [adhec/OnzeMenuKDE](https://github.com/adhec/OnzeMenuKDE) → Eisteed → this fork),
kept under the same plugin Id `menu.11.next` so installing/upgrading your version
replaces the stock install **without re-adding or re-configuring the widget**.

## Why this fork exists

When the start menu docks flush against the panel, Plasma disables the frame
border on the attached edge, so the popup gets sharp square bottom corners —
regardless of theme. This fork fixes the widget's **"Center" menu position** so
it opens **floating just above the taskbar, horizontally centered**. A floating
dialog keeps all four frame borders enabled, so with a rounded Plasma style
(e.g. [Win11OS-kde](https://github.com/yeyushengfan258/Win11OS-kde)) all four
corners render rounded — the proper Windows 11 start menu look.

Changes vs upstream v1.3:

- `contents/ui/MenuRepresentation.qml` — `popupPosition()` "Center" option now
  anchors above the taskbar instead of floating mid-screen.
- `install.sh` — install/upgrade straight from the source dir, no build step.
- Everything else is identical to upstream v1.3.

## Recommended setup for the Win11 look

1. `./install.sh`
2. Apply a rounded Plasma style (e.g. `plasma-apply-desktoptheme Win11OS-dark`)
3. Right-click the start button → *Configure Menu 11 Next…* → **Menu position: Center**
4. Optional: set the launcher icon to the Windows logo (ship
   `plasma/desktoptheme/<variant>/icons/start.svg` from Win11OS-kde as an icon
   named `win11os-start` and pick it in the widget's icon chooser).

## Roadmap ideas

- Open/close animations (slide-up + spring scale)
- Soft-translucent "acrylic" polish
- Configurable popup corner radius & shadow

## Install (no build required)

```bash
./install.sh
systemctl --user restart plasma-plasmashell   # if a widget instance is already on a panel
```

Uninstall:

```bash
kpackagetool6 --type Plasma/Applet --remove menu.11.next
```

License: GPL-2.0+ (inherited from upstream). Original upstream docs follow.

---

# Menu 11 Next

## Windows 11 menu launcher for KDE Plasma 6.5
Based on [menu 11 plasma6,](https://github.com/adhec/OnzeMenuKDE), with some tweaks & modifications to make it fully working with the most recent kde plasma.
Small design tweaks (moure rounded search bar, no blue underline, light gray background hover app select / buttons)


## Features
- Search bar auto select first result / press enter to start.
- Custom menu position
- Favorite / Pinned applications
- Recent documents
- View more recent document opens recentlyused:/files/
- Shutdown / Restart / Sleep / Lock on bottom right
- User profile / home folder / settings on bottom left

## Fixed
- Arrows UP & DOWN navigation in search results
- 0 width error on first start
- shutdown / restart buttons

## Installation

### Requirements
- KDE Plasma 6.5+
- `cmake`, `extra-cmake-modules`, `kpackagetool6`

### Method 1: Install via KDE Store (Recommended)
Search for **Menu 11 Next** in *System Settings → Get New Widgets*.

### Method 2: Manual Install from Source

```bash
# Clone the repository
git clone https://github.com/AlphaGlider25/Swin-11.git
cd Swin-11

# Install the widget
kpackagetool6 --install package/ --type Plasma/Applet
```

To update an existing install:

```bash
kpackagetool6 --upgrade package/ --type Plasma/Applet
```

### Method 3: Install via plasmapkg2 (older systems)

```bash
plasmapkg2 --install package/ --type Plasma/Applet
```

### After Installing
1. Right-click your taskbar → *Add Widgets*
2. Search for **Menu 11 Next**
3. Drag it onto your panel

### Uninstall

```bash
kpackagetool6 --remove com.github.alphglider25.menu11next --type Plasma/Applet
```

---

## Screenshot
![Screenshot 1](https://eisteed.com/linux/menu-11-next/Win11-Next-Demo1.png)

![Screenshot 2](https://eisteed.com/linux/menu-11-next/Win11-Next-Demo2.png)
