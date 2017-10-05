### PublicTester ###
These are unit tests for some projects

# Push_swap

1. clone the repository
2. edit the project path (variable called ACESS in push_swap.sh, line 15)
3. then run all the unit test with command; sh push_swap.sh -make -all

options. you can also run the tests individually with the commands; -small -medium or -large

# Lem_in

1. clone the repository
2. edit the project path (variable called ACCESS in lem-in.sh, line 15)
3. then run all the unit test with command; sh lem-in.sh 1 maps/* (make sure your project is compiled)
4. now you can change the number of ants when you run the test, example; sh lem-in.sh 10000 maps/*
you can also run map individually, example; sh lem-in.sh 10000 maps/model_1000

options. make sure the options passed in arguments are between the number of ants and maps
--error : to display the error type
--result : to display my result and then yours

To add a map to the test.
simply add it to the add_map_without_number folder, without the number of ants at the beginning obvioulsy.
