HOME directory configuration files.
More or less compatible with Home, Work and Phone (Termux) environments.
+ Simple tool for pull updates from repo.

# How to use

The *start* is in [.bash_profile](.bash_profile).
I love to have the ```.local/bin``` at the end of ```${PATH}``` to place custom executables in it.
Some say it is not secure. It is my life, who cares?

## You have to install depencies:
```
dnf install\
    cmatrix cowsay dmenu mpv openssh openssh-clients pmenu psmisc screen xterm
```
[//]: <> ( echo [ list ] | tr ' ' '\n' | sort -u | tr '\n' ' ' )

## My favorite /custom executables/
: [lsrs](.local/bin/lsrs) - LSRS is s cool script to use GNU Screen to manage remote systems, which cannot run GNU Screen.
The LSRS stands for: Local GNU Screen - Remote Shell.
The idea is: instead of running OpenSSH client and executing GNU Screen's instance on the remote side:
  - Run new GNU Screen's instance locally and make new separate OpenSSH client connection for every new window;
  - Redefine common [tools](.local/etc/lsrs.d) to LSRS format;
  - If ```Ctrl+a : screen command``` instead of running command on GNU Screen's side (local), wrap it and get remote results to the local;
  - Watch [ssh-EXAMPLE](.local/etc/menu.d/items-avalible/ssh-EXAMPLE) for how-to-use.
: [darkside](.local/bin/darkside) - is my portable network music player:
  - Help: ```darkside --help```;
: [menu](.local/bin/menu) - the description is below, it is originally created for the _tabber_;
: *TODO*: add more.

# Wonderful invention #1 XTerm + GNU Screen

I adore XTerm. XTerm is perfect Terminal emulator. Thank you, [Thomas Dickey](https://invisible-island.net/) for your work.
: [.Xresources](.Xresources) contains configuration for X apps, in my case mostly for XTerm;
: [XTerm.sh](.local/bin/XTerm.sh) may be the only link on your panel, desktop, etc. It starts XTerm, who needs more?;
: Before starting XTerm, XTerm.sh is sourcing [ssh-agent-call](.local/etc/ssh-agent-call) to check if ssh-agent is running;
: Finally Xterm.sh executes XTerm with GNU Screen _tabber_:
  - yes it re-defines the shell to the [menu](.local/bin/menu) program ```-s menu```;
  - and uses some GNU Screen's magic to reconnect to existing session or create new one.

I adore [GNU Screen](https://www.gnu.org/software/screen/) and [The GNU Project](https://www.gnu.org/software/screen/).
They really changed my life.
/Who knows what would our world be without Richard Stallman's ideas?/
: Usually i run shell in GNU Screen, and GNU Screen in .. Another GNU Screen. And eventually I use top 3rd level GNU Screen instance to *rule them all*;
: XTerm starts GNU Screen _tabber_ with [.screenrc-tabber](.screenrc-tabber) config file:
  - it is responsible for "tabs". Eg: top level window manager for XTerm. Every "tab" is usually another with GNU Screen running (if local "tab") or OpenSSH client connection with GNU Screen running on remote;
  - it have special (non-default) ecape sequence: ```escape ^Bb```. So, to change the "tab" you are to use Ctrl+b instead of the default;
  - it is also responsible for the bell, hardstatus, blankerprg and other communications with XTerm.
  - it uses [menu](.local/bin/menu) instead of the shell, so instead of running shell in the new window (```Ctrl+b Ctrl+c```), it will run ```menu``` in new window;

[Menu](.local/bin/menu) is a script to manage some elements:
: Restore current SHELL to user's default shell;
: Self-configure, receive user's selection and execute the element selected:
  - Actually /menu/ uses some [directory](.local/etc/menu.d/tabber-enabled/) to list executables (or symboluc links to executables) from;
  - [Dmenu](https://tools.suckless.org/dmenu/) or [pmenu](https://github.com/sgtpep/pmenu) as a selector tool;
  - And just executes the first element selected by selector;
: Of Course, menu set's GNU Screen's window title right and pretty to the name of the executed element;
: +1 lifehack. There is a symbolic link [.local/bin/m](.local/bin/m) > [.local/bin/menu](.local/bin/menu). I use short verion just to run menu from the shell or *actually* from the local GNU Screen *tab* with ```Ctrl+a : screen m``` command.

[Menu elements](.local/etc/menu.d/) are organised in Debin-style:
: [Items-avalible](.local/etc/menu.d/items-avalible/) contains all elements;
: Another dirs contains subsets;
: Just change MENU_P (menu path) variable for /menu/ to get the subset:
  - Eg: [tabber-enabled](.local/etc/menu.d/tabber-enabled/) for the _tabber_ ;
: My favorite /menu/ elements:
  - *TODO* write about them;
  - *TODO* rethink ssh-* elements before publishing them;
  - Rethink about [ssh-EXAMPLE](.local/etc/menu.d/items-avalible/ssh-EXAMPLE) .

# Wonderful invention #2 OpenSSH client + menu
I really love [OpenSSH](https://www.openssh.com/).
It is really good, that [OpenBSD](https://www.openbsd.org/) made it free.
Some would say it is simple, I'd say it is really not simple.
I have changed my mind while reading manpages for:
 ```ssh```, ```ssh_config```, ```scp```, ```sftp```, ```ssh-add```,
```ssh-keysign```, ```ssh-keyscan```, ```ssh-keygen```, ```sshd```,
```sshd_config```, ```sftp-server```, and ```ssh-agent```.
You can unterstand a lot about Computer Science just while reading some manpages, please do. It is very interesting and helpful.
