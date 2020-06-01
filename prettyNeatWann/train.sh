#!/bin/bash

sed -i 's/"task":.*/"task":"'"$1"'",/g' my_s.json
cat my_s.json
sed -i "s/lst = "'.*'"/lst = $2/g" domain/my_config.py
cat domain/my_config.py
python wann_train.py -p my_s.json -o result.out -n 8
