#
import json
import random

import numpy
import keras
from matplotlib import pyplot
from scipy import stats

def create_model(input_shape):
    """
    #unit = 1 training loss: 0.0052, Testing loss: 0.00440863337368
    #unit = 5 loss: 0.0028, Testing loss: 0.00269036360085
    #unit = 7 loss: 0.0033, Testing loss: 0.00258894748113
    #unit = 11 loss: 0.0034, Testing loss: 0.00236142419279,
    #unit = 13 0.0024, 0.0020982420817,
    #unit = 17 0.0028, 0.00269367042929,
    #unit = 19 0.0032, 0.00264530085027,
    #unit = 23 0.0032, 0.00276174234226,
    #unit = 111, 0.0030, 0.00233691553585,
    #unit = 11, #layers = 1, loss: 0.0034, Testing loss: 0.00236142419279,
    #unit = 11, #layers = 2, loss: 0.0026 Testing loss: 0.00208030194743,
    #unit = 11, #layers = 3, loss: 0.0029 Testing loss: 0.00223329180852,
    #unit = 11, #layers = 5, loss: 0.0030 Testing loss: 0.00227291549556,
    #unit = 11, #layers = 7, loss:  0.0030 Testing loss: 0.00231950872578,
    #unit = 11, #layers = 11, loss: 0.0032  Testing loss: 0.00246560857166,
    #unit = 11, #layers = 13, loss: 0.0032 Testing loss: 0.00243776706979,
    #unit = 11, #layers = 17, loss: 0.0032 Testing loss: 0.00242816655431,,
    """
    model = keras.models.Sequential()
    model.add(keras.layers.Dense(3, input_shape=input_shape, activation='relu'))
    model.add(keras.layers.Dense(8, activation='relu'))
#    model.add(keras.layers.Dense(11, activation='relu'))
#    model.add(keras.layers.Dense(11, activation='relu'))
#    model.add(keras.layers.Dense(11, activation='relu'))
#    model.add(keras.layers.Dense(11, activation='relu'))
#    model.add(keras.layers.Dense(11, activation='relu'))
#    model.add(keras.layers.Dense(11, activation='relu'))
#    model.add(keras.layers.Dense(11, activation='relu'))
#    model.add(keras.layers.Dense(11, activation='relu'))
#    model.add(keras.layers.Dense(11, activation='relu'))
#    model.add(keras.layers.Dense(11, activation='relu'))
#    model.add(keras.layers.Dense(11, activation='relu'))
#    model.add(keras.layers.Dense(11, activation='relu'))
#    model.add(keras.layers.Dense(11, activation='relu'))
#    model.add(keras.layers.Dense(11, activation='relu'))
#    model.add(keras.layers.Dense(11, activation='relu'))
#    model.add(keras.layers.Dense(11, activation='relu'))
    model.add(keras.layers.Dense(1, activation='sigmoid'))
    model.summary()
    return model

def train_model(model, trained_data, trained_labels, test_data, test_labels):
    history = model.fit(trained_data, trained_labels, batch_size=64,\
                        epochs=100, verbose=1, 
                        validation_data=(test_data, test_labels))
    return history

def compile_model(model):
    model.compile(optimizer='sgd', loss='mean_squared_error', metrics=['mae'])

def evaluate_model(model, test_data, test_labels):
    loss, accuracy = model.evaluate(test_data, test_labels)
    return (loss, accuracy)

def generate_labels(input, mean_vector, cov_matrix, sample_size):
    return stats.multivariate_normal.pdf(input, mean=mean_vector, cov=cov_matrix)
     
def generate_data(start, end, sample_size):
    data = []
    for index in xrange(sample_size):
        data.append(random.uniform(start, end))

    return data

def write_to_json(file_name, data, labels):
    data = numpy.column_stack((data, labels))
    numpy.savetxt(file_name, data, delimiter=",")

def create_sample(data_file_name):
    mean_vector = [0, 0]
    cov_matrix = [[0.3, -0.5], [-0.5, 2]]
    sample_size = 5100
    x_mu = 0
    x_sigma = 0.1
    x_1 = generate_data(-2, 2, 5100)
    x_2 = generate_data(-4, 4, 5100)
    data = numpy.column_stack((x_1, x_2))
    labels = generate_labels(data, mean_vector,\
                                     cov_matrix, sample_size)
    write_to_json(data_file_name, data, labels)

def load_data(file_name, delimiter):
    data = numpy.loadtxt(open(file_name, 'rb'), delimiter=delimiter)
    return data

def plot_loss(history):
    pyplot.figure(figsize=[8,6])
    pyplot.plot(history.history['loss'],'r',linewidth=3.0)
    pyplot.plot(history.history['val_loss'],'b',linewidth=3.0)
    pyplot.legend(['Training loss', 'Validation Loss'],fontsize=18)
    pyplot.xlabel('Epochs ',fontsize=16)
    pyplot.ylabel('Loss',fontsize=16)
    pyplot.title('Loss Curves',fontsize=16)

if __name__ == '__main__':
   

    '''
    Step 1: generate data
            file_name = data.csv
    '''
    #file_name = 'data.csv'
    #create_sample(file_name)
    '''
    Step 2: Measure the performance of MLP based on sample size
        step 2.1: load data
        step 2.2: do experiment
            step 2.2.1: sample size: 1000
            step 2.2.2: sample size: 2000
            step 2.2.3: sample size: 3000
            step 2.2.4: sample size: 4000
            step 2.2.5: sample size: 5000

    '''
    data_file_name = 'data.csv'
    delimiter = ','
    data = load_data(data_file_name, delimiter)

    #1000 sample, Testing loss: 0.00636097651906, train loss: 0.0078
    trained_data = data[0:1000, 0:2]
    trained_labels = data[0:1000, 2]
    test_data = data[1000:1100, 0:2]
    test_labels = data[1000:1100, 2]

    #2000 sample, Testing loss: 0.00394838285632, train loss: 0.0045
    # trained_data = data[0:2000, 0:2]
    # trained_labels = data[0:2000, 2]
    # test_data = data[2000:2100, 0:2]
    # test_labels = data[2000:2100, 2]

    #3000 sample, Testing loss: 0.0033827212872, train loss: 0.0039
    # trained_data = data[0:3000, 0:2]
    # trained_labels = data[0:3000, 2]
    # test_data = data[3000:3100, 0:2]
    # test_labels = data[3000:3100, 2]    

    #4000 sample, Testing loss: 0.00353795677423, train loss: 0.0031
    # trained_data = data[0:4000, 0:2]
    # trained_labels = data[0:4000, 2]
    # test_data = data[4000:4100, 0:2]
    # test_labels = data[4000:4100, 2]

    #5000 sample, Testing loss: 0.00157187868841, train loss: 0.0028
#    trained_data = data[0:5000, 0:2]
#    trained_labels = data[0:5000, 2]
#    test_data = data[5000:5100, 0:2]
#    test_labels = data[5000:5100, 2]
#
    input_shape = trained_data.shape[1]
    input_shape = (input_shape, )
    model = create_model(input_shape)
    compile_model(model)
    trained_history = train_model(model, trained_data, trained_labels,\
                            test_data, test_labels)
#
    loss, accuracy = evaluate_model(model, test_data, test_labels)
    print('\nTesting loss: {}, acc: {}\n'.format(loss, accuracy))
#
    plot_loss(trained_history)

    pyplot.show()





