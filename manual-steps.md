# Manual Steps

A couple of manual steps to perform on a new computer.

## Dotfiles

Clone the dotfiles repository and run the installation script.

## Yarn

If needed, install Yarn with `npm install --global yarn`.

## Terminal

- View -> Hide Marks.
- Preferences -> Profiles:
  - Keyboard -> Check “Use Option as Meta key”.
  - Advanced -> Uncheck “Audible Bell”.
  - Advanced -> Uncheck “Working directory or document”, “Arguments”, “Active process name”, and “Dimensions”.
  - Text -> Copy color scheme from VS Code.

## VS Code

For VSCodeVim, execute the following:

```bash
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
```

## Finder

### Preferences

- General -> Next to “New Finder windows show” select “justinas”.
- Sidebar -> Leave only the following checkboxes checked:
  - Applications.
  - Desktop.
  - Documents.
  - justinas.
  - All checkboxes under “Locations”.
- Advanced:
  - Check “Show all filename extensions”, “Remove items from the Trash after 30 days”, and “In windows when sorting by name”.
  - Next to “When performing a search” select “Search the Current Folder”.

### View Options

- Go to any folder.
- View -> Show Path Bar.
- View -> Show View Options:
  - Group By -> Name.
  - Sort By -> Snap to Grid.
  - Use as Defaults.

## System Preferences

### General

- Select “Jump to the spot that’s clicked”.
- Uncheck “Close windows when quitting an app”.
- Next to “Recent items” select “None”.
- Uncheck “Allow Handoff between this Mac and your iCloud devices”.

### Desktop & Screen Saver

- Change your wallpaper.
- Screen Saver -> Next to “Start after” select “Never”.

### Dock

- Uncheck “Animate opening applications”.
- Check “Automatically hide and show the Dock”.

### Mission Control

- Next to “Dashboard” select “Off”.

### Language & Region

- Next to “Region” select “United States”.
- Check “24-Hour Time”.

### Security & Privacy

- Make sure that “Require password immediately after sleep or screen saver begins” is chosen.
- Firewall -> Turn On Firewall.

### Spotlight

Uncheck:

- Bookmarks & History.
- Calculator.
- Contacts.
- Events & Reminders.
- Fonts.
- Mail & Messages.
- Spotlight Suggestions.
- Allow Spotlight Suggestions in Look up.

### Displays

- Night Shift -> Set a custom schedule.

### Energy Saver

- Battery -> Uncheck “Enable Power Nap while on battery power”.
- Power Adapter -> Uncheck “Put hard disks to sleep when possible”.

### Keyboard

- Shortcuts:
  - Mission Control -> Uncheck “Show Dashboard”.
  - Input Sources -> Check “Select next source in Input menu”.
  - At the bottom select “All controls”.
- Dictation -> Next to “Shortcut” select “Off”.

### Trackpad

- Point & Click
  - Check “Tap to click”.
  - Move the “Click” slider at “Light”.
- More Gestures -> Uncheck “Notification Center”.

### Sound

- Sound Effects -> Uncheck “Play user interface sound effects”.
