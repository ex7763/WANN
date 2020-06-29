#!/bin/bash

./train.sh biped [1,3,4,5,6,7,8,9,10,11] r_2
./train.sh biped [1,2,4,5,6,7,8,9,10,11] r_3 
./train.sh biped [1,2,3,5,6,7,8,9,10,11] r_4 
./train.sh biped [1,2,3,4,6,7,8,9,10,11] r_5 
./train.sh biped [1,2,3,4,5,7,8,9,10,11] r_6
./train.sh biped [1,2,3,4,5,6,8,9,10,11] r_7 
./train.sh biped [1,2,3,4,5,6,7,9,10,11] r_8 
./train.sh biped [1,2,3,4,5,6,7,8,10,11] r_9 
./train.sh biped [1,2,3,4,5,6,7,8,9,11] r_10
./train.sh biped [1,2,3,4,5,6,7,8,9,10] r_11

