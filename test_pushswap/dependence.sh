# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    dependence.sh                                      :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fbouquet <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2016/12/30 12:26:02 by fbouquet          #+#    #+#              #
#    Updated: 2017/01/03 16:48:36 by fbouquet         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#======CRASH======#

ft_crash()
{
	SEG=`echo $? | bc`;
	if [ $SEG -ne 0 ]
	then
		let "warning += 1"
		echo "${RED}!!!!!CRASH!!!!!\nYour push_swap CRASH with arguments :\n${EOC}${ARG}";
		return 0
	fi
	return 1
}

#====PUSH_SWAP====#

ft_pushswap()
{
	RESULT="`$1push_swap $2`\n";
	ft_crash
	if [ $? -eq 0 ]
	then
		return 0
	fi
	COUNT=`printf "$RESULT" | wc -l | bc`;
	ft_checker
	if [ $? -eq 0 ]
	then
		return 0
	fi
	return 1
}

ft_count()
{
	if [ $COUNT -gt $1 ]
	then
		echo "${YELLOW}Your push_swap does $COUNT instructions to resolve :\n${EOC}${ARG}\n${YELLOW}-->${1} expected${EOC}";
		let "warning += 1";
	fi
}

#=====CHECKER=====#

ft_checker()
{
	if [ "$RESULT" = "\n" ]
	then
		RESULT="";
	fi
	VALIDITY=`printf "$RESULT" | ${ACESS}checker $ARG | cat -e`;
	OK="OK\$";
	if [ "$VALIDITY" != "$OK" ]
	then
		let "warning += 1";
		echo "${RED}/!\Your solution is not valid with arguments :\n${EOC}${ARG}";
		return 0
	fi
	return 1
}

#==PRINT RESULT===#

ft_printresult()
{
	if [ $warning -eq 0 ]
	then
		echo "\n${GREEN}-------SUCESS-------[${1}/${1}]-------${EOC}\n";
	elif [ $warning -ge $1 ]
	then
		echo "\n${RED}-------FAIL--------[0/${1}]--------${EOC}\n";
	else
		let "good = $1 - warning";
		echo "\n${YELLOW}-------FAIL--------[${good}/${1}]-------${EOC}\n";
	fi
}
