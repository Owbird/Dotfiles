set -x PATH ~/Programs/flutter/bin/ $PATH
set -x PATH ~/Programs/misc/ $PATH
set -x PATH /usr/local/go/bin $PATH
set -x PATH ~/.local/bin $PATH
set -x PATH ~/go/bin $PATH
set -x PATH ~/Android/Sdk/platform-tools $PATH
set -x ANDROID_HOME ~/Android/Sdk
set -x FLYCTL_INSTALL ~/.fly
set -x PATH $FLYCTL_INSTALL/bin $PATH
set -x PATH ~/Workspace/bin $PATH
set -x PATH /opt/nvim-linux64/bin $PATH
set -x PATH ~/.bun/bin $PATH
set -x PATH ~/.local/share/fnm $PATH
set -x PATH ~/.local/share/pnpm $PATH

function fish_greeting
    fastfetch --logo ~/.config/fish/ascii.txt
    starship init fish | source
    #alias ls='exa -b --grid --icons -F -H --group-directories-first --git -1'
    alias ls='exa -b  --long --grid --icons --git'
	fnm env --use-on-cd --shell fish | source
    end
