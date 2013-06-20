# More extensive tab completion.
autoload -U compinit
compinit

# Tab completion from both ends.
setopt completeinword

# Case insensitize
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# Better completion for killall
# zstyle ':completion:*:killall:*' command 'ps -u $USER -o cmd'

# Colors for ls
if [[ -x "`whence -p dircolors`" ]]; then
	eval `dircolors`
	alias ls='ls -F --color=auto'
else
	alias ls='ls -F'
fi

# Shortcut for ls
alias l='ls -AGhl'

# Tree view! From CanadianPirate.
alias tree="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/ /' -e 's/-/|/'"

# Wait, you wanted Ruby 2.0? Well, just use rb instead of ruby.
alias rb='ruby2.0'

# Wait wait, you wanted the MacPorts gem which has 2.0 in the command?...
alias gem='gem2.0'

# Wait wait wait, you want to use py33-pip as `pip`? Fine. Be that way.
alias pip='pip-3.3'

# Vacuum the Mail.app database
alias vacuum_mail='sqlite3 ~/Library/Mail/V2/MailData/Envelope\ Index vacuum;'

# Duplicate "Open With..." entries? Let's rebuild LaunchServices catalog.
alias fixopenwith='/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister -kill -r -domain local -domain system -domain user'
# Yes, that's a very, very long command otherwise.

# Let's reboot into Windows, but make sure OS X starts next time.
alias startnt='sudo diskutil unmount /Volumes/Windows/ ; sudo bless --setBoot --nextonly --device /dev/disk0s4 ; sudo shutdown -r now'

# Enable extended globbing, such as "ls */.txt", "ls -d *(D)" (show all files including those starting with ".")
setopt extendedglob
unsetopt caseglob

# Allow comments in interactive prompt
setopt interactivecomments

# Type ".." instead of "cd ..", "/usr/include" instead of "cd /usr/include".
setopt auto_cd

# Nice prompt.
PS1="%T %~ 👾  "

# Prints CPU stats post-command if commands take longer than 10s.
REPORTTIME=10

# Bind Fn-Delete to forward-delete.
bindkey "[3~" delete-char

# Make sure MacPorts binaries work.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
