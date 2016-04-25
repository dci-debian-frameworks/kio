#!/bin/sh
export LANG=C.UTF-8
export LC_ALL=C.UTF-8
openbox &
sleep 5
kdeinit5

# Workaround kcookiejar cache dir not being created and kded getting stuck.
# https://git.reviewboard.kde.org/r/127743/
[ -e $HOME/.local/share ] || mkdir -p $HOME/.local/share

dh_auto_test
ret=$?
kquitapp5 kded5
kdeinit5_shutdown
exit $ret
