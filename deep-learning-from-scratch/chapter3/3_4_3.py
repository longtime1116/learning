import numpy as np
import matplotlib.pylab as plt
import sys,os
sys.path.append("../lib")
import functions


def init_network():
    network = {}
    # w11, w21, w31 = 0.1, 0.3, 0.5
    # w12, w22, w32 = 0.2, 0.4, 0.6
    # network['W1'] = np.array([[w11, w21, w31],
    #                           [w12, w22, w32]])
    network['W1'] = np.array([[0.1, 0.3, 0.5],
                              [0.2, 0.4, 0.6]])
    network['B1'] = np.array([0.1, 0.2, 0.3])
    network['W2'] = np.array([[0.1, 0.4],
                              [0.2, 0.5],
                              [0.3, 0.6]])
    network['B2'] = np.array([0.1, 0.2])
    network['W3'] = np.array([[0.1, 0.3],
                              [0.2, 0.4]])
    network['B3'] = np.array([0.1, 0.2])
    return network


def forward(network, x):
    W1, W2, W3 = network['W1'], network['W2'], network['W3']
    B1, B2, B3 = network['B1'], network['B2'], network['B3']

    a1 = np.dot(x, W1) + B1 # (1, 2) * (2, 3) => (1, 3)
    z1 = functions.sigmoid(a1)

    a2 = np.dot(z1, W2) + B2 # (1, 3) * (3, 2) => (1, 2)
    z2 = functions.sigmoid(a2)

    a3 = np.dot(z2, W3) + B3 # (1, 2) * (2, 2) => (1, 2)
    y = functions.identity_function(a3)
    #y = functions.softmax_simple(a3)

    return y


network = init_network()
x = np.array([1.0, 0.5])
y = forward(network, x)
print(y)
