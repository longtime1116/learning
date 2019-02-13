import numpy as np
import matplotlib.pyplot as plt
from matplotlib.image import imread

def p(obj):
    print(obj)

p("type(x): {} test: {}".format(type(1), 1))

x = np.array([1.0, 2.0, 3.0])
y = np.array([2.0, 4.0, 6.0])
p(x)
p(x + y)
p(x - y)
p(x * y)
p(x / y)

A = np.array([[1, 2], [3, 4]])
p(A)
p(A.shape)
p(A.dtype)

p((np.array([[1, 2], [3, "a"]])).dtype)

B = np.array([[3, 0], [0, 6]])
p(A + B)
p(A * B)

p(A * 10)


A = np.array([[1, 2], [3, 4]])
B = ([10, 20])
C = ([15], [25])
p(A * B)
p(A * C)


p(A[1][1])

p(A.flatten())

p(A > 2)
p(A[A > 2])

x = np.arange(0, 6, 0.1)
y = np.sin(x)

plt.plot(x, y)
#plt.show()

y1 = np.sin(x)
y2 = np.cos(x)

# sin関数描画
plt.plot(x, y1, label="sin")
# cos関数描画
plt.plot(x, y2, linestyle = "--", label="cos")
# x軸のラベル
plt.xlabel("x")
# y軸のラベル
plt.ylabel("y")
# タイトル
plt.title("sine & cos")
# 凡例
plt.legend()
plt.show()

img = imread("./lena.png")
plt.imshow(img)
plt.show()
