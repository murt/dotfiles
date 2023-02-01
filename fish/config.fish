# No greeting
set fish_greeting

# XDG Spec
set -gx XDG_CONFIG_HOME $HOME/.config
set -gx XDG_DATA_HOME $HOME/.local/share

# Environment variables
set -gx DOTNET_CLI_TELEMETRY_OPTOUT 1

# Tokyonight Colours
set -l foreground c0caf5
set -l selection 33467C
set -l comment 565f89
set -l red f7768e
set -l orange ff9e64
set -l yellow e0af68
set -l green 9ece6a
set -l purple 9d7cd8
set -l cyan 7dcfff
set -l pink bb9af7

# Syntax Highlighting Colors
set -g fish_color_normal $foreground
set -g fish_color_command $cyan
set -g fish_color_keyword $pink
set -g fish_color_quote $yellow
set -g fish_color_redirection $foreground
set -g fish_color_end $orange
set -g fish_color_error $red
set -g fish_color_param $purple
set -g fish_color_comment $comment
set -g fish_color_selection --background=$selection
set -g fish_color_search_match --background=$selection
set -g fish_color_operator $green
set -g fish_color_escape $pink
set -g fish_color_autosuggestion $comment

# Completion Pager Colors
set -g fish_pager_color_progress $comment
set -g fish_pager_color_prefix $cyan
set -g fish_pager_color_completion $foreground
set -g fish_pager_color_description $comment

# Vi Mode (this breaks keybindings for things like !!)
fish_vi_key_bindings

# Fisher (Automatic Install)
if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME $HOME/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

# ASDF - support for both normal install and homebrew
if test -e {$HOME}/.asdf/asdf.fish
    source $HOME/.asdf/asdf.fish
end
if type -q brew && test -e (brew --prefix asdf)/asdf.fish
    source (brew --prefix asdf)/asdf.fish
end

# Additional system paths
fish_add_path -a /usr/local/sbin

# Rustup
fish_add_path -a $HOME/.cargo/bin

# Vendor binaries
fish_add_path -a $HOME/vendor/bin

# Gotham shell
eval sh {$HOME}/.config/gotham/gotham.sh

# iTerm 2 (if applicable)
test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

# Prompt
set -gx STARSHIP_CONFIG $XDG_CONFIG_HOME/fish/starship.toml
starship init fish | source

