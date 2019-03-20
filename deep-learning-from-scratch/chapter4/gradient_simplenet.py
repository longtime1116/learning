import numpy as np
import matplotlib.pylab as plt
import sys,os
sys.path.append("../lib")
sys.path.append(os.pardir)
import functions
from dataset.mnist import load_mnist

class SimpleNet:
    def __init__(self):
        self.W = np.random.randn(2, 3)

    def predict(self, x):
        return np.dot(x, self.W)

    def loss(self, x, t):
        z = self.predict(x)
        y = functions.softmax(z)
        loss = functions.cross_entropy_error(y, t)

        return loss



net= SimpleNet()
#print(net.W)

x = np.array([0.6, 0.9])
p = net.predict(x)
#print(p)

#print(np.argmax(p))

t = np.array([0, 0, 1])

#print(net.loss(x, t))


def f(W):
    return net.loss(x, t)

f2 = lambda w: net.loss(x, t)

#dW = functions.numerical_gradient_matrix(f, net.W)
dW = functions.numerical_gradient_matrix(f2, net.W)
print(dW)



