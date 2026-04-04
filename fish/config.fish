# No greeting
set fish_greeting

# XDG Spec
set -gx XDG_CONFIG_HOME $HOME/.config
set -gx XDG_DATA_HOME $HOME/.local/share
set -gx XDG_STATE_HOME $HOME/.local/state
set -gx XDG_CACHE_HOME $HOME/.cache

# Environment variables for various tools
set -gx DOTNET_CLI_TELEMETRY_OPTOUT 1
set -gx HF_HUB_DISABLE_TELEMETRY 1
set -gx CLAUDE_CODE_ENABLE_TELEMETRY 0
set -gx DISABLE_AUTOUPDATER 1
set -gx STORYBOOK_DISABLE_TELEMETRY 1
set -gx ALLURE_NO_ANALYTICS 1

# Theme - run this to set the theme
#fish_config theme save "Catppuccin Mocha"

# Vi Mode (this breaks keybindings for things like !!)
fish_vi_key_bindings

# Fisher
if not functions -q fisher
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

# Homebrew
if test -e /opt/homebrew/bin
    fish_add_path -a /opt/homebrew/bin
end

# Add local bin
fish_add_path -a $HOME/.local/bin

# Support for lsd if present
if type -q lsd
    alias ls="lsd"
end

# Additional system paths
fish_add_path -a /usr/local/sbin

# Rustup
fish_add_path -a $HOME/.cargo/bin

# Vendor binaries
fish_add_path -a $HOME/vendor/bin

# iTerm 2 (if applicable)
test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

# Java env vars
if test -e $(which javac) && test -e /usr/lib/jvm/default-java
    set -gx JAVA_HOME /usr/lib/jvm/default-java
end

# Prompt
set -gx STARSHIP_CONFIG $XDG_CONFIG_HOME/fish/starship.toml
starship init fish | source

# tabtab source for packages
[ -f {$XDG_CONFIG_HOME}/tabtab/fish/__tabtab.fish ]; and . {$XDG_CONFIG_HOME}/tabtab/fish/__tabtab.fish; or true

# pnpm
if type -q pnpm
    set -gx PNPM_HOME $XDG_DATA_HOME/pnpm
    if not string match -q -- $PNPM_HOME $PATH
        fish_add_path -a $PNPM_HOME
    end
end

# Support for local user file (never committed)
if test -e {$XDG_CONFIG_HOME}/fish/user.fish
    source $XDG_CONFIG_HOME/fish/user.fish
end

# Support GPG signing
set -gx GPG_TTY = (tty)


# Added by LM Studio CLI (lms)
set -gx PATH $PATH /Users/matt/.lmstudio/bin
# End of LM Studio CLI section

