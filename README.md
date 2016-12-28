

# rp-video-manager

Video Manager tool by Floob

www.smartretro.co.uk/forums

Tool to quickly update video modes in RetroPie. This will swap between default, shaders and overlays. Designed to emulate a CRT experience on a hi-def TV.

Supports RetroPie 3 and above. I would suggest using at least RetroPie 3.8.1. And it WILL overwrite any custom edits you may have made to system specific retroarch.cfg files. BACKUP before you use this!!

Example of the changes this makes here:
https://www.youtube.com/watch?v=SCqQ7ciCHcI

https://www.youtube.com/watch?v=wf7M0iOLcrk

Installation
============

You can find the release numbers here:
https://github.com/biscuits99/rp-video-manager/releases

```
wget https://github.com/biscuits99/rp-video-manager/releases/download/{release-number}/rp-video-manager.zip
unzip -o rp-video-manager.zip
rm rp-video-manager.zip
cd /home/pi/rp-video-manager
chmod 755 videomanager.sh
./videomanager.sh
```

Uninstall
==========
Make sure your video settings are as you want them, then delete the rp-video-manager directory.

You can use the "rm -rf rp-video-manager" command
