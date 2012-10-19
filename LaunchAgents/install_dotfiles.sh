[ $# -ne 1 ] && return
[ "$(uname)" != "Darwin" ] && return

echo Install LaunchAgents...

mkdir -p ~/Library/LaunchAgents
for f in $(ls $1/LaunchAgents/*.plist); do
	agent=$(basename $f .plist)
	launchctl unload -w ~/Library/LaunchAgents/$agent.plist
	cp $f ~/Library/LaunchAgents/
	launchctl load -w ~/Library/LaunchAgents/$agent.plist
done