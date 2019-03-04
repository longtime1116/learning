import numpy as np
import matplotlib.pylab as plt
import sys,os
sys.path.append("../lib")
sys.path.append(os.pardir)
import functions
from dataset.mnist import load_mnist

# normalize => 入力を 0.0〜1.0 の値に正規化するか
# flatten => 一次元配列にするか
# one_hot_label => one-hot 表現をするか([0, 0, 1, 0, 0, 0] のような形)
(x_train, t_train), (x_test, t_test) = load_mnist(normalize=False, flatten=True)

print(x_train.shape) # (6000, 784)
print(t_train.shape) # (6000, )
print(x_test.shape)  # (10000, 784)
print(t_test.shape)  # (10000, )


