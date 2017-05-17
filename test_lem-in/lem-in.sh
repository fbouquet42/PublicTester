# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    lem-in.sh                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fbouquet <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/05/03 17:31:50 by fbouquet          #+#    #+#              #
#    Updated: 2017/05/17 16:37:25 by fbouquet         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#====EDIT PATH=====#

ACCESS=~/Tests/fbouquet;

#======COLORS======#

EOC="\033[0m";
RED="\033[31m";
GREEN="\033[32m";
YELLOW="\033[33m"
BLUE="\033[34m"
HIGH="\033[1m";

#====DEPENDENCE====#

source srcs/core.sh

#=======TESTS======#

if [ $# -eq 0 ]
then
	echo "\nusage: ./lem-in.sh [maps]\n\n${YELLOW}[i]${EOC} You can also :\ndisplay errors with the option --error\ndisplay results with the option --result\n";
	exit;
fi

let "error = 0"
let "display = 0"

for ARG in $@
do
	case $ARG in
		'--result')	
			echo "${GREEN}[✓]${EOC}${HIGH} Flag -result- activated${EOC}"
			let "display = 1"
			;;
		'--error')
			echo "${GREEN}[✓]${EOC}${HIGH} Flag -error- activated${EOC}"
			let "error = 1"
			;;
		*)
			echo "\n${HIGH}-- ${ARG}${EOC}"
			ft_validity $ACCESS $error $display
			;;
	esac
done
