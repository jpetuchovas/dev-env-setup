# Manual Steps

A couple of manual steps to perform on a new computer.

## Dotfiles

Clone the dotfiles repository and run the installation script.

## Node

### n

Install [n](https://github.com/tj/n) with [n-install](http://git.io/n-install-repo).

### Yarn

If needed, install Yarn with `npm install -g yarn`.

### WebSocket

If needed, install `wscat` with `npm install -g wscat`.

## Scala

If needed, install Scala using [coursier](https://get-coursier.io/):

```shell
cs setup
```

## Vim

Install [vim-plug](https://github.com/junegunn/vim-plug). Run `:PlugInstall` in
Vim to install Vim plugins.

## Obsidian

Install Obsidian plugins:

* Excalidraw.
* Kanban.
* Obsidian_to_Anki.
* Relative Line Numbers.

## IntelliJ IDEA

Install IntelliJ IDEA if needed and enable plugins:

* Archive Browser.
* Bazel.
* IdeaVim.
* Makefile Language.
* Protocol Buffers.
* Scala.
* VSCode Keymap.

Update the preferences:

* Editor -> General -> On Save -> Check "Remove trailing spaces on All lines",
  "Remove trailing blank lines at the end of saved files", and "Ensure every
  saved file ends with a line break".
* Editor -> General -> Appearance -> Uncheck "Caret blinking".
* Editor -> General -> Console -> Check "Use soft wraps in console".
* Editor -> General -> Editor Tabs -> Appearance -> Check "Mark modified (*)".
* Editor -> Code Style -> Java -> Tabs and Indents -> Change "Tab size" and
  "Indent" to 2 as well as "Continuation indent" to 4.
* Editor -> Code Style -> Scala -> Scalafmt -> Check "Reformat on file save".
* Tools -> Actions on Save -> Check "Reformat code" for Java and Scala.

## Terminal

* View -> Hide Marks.
* Preferences -> Profiles:
    * Keyboard -> Check "Use Option as Meta key".
    * Advanced -> Uncheck "Audible Bell".
    * Window -> Uncheck "Working directory or document", "Arguments",
      "Active process name", and "Dimensions".
    * Text -> Copy color scheme from VS Code.
    * Text -> Font -> "Change..." -> Change font size.

## Finder

### Preferences

* General -> Next to "New Finder windows show" select "justinas".
* Sidebar -> Leave only the following checkboxes checked:
    * Applications.
    * Desktop.
    * Documents.
    * justinas.
    * All checkboxes under "Locations".
* Advanced:
    * Check "Show all filename extensions", "Remove items from the Trash after
      30 days", and "In windows when sorting by name".
    * Next to "When performing a search" select "Search the Current Folder".

### View Options

* Go to any folder.
* View -> Show Path Bar.
* View -> Show View Options:
    * Group By -> Name.
    * Sort By -> Snap to Grid.
    * Use as Defaults.

## System Preferences

### General

* Select "Jump to the spot that’s clicked".
* Uncheck "Close windows when quitting an app".
* Next to "Recent items" select "None".
* Uncheck "Allow Handoff between this Mac and your iCloud devices".

### Desktop & Screen Saver

* Change your wallpaper.
* Screen Saver -> Next to "Start after" select "Never".

### Dock

* Check "Automatically hide and show the Dock".
* Uncheck "Animate opening applications".
* Uncheck "Show recent applications in Dock".

### Mission Control

* Next to "Dashboard" select "Off".

### Language & Region

* Next to "Region" select "United States".
* Check "24-Hour Time".

### Security & Privacy

* Make sure that "Require password immediately after sleep or screen saver
  begins" is chosen.
* Firewall -> Turn On Firewall.

### Spotlight

Uncheck:

* Bookmarks & History.
* Calculator.
* Contacts.
* Events & Reminders.
* Fonts.
* Mail & Messages.
* Siri Suggestions.

### Displays

* Night Shift -> Set a custom schedule.

### Energy Saver

* Battery -> Uncheck "Enable Power Nap while on battery power".
* Power Adapter -> Uncheck "Put hard disks to sleep when possible".

### Keyboard

* Keyboard:
    * Increase "Key Repeat" and "Delay Until Repeat" to max values.
    * Check "Use F1, F2, etc. keys as standard function keys".
    * Modifier Keys: Remap Caps Lock to Control.
* Shortcuts:
    * Input Sources -> Uncheck "Select the previous input source"
* Dictation -> Next to "Shortcut" select "Off".

### Trackpad

* Point & Click
    * Check "Tap to click".
    * Move the "Click" slider at "Light".
* More Gestures -> Uncheck "Notification Center".

### Sound

* Sound Effects -> Uncheck "Play sound on startup" and "Play user interface sound
  effects".
