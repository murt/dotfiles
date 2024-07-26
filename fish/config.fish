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

# Check for and add homebrew
if test -e /opt/homebrew/bin
    fish_add_path -a /opt/homebrew/bin
end

# ASDF - support for both normal install and homebrew
if test -e {$HOME}/.asdf/asdf.fish
    source $HOME/.asdf/asdf.fish
end
if type -q brew && test -e (brew --prefix asdf)/libexec/asdf.fish
    source (brew --prefix asdf)/libexec/asdf.fish
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

# Gotham shell
if test -e {$HOME}/.config/gotham/gotham.sh
    eval sh {$HOME}/.config/gotham/gotham.sh
end

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
# uninstall by removing these lines
[ -f {$XDG_CONFIG_HOME}/tabtab/fish/__tabtab.fish ]; and . {$XDG_CONFIG_HOME}/tabtab/fish/__tabtab.fish; or true

if test -e $(which direnv)
    function __direnv_export_eval --on-event fish_prompt;
        direnv export fish | source;

        if test "$direnv_fish_mode" != "disable_arrow";
            function __direnv_cd_hook --on-variable PWD;
                if test "$direnv_fish_mode" = "eval_after_arrow";
                    set -g __direnv_export_again 0;
                else;
                    direnv export fish | source;
                end;
            end;
        end;
    end;

    function __direnv_export_eval_2 --on-event fish_preexec;
        if set -q __direnv_export_again;
            set -e __direnv_export_again;
            direnv export fish | source;
            echo;
        end;

        functions --erase __direnv_cd_hook;
    end;
end

# Support for local user file
if test -e {$XDG_CONFIG_HOME}/fish/user.fish
    source $XDG_CONFIG_HOME/fish/user.fish
end
