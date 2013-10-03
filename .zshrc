#
# Executes commands at the start of an interactive session.
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

################################################################################
# programming virtual environments & version managers
################################################################################

# nvm (Node.js)
source $HOME/.nvm/nvm.sh
