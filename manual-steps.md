# Manual Steps

A couple of manual steps to perform on a new computer.

## Node.js

Install the latest Node.js version and Tree-sitter CLI:

```bash
n lts
npm install -g tree-sitter-cli
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

## Browser

Install extensions:

* Bitwarden.
* News Feed Eradicator.
* Unhook.
* Zotero Connector.

Create browser apps for:

* Gmail.
* Google Calendar.

Create shortcuts:

* GitHub: `:gh` - <https://github.com/search?q=%s&ref=opensearch&type=repositories>
* Google Translate: `:t` - <https://translate.google.com/?source=osdd&sl=auto&tl=auto&text=%s&op=translate>
* NixOS: `:nix` - <https://search.nixos.org/packages?query=%s>
* Wikipedia: `:w` - <https://en.wikipedia.org/w/index.php?title=Special:Search&search=%s>

## Obsidian

Install Obsidian plugins:

* Kanban.
* Reminder.
* Relativenumber (relative line numbers).
* Obsidian_to_Anki.

## IntelliJ IDEA

Install IntelliJ IDEA if needed and enable plugins:

* Archive Browser.
* Bazel.
* HarpoonIJ.
* IdeaVim.
* Makefile Language.
* Scala.

Update the preferences:

* Editor -> General -> On Save -> Check "Remove trailing spaces on All lines",
  "Keep trailing spaces on caret line", "Remove trailing blank lines at the end
  of saved files", and "Ensure every saved file ends with a line break".
* Editor -> General -> Appearance -> Uncheck "Caret blinking".
* Editor -> General -> Console -> Check "Use soft wraps in console".
* Editor -> General -> Editor Tabs -> Appearance -> Check "Mark modified (*)".
* Editor -> Font -> Change "Size" to 20.0.
* Editor -> Code Style -> Java -> Tabs and Indents -> Change "Tab size" and
  "Indent" to 2 as well as "Continuation indent" to 4.
* Editor -> Code Style -> Java -> Imports -> Change "Class count to use import
  with '\*'" and "Names count to use static import with '*'" to 100.
* Editor -> Inlay Hints -> Code vision -> Uncheck "Code author".

## Neovim

Install using Mason:

* DAP:
    * js-debug-adapter.
* Linter:
    * cspell.
    * shellcheck.
    * yamllint.

## macOS

### Finder

#### Preferences

* General -> Next to "New Finder windows show" select "justinasp".
* Sidebar -> Leave only the following checkboxes checked:
    * Applications.
    * Desktop.
    * Documents.
    * Downloads.
    * justinasp.
    * All checkboxes under "Locations".

#### View Options

* Go to any folder.
* View -> Show View Options:
    * Group By -> None.
    * Sort By -> Name.
    * Use as Defaults.

### System Settings

#### Accessibility

* Display -> Check "Reduce motion".

#### Desktop & Dock

* Windows & Apps -> Uncheck "Close windows when quitting an application".
* Menu Bar -> Next to "Recent documents, applications, and servers" select
  "None".

#### Displays

* Night Shift -> Set a custom schedule.

#### General

* Airdrop & Handoff -> Uncheck "Allow Handoff between this Mac and your iCloud
  devices".

#### Keyboard

* Dictation -> Select "Off".
* Create 9 spaces with Ctrl + Up Arrow -> Clicking "+" Button. Then, Keyboard
  Shortcuts -> Mission Control -> Mission Control:
    * Select From "Switch to Desktop 1" up to "Switch to Desktop 9".

#### Lock Screen

* Next to "Require password immediately after screen saver
  begins or display is turned off" choose "Immediately".

#### Siri & Spotlight

Uncheck:

* Bookmarks & History.
* Calculator.
* Contacts.
* Events & Reminders.
* Fonts.
* Mail & Messages.
* Siri Suggestions.

#### Sound

* Sound Effects -> Uncheck "Play sound on startup" and "Play user interface
  sound effects".

#### Trackpad

* More Gestures -> Uncheck "Notification Center".
