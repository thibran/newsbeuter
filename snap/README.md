About the snap package format, how to install snaps
and if your Linux distribution is supported, take a look at [snapcraft.io](http://snapcraft.io).

Linux distribution to build & test the Newsbeuter snap: Ubuntu 17.04 dev


TODO
====

* What about the config `browser` setting, can it be supported or do we need to ship a CLI browser?
* What about the config `player` setting, can it be supported?
* Check if podbeuter works as expected.


Quick Snapcraft introduction
============================

[Snapcraft][1] is a tool to build .snap packages out of a snapcraft.yaml build recipe.

To build the Newsbeuter snap move into the snap/ directory and run `snapcraft`.

[1]: http://snapcraft.io/docs/reference/


Structure
---------

The snapcraft.yaml consist of tree sections:

* The head section, containing general informations like the app-name.
* The `apps` section, specifying runnable commands & needed app-permissions.
* The `parts` section, specifying independently build/executed actions.


Snap folders
------------

* `parts/`: Directory where every .yaml part entry is separately build.  
The result is copied to the install folder, e.g.: `parts/newsbeuter/install`
* `stage/`: Directory contains all files from all different-part-install
folders (all merged into one folder).  
This is the right folder to have a look at what will be
in the final snap package.
* `prime/`: Same as the `stage/` + files needed by the snappy package format.


Build cycle
-----------

A once build snap can be installed locally by executing:  
`sudo snap install newsbeuter_2.10_amd64.snap --dangerous`

To remove it (not needed, just install a new snap ontop of an old one):  
`sudo snap remove newsbeuter`

To rebuild the snap after it was once build, the snap build-directories have to be cleaned-up:  
`snapcraft clean && snapcraft`

When only a part of the snapcraft.yaml has been edited,
the repeatingly compiling of the project can be omitted  
by rebuilding only a single part, e.g.:  
`snapcraft clean launcher && snapcraft`
