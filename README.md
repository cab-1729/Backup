# Backup

This is a simple script that backups my files on [_Manjaro_](manjaro.org).
I'm new to scripting and Linux in general, so this also serves the purpose of getting my feet wet in bash.

I am using [_GoFile_](gofile.io) to store my backups. Yes, storing stuff online is a privacy issue, but there isn't much personal information to collect from standard Linux binaries.

The script uses the [gofile api](gofile.io/api).

## Why not use Timeshift?
+ Why use a bloated gui with hundreds of lines of Vala when the job can be done with 55 lines of bash?
+ It uses a separate drive! I'm not rich enough for that sort of stuff. I am not going to do partitions either, it's a waste of space.
+ I'm new to Linux, but the OS does seem to expect a more DIY attitude among its users, which I like.
+ A bash script means I know what's happening which makes it more adaptable.

## Why use GoFile?
+ It has free online storage.
+ It has a nice api.
+ It's stupid simple.

### Note

The shell script almost certainly isn't distro agnostic, although I am not sure. The whole point of this was to write my own solution myself. I encourage others to do the same. The script is so dead simple that anyone can handle it.
