set PATH ~/.local/bin $PATH

# See https://github.com/fish-shell/fish-shell/blob/master/share/functions/__fish_git_prompt.fish
set normal (set_color normal)
set magenta (set_color magenta)
set yellow (set_color yellow)
set green (set_color green)
set red (set_color red)
set gray (set_color -o black)

# Fish git prompt
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'no'
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_color_branch yellow
set __fish_git_prompt_color_upstream_ahead green
set __fish_git_prompt_color_upstream_behind red

# Status Chars
set __fish_git_prompt_char_dirtystate 'd'
set __fish_git_prompt_char_stagedstate 's'
set __fish_git_prompt_char_untrackedfiles 'u'
set __fish_git_prompt_char_stashstate '_'
set __fish_git_prompt_char_upstream_ahead '+'
set __fish_git_prompt_char_upstream_behind '-'


function fish_prompt
  set last_status $status

  set_color $fish_color_cwd
  printf '%s' (prompt_pwd)
  set_color normal

  printf '%s ' (__fish_git_prompt)

  set_color normal
end

set fish_greeting

if test -d $HOME/.npm/global/bin
  set -x PATH $PATH $HOME/.npm-global/bin
end

if test -d $HOME/.config/composer/vendor/bin
  set -x PATH $PATH $HOME/.config/composer/vendor/bin
end

# --files: List files that would be searched but do not search
# --no-ignore: Do not respect .gitignore, etc...
# --hidden: Search hidden files and folders
# --follow: Follow symlinks
# --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
set -x FZF_DEFAULT_COMMAND 'rg --files --no-ignore --hidden --follow --glob "!.git/*"'

function dprod
    env DEIS_PROFILE=$HOME/.deis/myriad-client.json deis $argv
end

function dbush
    env DEIS_PROFILE=$HOME/.deis/bushel-client.json deis $argv
end
