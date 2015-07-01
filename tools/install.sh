set -e

if [ ! -n "$DOTFILES" ];
then
  DOTFILES=~/.dotfiles_public
fi

# Check for dotfiles
if [ -d "$DOTFILES" ];
then
  echo "\033[0;33mYou already have dotfiles installed.\033[0m\n - You'll need to remove $DOTFILES if you want to install"
  exit
fi

# Clone the dotfiles
echo "\033[0;32mCloning dotfiles...\033[0m"
hash git >/dev/null 2>&1 && env git clone --quiet --depth=1 https://github.com/burnsra/dotfiles_public.git $DOTFILES || {
  echo "git not installed"
  exit
}
echo "\033[0;32m   ...complete\033[0m\n"

# Check for Homebrew
echo "\033[0;32mChecking for Homebrew...\033[0m"
if test ! $(which brew)
then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
echo "\033[0;32m   ...complete\033[0m\n"

# Install brews
echo "\033[0;32mInstalling brews...\033[0m"
brew tap caskroom/fonts
brew install caskroom/cask/brew-cask coreutils git grc hub zsh
brew cask install atom font-source-code-pro
echo "\033[0;32m   ...complete\033[0m\n"

# Banner
echo "\033[0;32m"'       __      __  _____ __         '"\033[0m"
echo "\033[0;32m"'  ____/ /___  / /_/ __(_) /__  _____'"\033[0m"
echo "\033[0;32m"' / __  / __ \/ __/ /_/ / / _ \/ ___/'"\033[0m"
echo "\033[0;32m"'/ /_/ / /_/ / /_/ __/ / /  __(__  ) '"\033[0m"
echo "\033[0;32m"'\__,_/\____/\__/_/ /_/_/\___/____/ ....are now installed!'"\033[0m"
echo "\n"
