import numpy as np
import matplotlib.pylab as plt
import sys,os
sys.path.append("../lib")
sys.path.append(os.pardir)
import functions
from dataset.mnist import load_mnist
from two_layer_net import TwoLayerNet

(x_train, t_train), (x_test, t_test) = load_mnist(normalize=True, one_hot_label=True)

train_loss_list = []

print(x_train.shape) # (60000, 784)
print(t_train.shape) # (60000, 10)

iters_num = 10000
train_size = x_train.shape[0]
batch_size = 100
learning_rate = 0.1

network = TwoLayerNet(input_size=784, hidden_size=50, output_size=10)

for i in range(iters_num):
    # ミニバッチの取得
    batch_mask = np.random.choice(train_size, batch_size)
    print(batch_mask.shape) # (100,)

    x_batch = x_train[batch_mask]
    t_batch = t_train[batch_mask]
    print(x_batch.shape) # (100, 784)
    print(t_batch.shape) # (100, 10)

    grad = network.numerical_gradient(x_batch, t_batch)
    # grad = network.gradient(x_batch, t_batch)

    for key in ['W1', 'b1', 'W2', 'b2']:
        network.params[key] -= learning_rate * grad[key]

    loss = network.loss(x_batch, t_batch)
    train_loss_list.append(loss)

print(train_loss_list) # [0.14, 0.09, 0.11, 0.07, 0.12, 0.1, 0.15, 0.05, 0.03, 0.1]
