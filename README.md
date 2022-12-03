vdrcm
=====

VDR Config Manager - interactive console dialogs script for managing VDR configuration files


For VDR versions close to 2.2.0 and newer, supporting config files placed in the ARGSDIR directory.
The pool of config files for VDR itself and one for each plugin instance are expected to be situated
under /etc/vdr/conf.avail, then vdrcm will soft-link them to /etc/vdr/conf.d.


<b>Runtime dependencies:</b>

- which
- coreutils
- util-linux (for 'rev')
- grep
- pkg-config (is optional, but if not present, argsdir has to be read from ~/.vdrcm, see below)
- For interactively displaying dialogues in the text console, 'dialog' or 'whiptail' (the latter from the
package "newt") is required. If the interactive mode is not used, they are not needed for the
command-line mode.


<b>Installation:</b>

Run
<pre>prefix="/usr" make install</pre>


<b>Runtime requirements:</b>

vdrcm will read ARGSDIR from pkgconfig if VDR is installed with a package manager which also installs the
pkgcfg file. Alternatively, if there is no pkg-config binary on the system, ARGSDIR will be read from the
user's home which administers the VDR plugin configs, from ~/.vdrcm, which can be created like this:

<pre>echo "argsdir=/etc/vdr/conf.d" > ~/.vdrcm</pre>

The script can be used in interactive mode, for enabling/disabling available plugins, changing their order,
edit them. A visual usage summary can be seen in the [Wiki](https://github.com/lucianm/vdrcm/wiki/Short-visual-usage-summary).

At start, the script checks if ARGSDIR exists, and if not, it will create it, chown it to the vdr:vdr
user and symlink the vdr.conf from the mentioned pool directory of available configurations (/etc/vdr/conf.avail).

<b>Command-line parameters:</b>

Enabling a plugin, by its name:
<pre>vdrcm --enable PLUGIN-NAME</pre>

Disabling a plugin, by its name:
<pre>vdrcm --disable PLUGIN-NAME</pre>

Inserting a already enabled plugin before another enabled one, by its index:
<pre>vdrcm --insert-before PLUGIN-INDEX-SRC PLUGIN-INDEX-DST</pre>

Displaying a brief usage help:
<pre>vdrcm --help</pre>

Displaying the script version:
<pre>vdrcm --version</pre>


<b>License:</b>
GPL-2, see supplied [license file](https://github.com/lucianm/vdrcm/raw/master/LICENSE).


Lucian Muresan, 2022.12.04
