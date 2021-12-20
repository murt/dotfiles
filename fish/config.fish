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

# Prompt
set -gx STARSHIP_CONFIG $XDG_CONFIG_HOME/fish/starship.toml
starship init fish | source