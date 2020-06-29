#!/bin/bash

sed -i 's/"task":.*/"task":"'"$1"'",/g' my_s.json
cat my_s.json
sed -i "s/lst = "'.*'"/lst = $2/g" domain/my_config.py
cat domain/my_config.py
D=`date +"%F_%H-%M-%S"`
python wann_train.py -p my_s.json -o "$1_$3_""$D.out" -n 8
python draw.py --model_path=log/"$1_$3_""$D.out_best.out" --env=$1 -o="$1_$3"
