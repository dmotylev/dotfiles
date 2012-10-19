[ $# -ne 1 ] && return
[ "$(uname)" != "Darwin" ] && return

log_dotfiles "${CL_ERROR}Install LaunchAgents..."

mkdir -p ~/Library/LaunchAgents
for f in $(ls $1/LaunchAgents/*.plist); do
	agent=$(basename $f .plist)
	launchctl unload -w ~/Library/LaunchAgents/$agent.plist
	cp $f ~/Library/LaunchAgents/
	launchctl load -w ~/Library/LaunchAgents/$agent.plist
done