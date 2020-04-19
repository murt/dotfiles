set -gx XDG_CONFIG_HOME $HOME/.config
set -gx XDG_DATA_HOME $HOME/.local/share

# Vi Mode (this breaks keybindings for things like !!)
fish_vi_key_bindings

# Fisher (Automatic Install)
if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME $HOME/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

# Prompt
set -g pure_symbol_prompt "λ"
set -g pure_symbol_reverse_prompt "𝑉"
