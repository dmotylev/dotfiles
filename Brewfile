# based on https://github.com/mathiasbynens/dotfiles/blob/master/Brewfile
#
# Install command-line tools using Homebrew
# Usage: `sed -e 's/#.*$//' -e '/^$/d' Brewfile | while read cmd; do brew "$cmd"; done`

# Make sure we’re using the latest Homebrew
update

# Upgrade any already-installed formulae
upgrade

# Install GNU core utilities (those that come with OS X are outdated)
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
install coreutils
#sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Install some other useful utilities like `sponge`
install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed
install findutils
# Install GNU `sed`, overwriting the built-in `sed`
install gnu-sed --default-names
# Install Bash 4
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before running `chsh`.
install bash
install bash-completion

# Install wget with IRI support
install wget --with-iri

# Install more recent versions of some OS X tools
install vim --override-system-vi
install homebrew/dupes/grep
install homebrew/dupes/screen

# Install other useful binaries
install go
install gnupg
install oath-toolkit
install ag
install tmux
install git
install hub
install ec2-api-tools
install ansible
install gist

# Remove outdated versions from the cellar
cleanup
