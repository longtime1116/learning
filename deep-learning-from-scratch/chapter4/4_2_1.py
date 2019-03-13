import numpy as np
import matplotlib.pylab as plt
import sys,os
sys.path.append("../lib")
sys.path.append(os.pardir)
import functions
from dataset.mnist import load_mnist

t = [0,0,1,0,0,0,0,0,0,0]
y_good = [0.1, 0.05, 0.6, 0.0, 0.05, 0.1, 0.0, 0.1, 0.0, 0.0]
print(functions.mean_squared_error(np.array(y_good), np.array(t)))

y_bad = [0.1, 0.05, 0.2, 0.0, 0.05, 0.1, 0.0, 0.1, 0.8, 0.0]
print(functions.mean_squared_error(np.array(y_bad), np.array(t)))

print(functions.cross_entropy_error(np.array(y_good), np.array(t)))
print(functions.cross_entropy_error(np.array(y_bad), np.array(t)))
