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
from keras.layers import Activation

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


def compile_model(model):
    model.compile(loss='categorical_crossentropy',
              optimizer=keras.optimizers.Adam(lr=1e-5, beta_1=0.9, beta_2=0.999, epsilon=None, decay=0.0, amsgrad=False),
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

def VGG16():

    input_shape = (48, 48, 1)
    input = Input(shape=input_shape)
    # Block 1
    x = Conv2D(64, (3, 3), activation='relu', padding='same', name='conv1_1')(
        input)
    x = Conv2D(64, (3, 3), activation='relu', padding='same', name='conv1_2')(x)
    x = MaxPooling2D((2, 2), strides=(2, 2), name='pool1')(x)

    # Block 2
    x = Conv2D(128, (3, 3), activation='relu', padding='same', name='conv2_1')(
        x)
    x = Conv2D(128, (3, 3), activation='relu', padding='same', name='conv2_2')(
        x)
    x = MaxPooling2D((2, 2), strides=(2, 2), name='pool2')(x)

    # Block 3
    x = Conv2D(256, (3, 3), activation='relu', padding='same', name='conv3_1')(
        x)
    x = Conv2D(256, (3, 3), activation='relu', padding='same', name='conv3_2')(
        x)
    x = Conv2D(256, (3, 3), activation='relu', padding='same', name='conv3_3')(
        x)
    x = MaxPooling2D((2, 2), strides=(2, 2), name='pool3')(x)

    # Block 4
    x = Conv2D(512, (3, 3), activation='relu', padding='same', name='conv4_1')(
        x)
    x = Conv2D(512, (3, 3), activation='relu', padding='same', name='conv4_2')(
        x)
    x = Conv2D(512, (3, 3), activation='relu', padding='same', name='conv4_3')(
        x)
    x = MaxPooling2D((2, 2), strides=(2, 2), name='pool4')(x)

    # Block 5
    x = Conv2D(512, (3, 3), activation='relu', padding='same', name='conv5_1')(
        x)
    x = Conv2D(512, (3, 3), activation='relu', padding='same', name='conv5_2')(
        x)
    x = Conv2D(512, (3, 3), activation='relu', padding='same', name='conv5_3')(
        x)
    x = MaxPooling2D((2, 2), strides=(2, 2), name='pool5')(x)

    x = Flatten(name='flatten')(x)
    x = Dense(4096, name='fc6')(x)
    x = Activation('relu', name='fc6/relu')(x)
    x = Dense(4096, name='fc7')(x)
    x = Activation('relu', name='fc7/relu')(x)
    x = Dense(7, name='fc8')(x)
    x = Activation('softmax', name='fc8/softmax')(x)

    model = Model(input, x, name='vggface_vgg16')  # load weights

    return model

if __name__ == '__main__':
    model = VGG16()
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

    #model.predict(X_train)    
    history = train_model(model, X_train, Y_train, X_private_test, Y_private_test)
       
