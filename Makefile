DEBUG	=/bin/echo

all:

install: shutdown.sh /sbin/shutdown
	[ ! -f /sbin/.shutdown ] || (/bin/echo "Already installed." >&2; exit 2)
	${DEBUG} /bin/ln /sbin/shutdown /sbin/.shutdown
	${DEBUG} /bin/rm -f /sbin/shutdown
	${DEBUG} /usr/bin/install -c -m 0655 shutdown.sh /sbin/shutdown

uninstall: /sbin/.shutdown
	${DEBUG} /bin/mv -f /sbin/.shutdown /sbin/shutdown
