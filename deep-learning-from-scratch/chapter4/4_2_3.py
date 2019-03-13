import numpy as np
import matplotlib.pylab as plt
import sys,os
sys.path.append("../lib")
sys.path.append(os.pardir)
import functions
from dataset.mnist import load_mnist

(x_train, t_train), (x_test, t_test) = load_mnist(normalize=True, one_hot_label=True)

print(x_train.shape) # (60000, 784)
print(t_train.shape) # (60000, 10)

train_size = x_train.shape[0]
batch_size = 10

batch_mask = np.random.choice(train_size, batch_size) # ランダムに選んでくれる
print(batch_mask.shape) # (10,)
print(batch_mask)

x_batch = x_train[batch_mask]
t_batch = t_train[batch_mask]

print(x_batch)

# いつかこれでいける
#print(functions.cross_entropy_error_batch(np.array(predict(x_batch)), np.array(t_batch)))
