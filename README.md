salcode-git-settings
====================

Requirements
------------

This code is based on the version of Git available at [http://git-scm.com/](http://git-scm.com/)  
**Not** the Xcode version
[Download Git](http://git-scm.com/downloads)

This code is for my Mac.  Maybe it will work on your setup, as well. No promises.

Features
--------
* Git path changed to use downloaded non-Xcode version
* Git tab completion
* Git status in command prompt

Installation
------------
* Copy `/salcode-git-settings` directory to home directory (or clone this repo in your home directory)
* Add the line `source  ~/salcode-git-settings/bash_profile-mods.bash` to 
your `.bash_profile` - this can be done with the following line from the command line  
`echo 'source  ~/salcode-git-settings/bash_profile-mods.bash' >> ~/.bash_profile`
* These changes will be applied after your next restart, you can apply them now with
the following from the command line
`source ~/salcode-git-settings/bash_profile-mods.bash`

Changelog
------------
20140219 - moved required scripts git-completion.bash and git-prompt.sh into this repo
