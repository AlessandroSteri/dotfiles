install_title() {
	read -r -p "Do you want to update $1? [y/N] " response
	if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]
	then
		echo "✅"
		return 0
	else
		echo "⛔️"
		return 1
	fi
}

install_commands() {
	while read -r line
	do
		eval $line
	done
}


if install_title "core macOS software"
then
install_commands <<EOF
softwareupdate --list
softwareupdate --install --all
EOF
fi
