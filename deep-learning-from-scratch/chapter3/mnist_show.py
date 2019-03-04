import numpy as np
import matplotlib.pylab as plt
import sys,os
sys.path.append("../lib")
sys.path.append(os.pardir)
import functions
from dataset.mnist import load_mnist
from PIL import Image # Python Image Library

def show_img(img):
    pil_img = Image.fromarray(np.uint8(img))
    pil_img.show()

(x_train, t_train), (x_test, t_test) = load_mnist(normalize=False, flatten=True)

print(x_train.shape) # (60000, 784)
print(t_train.shape)  # (6000, )
img = x_train[0]
label = t_train[0]
print(label) # 5

print(img.shape) # (784, )
img = img.reshape(28, 28)
print(img.shape) # (28, 28)
show_img(img)
