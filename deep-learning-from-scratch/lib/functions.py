import numpy as np

def step_function(x):
    y = x > 0
    return y.astype(np.int)

def sigmoid(x):
    return 1 / (1 + np.exp(-x))

def relu(x):
    return np.maximum(0, x)

def identity_function(x):
    return x

def softmax_simple(x):
    exp_x = np.exp(x)
    sum_exp_x = np.sum(exp_x)
    y = exp_x / sum_exp_x
    return y

# 順番が変わらないまま、和が1という性質を利用して確率としてみなせる
def softmax(x):
    C = np.max(x)
    exp_x = np.exp(x - C)
    sum_exp_x = np.sum(exp_x)
    y = exp_x / sum_exp_x
    return y

def mean_squared_error(y, t):
    return 0.5 * np.sum((y-t) ** 2)

# one-hot
def cross_entropy_error_single(y, t):
    delta = 1e-7
    return -np.sum(t * np.log(y + delta))

# one-hot
def cross_entropy_error(y, t):
    if y.ndim == 1:
        t = t.reshape(1, t.size)
        y = y.reshape(1, y.size)

    batch_size = y.shape[0]
    return -np.sum(t * np.log(y + 1e-7)) / batch_size




