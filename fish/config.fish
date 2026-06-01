function fish_greeting
end

# alias
alias cleanup 'sudo pacman -Rns (pacman -Qtdq)'
alias please sudo
alias ls 'eza -l --color=always --group-directories-first --icons'
alias lsa 'eza -la --color=always --group-directories-first --icons'

# abbr config
abbr cfgfastfetch 'vim ~/git/dotfiles/fastfetch/config.jsonc'
abbr cfgfish 'vim ~/git/dotfiles/fish/config.fish'
abbr cfgkitty 'vim ~/git/dotfiles/kitty/kitty.conf'
abbr cfgvim 'vim ~/git/dotfiles/vim/vimrc'

abbr cfghypr 'vim ~/.config/hypr/hyprland.lua'
abbr cfghyprbind 'vim ~/.config/hypr/conf/bind.lua'
abbr cfghyprinput 'vim ~/.config/hypr/conf/input.lua'
abbr cfghyprlook 'vim ~/.config/hypr/conf/look.lua'
abbr cfghyprwindows 'vim ~/.config/hypr/conf/windows.lua'

abbr cfgwaybarc 'vim ~/git/dotfiles/waybar/config.jsonc'
abbr cfgwaybars 'vim ~/git/dotfiles/waybar/style.css'

abbr gitstat 'cd ~/git/gitscripts/ && ./git-check-and-push.sh && cd'
abbr gitpull 'cd ~/git/gitscripts/ && ./script-git-pull.sh && cd'
