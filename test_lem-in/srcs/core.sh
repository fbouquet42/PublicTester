# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    core.sh                                            :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fbouquet <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/05/16 15:53:15 by fbouquet          #+#    #+#              #
#    Updated: 2017/05/17 17:15:21 by fbouquet         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#====VALIDITY TEST====#

ft_validity()
{
	printf "${HIGH}Validity: ${EOC}";

	RESULT="`$1/lem-in < $ARG`";
	YOURS="`printf "$RESULT" | ./srcs/checker`"
	YOURS=`echo "$YOURS" | bc`
	if [ $2 -eq 0 ]
	then
		if [ $YOURS -le 0 ]
		then
			echo "${RED}✗${EOC}";
		else
			echo "${GREEN}✓${EOC}";
			ft_optimization 0 $3
		fi
	else
		CHECK="`printf "$RESULT" | ./srcs/checker -S`"
		if [ "$CHECK" != "all is fine" ]
		then
			echo "$CHECK"
			if [ $3 -eq 1 ]
			then
				RESULT="`echo "$RESULT" | ./srcs/checker -g`"
				echo "${HIGH}Your result:${EOC}\n${RESULT}"
			fi
		else
			echo "${GREEN}${CHECK}${EOC}"
			ft_optimization 1 $3
		fi
	fi
}

ft_optimization()
{
	if [ $2 -eq 1 ]
	then
		MINE="`./srcs/ref -S < $ARG`"
		echo "${HIGH}My result:${EOC}\n${MINE}"
		MINE=`echo "$MINE" | wc -l | bc`
		RESULT="`echo "$RESULT" | ./srcs/checker -g`"
		echo "${HIGH}Your result:${EOC}\n${RESULT}"
	else
		MINE=`./srcs/ref -Q < $ARG | bc`
	fi

	if [ $MINE -eq $YOURS ]
	then
		printf "${HIGH}Optimization: ${EOC}${GREEN}✓${EOC}\n";
	elif [ $MINE -lt $YOURS ]
	then
		let "DIFF = YOURS - MINE";
		printf "${HIGH}Optimization: ${EOC}${RED}${DIFF} unnecessary laps${EOC}\n";
	else
		let "DIFF = MINE - YOURS";
		printf "${HIGH}Optimization: ${BLUE}Kudos ! Your algorithm is better than mine of ${DIFF} laps${EOC}\n";
	fi
}
