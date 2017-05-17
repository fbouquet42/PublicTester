# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    testslarge.sh                                      :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fbouquet <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2016/12/29 19:32:38 by fbouquet          #+#    #+#              #
#    Updated: 2017/05/16 19:42:32 by fbouquet         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#====LARGE TESTS====#

echo "${HIGH}---------LARGE TESTS---------${EOC}"

#TEST100
echo "${HIGH}${BLUE}>>>500 arguments${EOC}";

let "i = 0";
let "n = 0";
while [ $i -lt 13 ];
do
	ARG="`ruby -e 'printf Array.new(500) { rand(-9999999...9999999) }.uniq.map { |i| i.to_s}.join(" ")'`";
	RESULT="`${ACESS}push_swap $ARG`\n";
	COUNT=`printf "$RESULT" | wc -l | bc`;
	if [ $COUNT -eq 0 ]
	then
		SEG=`${ACESS}push_swap $ARG`;
		SEG=`echo $? | bc`;
		if [ $SEG -ne 0 ]
		then
			echo "${RED}!!!CRASH!!!\nYour push_swap crash with arguments ${EOC}${ARG}";
			exit;
		fi
	fi
	if [ $COUNT -lt 5500 ]
	then
		printf "${GREEN}>>>>>>>>>>>>>>>>>${EOC}";
	elif [ $COUNT -gt 11500 ]
	then
		printf "${RED}>>>>>>>>>>>>>>>>>${EOC}";
	else
		printf "${YELLOW}>>>>>>>>>>>>>>>>>${EOC}";
	fi
	if [ $i -lt 3 ]
	then
		printf "\n${HIGH}${BLUE}check-result :${EOC}";
		VALIDITY=`printf "${RESULT}" | ${ACESS}checker $ARG | cat -e`;
		OK="OK\$";
	fi
	if [ $i -lt 3 ] && [ "$VALIDITY" != "$OK" ]
	then
		echo "${RED}/!\Your solution is not valid with arguments :\n${EOC}${ARG}";
		exit;
	elif [ $i -lt 3 ]
	then
		printf "${HIGH}${BLUE} OK\n${EOC}";
	fi
	let "n += COUNT";
	let "i += 1";
done

let "average = n / 13";

echo "";
if [ $average -lt 5500 ]
then
	echo "\n${GREEN}FANTASTIC YOUR PUSH_SWAP IS REALLY GREAT, YOUR AVERAGE IS ${average} instructions${EOC}\n";
elif [ $average -lt 11500 ]
then
	echo "\n${YELLOW}OK : YOUR AVERAGE IS ${average} instructions${EOC}\n";
else
	echo "\n${RED}BAD : YOUR AVERAGE IS ${average} instructions${EOC}\n";
fi


