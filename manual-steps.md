# Manual Steps

A couple of manual steps to perform on a new computer.

## makewhatis

If it's needed to search the names and descriptions of some manual pages available on macOS but which are not indexed for searching with Nix-installed `man`, e.g., for `man -k printf` and similar searches to work, run `makewhatis`:

```bash
sudo /usr/libexec/makewhatis /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/share/man/
```

This generates a `whatis` file in `/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/share/man` directory.

## Node.js

Install the latest Node.js version:

```bash
fnm install --lts
```

## Scala

If needed, install Scala 2.12.20 using [coursier](https://get-coursier.io/):

```bash
cs install scala:2.12.20 scalac:2.12.20
```

To see installed applications:

```bash
cs list
```

## Bitwarden

* Settings -> Security:
    * Unlock with Touch ID
    * Ask for Touch ID on app start

* Settings -> App settings (all accounts):
    * Show menu bar icon
    * Minimize to menu bar
    * Close to menu bar
    * Start automatically on login
    * Allow browser integration

## Browser

Install extensions:

* Bitwarden
* News Feed Eradicator
* Obsidian Web Clipper
* Unhook
* React Developer Tools

Create browser apps for:

* Gmail
* Google Calendar

Create shortcuts:

* GitHub: `:gh` - <https://github.com/search?q=%s&ref=opensearch&type=repositories>
* Google Translate: `:t` - <https://translate.google.com/?source=osdd&sl=auto&tl=auto&text=%s&op=translate>
* NixOS: `:nix` - <https://search.nixos.org/packages?query=%s>
* Python: `:py` - <https://docs.python.org/3/search.html?q=%s>
* Wikipedia: `:w` - <https://en.wikipedia.org/w/index.php?title=Special:Search&search=%s>

* Bitwarden extension:
    * Settings -> Account security:
        * Unlock with biometrics
        * Ask for biometrics on launch
    * Manage Extension
        * Allow in Private
        * Allow access to file URLs

## Obsidian

Install Obsidian plugins:

* Kanban
* Reminder
* Relativenumber (relative line numbers)

## IntelliJ IDEA

Install IntelliJ IDEA if needed and enable plugins:

* Archive Browser
* Bazel
* HarpoonIJ
* IdeaVim
* Makefile Language
* Scala

Update the preferences:

* Editor -> General -> On Save -> Check "Remove trailing spaces on All lines",
  "Keep trailing spaces on caret line", "Remove trailing blank lines at the end
  of saved files", and "Ensure every saved file ends with a line break"
* Editor -> General -> Appearance -> Uncheck "Caret blinking"
* Editor -> General -> Console -> Check "Use soft wraps in console"
* Editor -> General -> Editor Tabs -> Appearance -> Check "Mark modified (*)"
* Editor -> Font -> Change "Size" to 20.0
* Editor -> Code Style -> Java -> Tabs and Indents -> Change "Tab size" and
  "Indent" to 2 as well as "Continuation indent" to 4
* Editor -> Code Style -> Java -> Imports -> Change "Class count to use import
  with '\*'" and "Names count to use static import with '*'" to 100
* Editor -> Inlay Hints -> Code vision -> Uncheck "Code author"

## macOS

### Finder

#### Preferences

* Sidebar -> Leave only the following checkboxes checked:
    * Applications
    * Desktop
    * Documents
    * Downloads
    * All checkboxes under "Locations" except "iCloud Drive", "Cloud Storage",
      and the hostname of the computer

#### View Options

* Go to any folder
* View -> Show View Options:
    * Group By -> None
    * Sort By -> Name
    * Use as Defaults

### System Settings

#### Battery

* Charging:
    * Charge Limit -> 80%
    * Optimized Battery Charging turned off

#### Displays

* Night Shift -> Set a custom schedule

#### General

* Airdrop & Continuity -> Uncheck "Allow Handoff between this Mac and your
  iCloud devices"

#### Keyboard

* Dictation -> Select "Off"
* Create 9 spaces with Ctrl + Up Arrow -> Clicking "+" Button. Then, Keyboard
  Shortcuts -> Mission Control -> Mission Control:
    * Select From "Switch to Desktop 1" up to "Switch to Desktop 9"

#### Menu Bar

* Next to "Recent documents, applications, and servers" select "None"

#### Privacy & Security

* Full Disk Access granted for the terminal. This is required to be able to set
  some settings via nix-darwin. Note that logging out and back again may be
  required.

#### Spotlight

Uncheck:

* Help Apple Improve Search
* Calendar
* Contacts
* Mail
* Notes
* Reminders
