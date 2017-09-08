import tensorflow as tf

T = 1.0
F = -1.
bias = 1.

train_in = [
     [T, T, bias],
     [T, F, bias],
     [F, T, bias],
     [F, F, bias],
]

train_out = [
    [T],
    [F],
    [F],
    [F],
]

#initialize weights
w = tf.Variable(tf.random_normal([3, 1]))

def step(x):
    is_greater = tf.greater(x, 0)
    as_float = tf.to_float(is_greater)
    double = tf.mul(as_float, 2)
    return tf.sub(double, 1)

output = step(tf.matmul(train_in, w))
error = tf.sub(train_out, output)
mse = tf.reduce_mean(tf.square(error))

delta = tf.matmul(train_in, error, transpose_a=True)
train = tf.assign(w, tf.add(w, delta))

sess = tf .Session()
sess.run(tf.global_variables_initializer())

err = 1
target = 0
epoch = 0
max_epochs = 10
while err > target and epoch < max_epochs:
    epoch += 1
    err, _ = sess.run([mse, train])
    print("epoch: ", epoch, 'mse: ', err)

