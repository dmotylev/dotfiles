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
install gnu-sed --with-default-names
# Install Bash 4
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before running `chsh`.
install bash
install bash-completion

# Install wget with IRI support
install libidn
install wget --with-iri

# Install more recent versions of some OS X tools
install macvim --override-system-vim --with-python3
install homebrew/dupes/grep

# Install other useful binaries
install go --cross-compile-common
install gnupg
install oath-toolkit
install ag
install tmux --HEAD
install git
install ansible
install gist
install reattach-to-user-namespace ---with-wrap-pbcopy-and-pbpaste
install ruby
install npm
install jq
install ctags
install imagesnap
install libopendkim
install entr
install cmake

# Remove outdated versions from the cellar
cleanup
