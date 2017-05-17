# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    testsmedium.sh                                     :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fbouquet <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2016/12/28 17:59:32 by fbouquet          #+#    #+#              #
#    Updated: 2017/01/03 18:15:27 by fbouquet         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#====MEDIUM TESTS====#

echo "${HIGH}---------MEDIUM TESTS---------${EOC}"

#TEST100
echo "${HIGH}${BLUE}>>>100 arguments${EOC}";

let "i = 0";
let "n = 0";
while [ $i -lt 200 ];
do
	ARG="`ruby -e 'printf Array.new(100) { rand(-999999...999999) }.uniq.map { |i| i.to_s}.join(" ")'`";
	RESULT="`${ACESS}push_swap $ARG`\n";
	ft_crash
	COUNT=`printf "$RESULT" | wc -l | bc`;
	VALIDITY=`printf "$RESULT" | ${ACESS}checker $ARG | cat -e`;
	OK="OK\$";
	if [ "$VALIDITY" != "$OK" ]
	then
		echo "${RED}/!\Your solution is not valid with arguments :\n${EOC}${ARG}";
		exit;
	elif [ $COUNT -lt 700 ]
	then
		printf "${GREEN}>${EOC}";
	elif [ $COUNT -gt 1500 ]
	then
		printf "${RED}>${EOC}";
	else
		printf "${YELLOW}>${EOC}";
	fi
	let "n += COUNT";
	let "i += 1";
done

let "average = n / 200";

echo "";
if [ $average -lt 700 ]
then
	echo "\n${GREEN}FANTASTIC YOUR PUSH_SWAP IS REALLY GREAT, YOUR AVERAGE IS ${average} instructions${EOC}\n";
elif [ $average -lt 1500 ]
then
	echo "\n${YELLOW}OK : YOUR AVERAGE IS ${average} instructions${EOC}\n";
else
	echo "\n${RED}BAD : YOUR AVERAGE IS ${average} instructions${EOC}\n";
fi
