#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '



path() {

	case "$1" in
		waybar)
			echo -e "Waybar config path: \e[32m/etc/xdg/waybar\e[0m"
			read -p "cd to path? [y/N]: " answer
			if [ "$answer" = "y" ]; then
				cd /etc/xdg/waybar || return
				echo -e "\e[33mPath:\e[0m" $(pwd)
				echo -e "\e[36mContents:\e[0m" "\n""\e[34m\e[1m$(ls)\e[0m\e[0m"
			fi
			;;
		bash)
			echo -e "Path: \e[32m~/.bashrc\e[0m"
			echo -e "This is path to bash config file where you can put your commands"
			;;
		hypr)
			if [ -n "$2" ]; then
				answer="$2"
			else
				echo -e "Hyprland config path: \e[32m~/.config/hypr/hyprland.conf\e[0m"
				read -p $'Options: \n1. open hyprland.conf\n2. cd to path\nChoose or don\'t answer to skip [1/2]: ' answer
			fi

			if [ "$answer" = "1" ]; then
				nano ~/.config/hypr/hyprland.conf
			elif [ "$answer" = "2" ]; then
				cd .config/hypr
				pwd
				ls
			fi
			;;
		kitty)
			echo -e "Path: \e[32m~/.config/kitty/kitty.conf\e[0m"
			echo -e "To open Kitty config just press \e[1mCTRL\e[0m+\e[1mSHIFT\e[0m+\e[1mF2\e[0m"
			;;
		*)
			echo -e "\e[31m\e[1m Avaible commands:\e[0m\e[0m" "\n\e[34m\e[1m   waybar\e[0m\e[0m - Waybar config and style.css \n\e[34m\e[1m   bash\e[0m\e[0m - Path to bashrc file where you can put your bash commands and scripts\n\e[34m\e[1m   hypr\e[0m\e[0m - Hyprland config file. Write 1 or 2 to automatically choose a option\n\e[34m\e[1m   kitty\e[0m\e[0m - Path to Kitty config"
			;;	
	esac
}
