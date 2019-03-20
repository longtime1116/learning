import numpy as np
import matplotlib.pylab as plt
import sys,os
sys.path.append("../lib")
sys.path.append(os.pardir)
import functions
from dataset.mnist import load_mnist

class TwoLayerNet:
    def __init__(self, input_size, hidden_size, output_size, weight_init_std=0.01):
        # 重みの初期化
        self.params = {}
        self.params['W1'] = weight_init_std * np.random.randn(input_size, hidden_size)
        self.params['b1'] = np.zeros(hidden_size)
        self.params['W2'] = weight_init_std * np.random.rand(hidden_size, output_size)
        self.params['b2'] = np.zeros(output_size)

    def predict(self, x):
        W1, W2 = self.params['W1'], self.params['W2']
        b1, b2 = self.params['b1'], self.params['b2']

        a1 = np.dot(x, W1) + b1
        z1 = functions.sigmoid(a1)
        a2 = np.dot(z1, W2) + b2
        y = functions.softmax(a2)

        return y

    def loss(self, x, t):
        y = self.predict(x)
        y = np.argmax(y, axis=1)
        t = np.argmax(t, axis=1)

        accuracy = np.sum(y == t) / float(x.shape[0])
        return accuracy

    def numerical_gradient(self, x, t):
        loss_w = lambda w: self.loss(x, t)
        grads = {}
        grads['W1'] = functions.numerical_gradient(loss_w, self.params['W1'])
        grads['b1'] = functions.numerical_gradient(loss_w, self.params['b1'])
        grads['W2'] = functions.numerical_gradient(loss_w, self.params['W2'])
        grads['b2'] = functions.numerical_gradient(loss_w, self.params['b2'])

        return grads


net = TwoLayerNet(input_size=784, hidden_size=100, output_size=10)
net.params['W1'].shape
net.params['b1'].shape
net.params['W2'].shape
net.params['b2'].shape

print("a1")
x = np.random.rand(100, 784)
y = net.predict(x)
print("a2")



x = np.random.rand(100, 784)
y = net.predict(x)

print("a3")
x = np.random.rand(100, 784)
t = np.random.rand(100, 10)

print("a4")

grads = net.numerical_gradient(x, t)
print("a5")
print(grads['W1'].shape) #(784, 100)
print(grads['b1'].shape) #(100,)
print(grads['W2'].shape) #(100, 10)
print(grads['b2'].shape) #(10,)

print("a6")
