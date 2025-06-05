# !/bin/bash
#Bintang Pancahaya Prasetyo/244107020115
#Dzaky Hadyan Eliyanta/244107020117
#Muhammad Aryatama Mukapraja/244107020028
#Muhammad Fattahul Alim/244107020018
#Naufal Abid Aurizky/244107020212

caesar () {
	chars=()
	for ((i=0; i<${#input}; i++)) do
		chars[$i]="${input:$i:1}"
	done
	index=()
	a=(a b c d e f g h i j k l m n o p q r s t u v w x y z)
	if [ "$A1Z26" == true ]; then
	number=(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26)
	fi
	misc=()
	for ((i=0; i<${#input}; i++)) do
		for ((j=0; j<=${#a[@]}; j++)) do
			shopt -s nocasematch
			if [[ "${chars[$i]}" == "${a[$j]}" ]]; then
				index[$i]=$j
				break
			fi
			if [[ "$j" == "${#a[@]}" ]]; then
				misc[$i]=${chars[$i]}
			fi
		done
	done
	echo -n "Output: "
	for ((i=0; i<${#input}; i++)) do
		if [[ -z "${index[$i]}" ]]; then
			echo -n ${misc[$i]}
		else
			if [[ "$A1Z26" == true ]]; then
				echo -n ${number[(${index[$i]}%${#number[@]})]}
			else
			echo -n ${a[((${index[$i]}+$shift)%${#a[@]})]}
			fi
		fi
	done
	echo ""
}

while true
do
	echo "(˶˃ ᵕ ˂˶) .ᐟ.ᐟ"
	echo "1. Caesar"
	echo "2. ROT13"
	echo "3. A1Z26"
	echo -n "Menu: " && read menu
	echo -n "Input: "
	read input
	case $menu in
		1)	echo -n "Shifted: "
			read shift
			caesar $shift;;
		2)	shift="13"
			caesar $shift;;
		3)	A1Z26=true
			caesar $A1Z26;;
		*)	echo "Input Invalid ૮(˶ㅠ︿ㅠ)ა";;
	esac
done
