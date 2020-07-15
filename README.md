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

```
cd prettyNeatWann
python wann_train.py -p p/LunarLander.json -n 8 
```

把log檔名改成`<env>_<activation function value>.csv`
注意`[1,2,3]`**數字中間不能空格**
例一
```
./train.sh swingup [1,2]
mv log_2020-06-05_16-57-37.csv swingup_2.csv
```
例二
```
./train.sh biped [1,5]
mv log_2020-06-05_16-57-37.csv biped_5.csv
```
跑完後把`csv`檔傳到google drive，產生出的模型結構圖也上去
如果電腦核心數沒這麼多，可以到 `./train.sh` 中，把`-n`改成你電腦的核心數量
詳細說明看下面

## code
```
git clone https://github.com/ex7763/WANN
cd prettyNeatWann
```
### 激勵函數編號
```
case 1  -- Linear
case 2  -- Unsigned Step Function
case 3  -- Sin
case 4  -- Gausian with mean 0 and sigma 1
case 5  -- Hyperbolic Tangent [tanh] (signed)
case 6  -- Sigmoid unsigned [1 / (1 + exp(-x))]
case 7  -- Inverse
case 8  -- Absolute Value
case 9  -- Relu
case 10 -- Cosine
case 11 -- Squared
```
### 訓練
進入`prettyNeatWann`
```
chmod +x train.sh
./train.sh "env_name" "[list of activation function you want]"

# example, the "quotation mark" is nee
./train.sh swingup "[1, 2, 3, 4, 5, 6, 7]"
./train.sh biped "[1, 3, 4, 7]"
```
訓練完後產生的`model`在`log`的資料夾，檔名為`<env_name>_<date>`
如下圖中的swingup_2020-06-01_13-43-23.out...
![](https://i.imgur.com/VTsJrxP.png)
### 繪製模型
下面的檔名`swingup_2020-06-01_13-43-23.out_best.out`，根據上面的結果進行代換，環境`swingup`也是
```
python draw.py --model_path log/swingup_2020-06-01_13-43-23.out_best.out --env=swingup
```
![](https://i.imgur.com/tXC9mRa.png)

### 測試模型
```
$ python wann_test.py -p my_s.json -i log/swingup_2020-06-01_13-43-23.out_best.out 
        *** Running with hyperparameters:  my_s.json    ***
[***]   Fitness: [ 89.21 124.45  82.87   3.96   7.16   5.44] 
[***]   Weight Values:   [-2.  -1.  -0.5  0.5  1.   2. ]

```
### 修改超參數（訓練次數等）
修改 `my_s.json`，並參考`https://sourcegraph.com/github.com/google/brain-tokyo-workshop@73eb4531746825203a3c591896a79ac563d393e7/-/blob/WANNRelease/prettyNeatWann/p/hypkey.txt`中的說明
