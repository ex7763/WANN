from vis.viewInd import viewInd
from matplotlib import pyplot as plt
import argparse

parser = argparse.ArgumentParser()
parser.add_argument("--model_path", default="./champions/swing.out")
parser.add_argument("--env", default="swingup")
args = parser.parse_args()

model_path = args.model_path
env = args.env

viewInd(model_path, env)

plt.show()
