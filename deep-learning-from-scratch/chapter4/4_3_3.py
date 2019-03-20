import numpy as np
import matplotlib.pylab as plt
import sys,os
sys.path.append("../lib")
sys.path.append(os.pardir)
import functions
from dataset.mnist import load_mnist

def function_2(x):
    return x[0]**2 + x[1]**2

def numerical_gradient(f, x):
    h = 1e-4 # 0.0001
    grad = np.zeros_like(x)

    for idx in range(x.size):
        tmp_val = x[idx]
        x[idx] = tmp_val + h
        fxh1 = f(x)

        x[idx] = tmp_val + h
        fxh1 = f(x)

        x[idx] = tmp_val - h
        fxh2 = f(x)

        grad[idx] = (fxh1 - fxh2) / (2 * h)
        x[idx] = tmp_val

    return grad

#print(numerical_gradient(function_2, np.array([3.0, 4.0])))
#print(numerical_gradient(function_2, np.array([0.0, 2.0])))
#print(numerical_gradient(function_2, np.array([-1.0, -2.0])))


def gradient_descent(f, init_x, lr=0.01, step_num=100):
    x = init_x
    for i in range(step_num):
        grad = numerical_gradient(f, x)
        #print(x)
        x -= lr * grad
    return x


init_x = np.array([-3.0, 4.0])
x = gradient_descent(function_2, init_x=init_x, lr=0.1, step_num=100)
#print(x)

init_x = np.array([-3.0, 4.0])
x = gradient_descent(function_2, init_x=init_x, lr=10, step_num=100)
#print(x)

init_x = np.array([-3.0, 4.0])
x = gradient_descent(function_2, init_x=init_x, lr=1e-10, step_num=100)
#print(x)


