# No greeting
set fish_greeting

# XDG Spec
set -gx XDG_CONFIG_HOME $HOME/.config
set -gx XDG_DATA_HOME $HOME/.local/share

# Environment variables
set -gx DOTNET_CLI_TELEMETRY_OPTOUT 1

# Vi Mode (this breaks keybindings for things like !!)
fish_vi_key_bindings

# Fisher (Automatic Install)
if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME $HOME/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

# ASDF
source $HOME/.asdf/asdf.fish

# Rustup
set -Ua fish_user_paths $HOME/.cargo/bin

# Prompt
set -gx STARSHIP_CONFIG $XDG_CONFIG_HOME/fish/starship.toml
starship init fish | source
