import tensorflow as tf

#create a Tensorflow constant
const = tf.constant(2.0, name="const")

#create Tensorflow variable
b = tf.Variable(2.0, name='b')
c = tf.Variable(1.0, name='c')

#create operations
d = tf.add(b, c, name='d')
e = tf.add(c, const, name='e')
a = tf.multiply(d, e, name='a')

#the variable initialisation
init_top = tf.global_variables_initializer()

#start the session
with tf.Session() as sess:
    #initialise the variables
    sess.run(init_top)
    #compute the output of the graph
    a_out = sess.run(a)

    print("Variable a is {}".format(a_out))
