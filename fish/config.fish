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
set -x PATH $HOME/.cargo/bin $PATH
set -x PATH $HOME/.pub-cache/bin $PATH

function fish_greeting
    # fastfetch --logo ~/.config/fish/ascii.txt
    starship init fish | source
    #alias ls='exa -b --grid --icons -F -H --group-directories-first --git -1'
    alias ls='exa -b  --long --grid --icons --git'
    alias ta='tmux a -t'
    alias tl='tmux ls'
    fnm env --use-on-cd --shell fish | source
    end



set -gx PATH /usr/pgsql-17/bin $PATH

export TERM=xterm-256color

# pnpm
set -gx PNPM_HOME "/home/owbird/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
set -gx PATH /opt/android-studio/bin $PATH
