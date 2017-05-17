# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    push_swap.sh                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fbouquet <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2016/12/28 15:09:25 by fbouquet          #+#    #+#              #
#    Updated: 2017/05/16 15:38:51 by fbouquet         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#====EDIT PATH=====#

ACESS=~/Projects/push_swap/;

#======COLORS======#

EOC="\033[0m";
RED="\033[31m";
GREEN="\033[32m";
YELLOW="\033[33m"
BLUE="\033[34m"
HIGH="\033[1m";

#====DEPENDENCE====#

source dependence.sh

#=======TESTS======#

if [ $# -eq 0 ]
then
	echo "\n${YELLOW}You need put an argument, like :\n\n-small -medium -large -all\n\n-make -clean -fclean -re\n\n-clear$EOC\n";
	exit;
fi

for ARG in $@
do
	case $ARG in
		'-all')
			clear;
			source testsmall.sh;
			source testsmedium.sh;
			source testslarge.sh;
			;;
		'-small')
			source testsmall.sh;
			;;
		'-medium')
			source testsmedium.sh;
			;;
		'-large')
			source testslarge.sh;
			;;
		'-make')
			make -C $ACESS;
			;;
		'-clean')
			make clean -C $ACESS;
			;;
		'-fclean')
			make fclean -C $ACESS;
			;;
		'-re')
			make re -C $ACESS;
			;;
		'-clear')
			clear;
			;;
		*)
			echo "\n${YELLOW}You need put an argument, like :\n\n-small -medium -large -all\n\n-make -clean -fclean -re\n\n-clear$EOC\n";
			exit;
			;;
	esac
done
