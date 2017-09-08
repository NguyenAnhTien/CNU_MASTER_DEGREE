import tensorflow as tf

#create Tensorflow variables
b = tf.placeholder(tf.float32, [None, 1], name='b')

a_out = sess.run(a, feed_dict={b: np.arange(0, 10)[:, np.newaxis]})
