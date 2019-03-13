import numpy as np
import matplotlib.pylab as plt
import sys,os
sys.path.append("../lib")
sys.path.append(os.pardir)
import functions
from dataset.mnist import load_mnist


def function_1(x):
    return 0.01 * x**2 + 0.1 * x

print(functions.numerical_diff(function_1, 5))
print(functions.numerical_diff(function_1, 10))

x = np.arange(0.0, 20.0, 0.1)
y = function_1(x)
plt.xlabel("x")
plt.ylabel("f(x)")
plt.plot(x, y)
plt.show()


