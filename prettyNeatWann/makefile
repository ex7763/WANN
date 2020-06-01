train_biped:
	#python wann_train.py -p my_s.json -n 8
	chmod +x train.sh
	./train.sh biped "[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]"
train_swingup:
	chmod +x train.sh
	./train.sh swingup "[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]"

test:
	python wann_test.py -p p/p.json -i champions/swing.out --nReps 3 --view True

