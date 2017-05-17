# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    testsmall.sh                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fbouquet <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2016/12/28 15:10:14 by fbouquet          #+#    #+#              #
#    Updated: 2016/12/30 18:46:14 by fbouquet         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

source dependence.sh

#====BASIC TESTS=====#

echo "${HIGH}---------BASIC TESTS---------$EOC";

let "warning = 0";

#BTEST1
ARG="-9 0 1 2 3 4 5";

RESULT="`${ACESS}push_swap $ARG`";
ft_crash
COUNT=`printf "$RESULT" | wc -l | bc`;

if [ "$RESULT" != "" ]
then
	echo "${YELLOW}Your push_swap does more than 0 instructions to resolve sorted test like :\n${EOC}${ARG}";
	let "warning += 1";
fi

#BTEST2
ARG="5 4 3 2 1 0 -1";

ft_pushswap ${ACESS} "${ARG}"

if [ $? -eq 1 ] && [ $COUNT -gt 16 ]
then
	echo "${YELLOW}Your push_swap does $COUNT instructions to resolve reverse sorted test like :\n${EOC}${ARG}\n${YELLOW}--> 18 expected${EOC}";
	let "warning += 1";
fi

#BTEST3
ARG="0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 22 21";

ft_pushswap ${ACESS} "${ARG}"
ft_count 5

#BTEST4
ARG="0 2 1 3 4 5 6";

ft_pushswap ${ACESS} "${ARG}"
ft_count 3

#BTEST5
ARG='2 0';

ft_pushswap ${ACESS} "${ARG}"
ft_count 1

#BASIC RESULT

ft_printresult 5

#====RANDOM TESTS====#

echo "${HIGH}---------RANDOM TESTS---------${EOC}"

#RTEST1
echo "${HIGH}${BLUE}>>>3 arguments ; expected maximum 4 instructions${EOC}";

let "i = 0";
let "warning = 0";
while [ $i -lt 50 ];
do
	ARG="`ruby -e 'printf Array.new(3) { rand(-99999...99999) }.uniq.map { |i| i.to_s}.join(" ")'`";
	ft_pushswap ${ACESS} "${ARG}";
	if [ $? -eq 1 ]
	then
		ft_count 4
	fi
	let "i += 1";
done

ft_printresult 50

#RTEST2
echo "${HIGH}${BLUE}>>>5 arguments ; expected maximum 12 instructions${EOC}";

let "i = 0";
let "warning = 0";
while [ $i -lt 200 ];
do
	ARG="`ruby -e 'printf Array.new(5) { rand(-99999...99999) }.uniq.map { |i| i.to_s}.join(" ")'`";
	ft_pushswap ${ACESS} "${ARG}";
	if [ $? -eq 1 ]
	then
		ft_count 12
	fi
	let "i += 1";
done

ft_printresult 200

#RTEST3
echo "${HIGH}${BLUE}>>>10 arguments ; expected maximum 38 instructions${EOC}";

let "i = 0";
let "warning = 0";
while [ $i -lt 200 ];
do
	ARG="`ruby -e 'printf Array.new(10) { rand(-99999...99999) }.uniq.map { |i| i.to_s}.join(" ")'`";
	ft_pushswap ${ACESS} "${ARG}";
	if [ $? -eq 1 ]
	then
		ft_count 38
	fi
	let "i += 1";
done

ft_printresult 200
