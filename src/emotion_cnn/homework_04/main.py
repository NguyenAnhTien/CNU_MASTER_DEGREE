"""
"""
import pandas
import numpy
import keras
from keras.models import Sequential, Model
from keras.layers import Dense, Input
from keras.layers import Conv2D
from keras.layers import MaxPooling2D
from keras.layers import Dropout
from keras.layers import Flatten

def read_data(data_file_name):
    """
    ['Training', 'PublicTest', 'PrivateTest']
    """
    data = pandas.read_csv('fer2013.csv', sep=',', engine='python', )
    X_train = []
    Y_train = []
    X_private_test = []
    Y_private_test = []
    X_public_test = []
    Y_public_test = []

    for index in range(0, len(data)):
        if data.iloc[index][2] == 'Training':
            X_train.append(data.iloc[index][1])
            Y_train.append(data.iloc[index][0])
        if data.iloc[index][2] == 'PrivateTest':
            X_private_test.append(data.iloc[index][1])
            Y_private_test.append(data.iloc[index][0])
        if data.iloc[index][2] == 'PublicTest':
            X_public_test.append(data.iloc[index][1])
            Y_public_test.append(data.iloc[index][0])

    return X_train, Y_train, X_private_test, Y_private_test, X_public_test, Y_public_test

def convert_data(data):
    new_data = []
    for item in data:
        tmp = numpy.array(item.split(' '))
        tmp = tmp.astype(numpy.dtype(float).type)
        tmp = tmp.reshape(48, 48, 1)
        new_data.append(tmp)
    import pdb
    #pdb.set_trace()
    return numpy.array(new_data)

def scale_data(data):
    return data / 255

def convert_label_to_category(labels):
    return keras.utils.to_categorical(numpy.array(labels, dtype='int'))

def create_model():
    
    model = Sequential()
    #block 1
    model.add(Conv2D(32, (3, 3), padding='same', activation='relu',\
                                                    input_shape=(48, 48, 1)))
    model.add(Conv2D(32, (3, 3), activation='relu'))
    model.add(MaxPooling2D(pool_size=(2, 2)))

    #block 2
    model.add(Conv2D(64, (3, 3), padding='same', activation='relu'))
    model.add(Conv2D(64, (3, 3), activation='relu'))
    model.add(MaxPooling2D(pool_size=(2, 2)))

    #block 3
    model.add(Conv2D(128, (3, 3), padding='same', activation='relu'))
    model.add(Conv2D(128, (3, 3), activation='relu'))
    model.add(MaxPooling2D(pool_size=(2, 2)))

    model.add(Flatten())
    model.add(Dense(1024, activation='relu'))
    model.add(Dropout(0.5))
    model.add(Dense(1024, activation='relu'))
    model.add(Dropout(0.5))
    model.add(Dense(7, activation='softmax'))
    
    model.summary()


    return model

def compile_model(model):
    model.compile(loss='categorical_crossentropy',
              optimizer=keras.optimizers.Adam(lr=0.001, beta_1=0.9, beta_2=0.999, epsilon=None, decay=0.0, amsgrad=False),
              metrics=['acc'])

def train_model(model, train_data, train_labels, X_private_test,\
                                                             Y_private_test):

    reduce_lr = keras.callbacks.ReduceLROnPlateau(monitor='loss', factor=0.1,\
                                          patience=10, verbose=0, mode='auto')
    model_checkpoint = model_checkpoint = keras.callbacks.ModelCheckpoint(\
                               filepath='weights.{epoch:02d}-{loss:.2f}.hdf5',\
                               monitor='loss', verbose=0, save_best_only=True)

    history = model.fit(train_data, train_labels, batch_size=16, epochs=50,\
                        verbose=1,\
                        validation_data=(X_private_test, Y_private_test),\
                        callbacks=[reduce_lr, model_checkpoint])

    return history
 
if __name__ == '__main__':
    model = create_model()
    compile_model(model)

    X_train, Y_train, X_private_test, Y_private_test, X_public_test, Y_public_test = read_data('fer2013.csv')
    X_train = convert_data(X_train)
    X_private_test = convert_data(X_private_test)
    X_public_test = convert_data(X_public_test)

    X_train = scale_data(X_train)
    X_private_test = scale_data(X_private_test)
    X_public_test = scale_data(X_public_test)

    Y_train = convert_label_to_category(Y_train)
    Y_private_test = convert_label_to_category(Y_private_test)
    Y_public_test = convert_label_to_category(Y_public_test)

        
    history = train_model(model, X_train, Y_train, X_private_test, Y_private_test)
       
