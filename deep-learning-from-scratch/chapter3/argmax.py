import numpy as np

arrays = [[1, 2,   3, 4],
          [8, 7,   6, 5],
          [2, 1, 100, 3]]
print(np.argmax(arrays))
print(np.argmax(arrays, axis=0))
print(np.argmax(arrays, axis=1))
