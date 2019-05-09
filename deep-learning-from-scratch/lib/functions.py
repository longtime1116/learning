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
#def softmax(x):
#    C = np.max(x)
#    exp_x = np.exp(x - C)
#    sum_exp_x = np.sum(exp_x)
#    y = exp_x / sum_exp_x
#    return y

def softmax(x):
    if x.ndim == 2:
        x = x.T
        x = x - np.max(x, axis=0)
        y = np.exp(x) / np.sum(np.exp(x), axis=0)
        return y.T

    x = x - np.max(x) # オーバーフロー対策
    return np.exp(x) / np.sum(np.exp(x))

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


def numerical_diff(f, x):
    h = 1e-4 # 0.0001
    return (f(x+h) - f(x-h)) / (2*h)


def numerical_gradient_matrix(f, x):
    h = 1e-4 # 0.0001
    grad = np.zeros_like(x)

    row, column = x.shape
    # nditer を使うと一重ループでいける
    for i in range(row):
        #print("i: " + str(i))
        for j in range(column):
            #print(" j: " + str(j))
            tmp_val = x[i][j]
            x[i][j] = tmp_val + h
            fxh1 = f(x)

            x[i][j] = tmp_val + h
            fxh1 = f(x)

            x[i][j] = tmp_val - h
            fxh2 = f(x)

            grad[i][j] = (fxh1 - fxh2) / (2 * h)
            x[i][j] = tmp_val
    return grad

#def numerical_gradient(f, x):
#    h = 1e-4 # 0.0001
#    grad = np.zeros_like(x)
#
#    print(x)
#    for idx in range(x.size):
#        tmp_val = x[idx]
#        x[idx] = tmp_val + h
#        fxh1 = f(x)
#
#        x[idx] = tmp_val + h
#        fxh1 = f(x)
#
#        x[idx] = tmp_val - h
#        fxh2 = f(x)
#
#        grad[idx] = (fxh1 - fxh2) / (2 * h)
#        x[idx] = tmp_val
#
#    return grad

def numerical_gradient(f, x):
    h = 1e-4 # 0.0001
    grad = np.zeros_like(x)

    it = np.nditer(x, flags=['multi_index'], op_flags=['readwrite'])
    while not it.finished:
        idx = it.multi_index
        tmp_val = x[idx]
        x[idx] = float(tmp_val) + h
        fxh1 = f(x) # f(x+h)

        x[idx] = tmp_val - h 
        fxh2 = f(x) # f(x-h)
        grad[idx] = (fxh1 - fxh2) / (2*h)

        x[idx] = tmp_val # 値を元に戻す
        it.iternext()   

    return grad


class Affine:
    def __init__(self, W, b):
        self.W = W
        self.b = b
        self.x = None
        self.dW = None
        self.db = None

    def forward(self, x):
        self.x = x
        out = np.dot(x, self.W) + self.b
        return out

    def backward(self, dout):
        dx = np.dot(dout, self.W.T)
        self.dW = np.dot(self.x.T, dout)
        self.db = np.sum(dout, axis=0)
        return dx

class Relu:
    def __init__(self):
        self.mask = None

    def forward(self, x):
        self.mask = (x <= 0)
        out = x.copy()
        out[self.mask]= 0
        return out

    def backward(self, dout):
        dout[self.mask] = 0
        dx = dout
        return dx

class SoftmaxWithLoss:
    def __init__(self):
        self.loss = None #損失
        self.y = None #softmaxの出力
        self.t = None # 教師データ

    def forward(self, x, t):
        self.t = t
        self.y = softmax(x)
        self.loss = cross_entropy_error(self.y, self.t)
        return self.loss

    def backward(self, dout=1):
        batch_size = self.t.shape[0]
        dx = (self.y - self.t) / batch_size
        return dx


