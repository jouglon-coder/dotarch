function fish_greeting
    fastfetch
end

# alias
alias cleanup 'sudo pacman -Rns (pacman -Qtdq)'
alias please sudo
alias ls 'eza -l --color=always --group-directories-first --icons'
alias lsa 'eza -la --color=always --group-directories-first --icons'

# abbr config
abbr cfgfastfetch   'vim ~/git/dotarch/fastfetch/config.jsonc'
abbr cfgfish        'vim ~/git/dotarch/fish/config.fish'
# abbr cfgkitty       'vim ~/git/dotarch/kitty/kitty.conf'
abbr cfgalacritty   'vim ~/git/dotarch/alacritty/alacritty.toml'
abbr cfgkitty       'vim ~/git/github/hypr-dotfiles/kitty/kitty.conf'
abbr cfgvim         'vim ~/git/dotarch/vim/vimrc'

abbr cfghypr        'vim ~/git/dotarch/hypr/hyprland.lua'
abbr cfghyprbind    'vim ~/git/dotarch/hypr/conf/bind.lua'
abbr cfghyprinput   'vim ~/git/dotarch/hypr/conf/input.lua'
abbr cfghyprlook    'vim ~/git/dotarch/hypr/conf/look.lua'
abbr cfghyprwindows 'vim ~/git/dotarch/hypr/conf/windows.lua'

abbr cfgwaybarc     'vim ~/git/dotarch/waybar/config.jsonc'
abbr cfgwaybars     'vim ~/git/dotarch/waybar/style.css'
