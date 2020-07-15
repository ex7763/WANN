<p align="center">
  <img width="125%" src="WANN/champions/wRange_biped.gif">
</p>

# Weight Agnostic Neural Networks

Code to reproduce and extend the experiments in ['Weight Agnostic Neural Networks'](https://weightagnostic.github.io/) by Adam Gaier and David Ha. 

This repository is split into 4 parts:

* [WANN](WANN): Self-contained code for replicating the experiments in the paper. If you just want to look at the details of the implementation this is the code for you.

* [prettyNEAT](prettyNEAT): A general implementation of the NEAT algorithm -- used as an inspiration and departure point for WANNs. Performs simultaneous weight and topology optimization. If you want to do your own unrelated neuroevolution experiments with numpy and OpenAI Gym this is the code for you.

* [prettyNeatWann](prettyNeatWann): WANNs implemented as a fork of prettyNEAT -- inherits methods and structures from prettyNEAT. If you want to heavily modify or do extensive experiments with WANNs this is the code for you.

* [WANNTool](WANNTool): If you want to fine tune the weights of an existing WANN and test their performance over many trials, this is the code for you.


Install python library

1. pip install box2d
2. pip install matplotlib
3. pip install mpi4py



How to construct  LunarLande neural network?

cd prettyNeatWann
python wann_train.py -p p/LunarLander.json -n 8 
