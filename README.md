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
## 簡易使用方法
### 下載
`git clone https://github.com/google/brain-tokyo-workshop`
### 用WANN訓練
`cd brain-tokyo-workshop/WANNRelease/WANN`
### Ctrl-c 中斷後子線程可能還留著
這段 shell script 可以幫助你解決這個問題
```
kill -9 `ps aux | grep wann_train | tr -s ' ' | cut -d" " -f2`
```
#### 使用 cartpole
`python wann_train.py -p p/laptop_swing.json -n 8`
### 測試
#### 使用 cartpole
`python wann_test.py -p p/swingup.json -i champions/swing.out --nReps 3 --view True`

## 參數說明
`-p` 會讀入設定檔，p 這個資料夾放了許多不同環境的設定檔
`-n` 使用多少個thread去跑
`task` 使用的環境
`maxGen` 演化（訓練）的回合數
### cartpole
```
{
    "task":"swingup",
    "maxGen": 1024,
    "alg_nReps": 3,
    "popSize": 192,
    "select_eliteRatio": 0.2,
    "select_tournSize": 8
}
```

### bipedssss
```
{
    "task":"biped",
    "alg_nReps": 4,
    "maxGen": 2048,
    "popSize": 480,
    "prob_initEnable": 0.25,
    "select_tournSize": 16
}
```

## 修改需要的激勵函數

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
