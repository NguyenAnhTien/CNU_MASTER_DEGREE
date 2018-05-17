#
import tensorflow
import torch
import numpy
import pandas

if __name__ == '__main__':

movies_data_path = '../../datasets/ml-100k/u.item'
users_data_path = '../../datasets/ml-100k/u.user'
rating_data_path = '../../datasets/ml-100k/u.data'

#I. load dataset
#1. loading movies dataset
movies = pandas.read_csv(movies_data_path, sep='|', header=None,\
                         engine='python', encoding='latin-1')

#2. loading user dataset
users = pandas.read_csv(users_data_path, sep='|', header=None,\              
                         engine='python', encoding='latin-1') 

#.3 loading rating dataset
ratings = pandas.read_csv(rating_data_path, sep='\t', header=None,\
                         engine='python')

#II. load data for training
training_data_path = '../../datasets/ml-100k/u1.base'

training_set = pandas.read_csv(training_data_path, sep='\t')
training_set = numpy.array(training_set, dtype='int')

#III. load data for testing
test_data_path = '../../datasets/ml-100k/u1.test'
test_set = pandas.read_csv(test_data_path, sep='\t')
test_set = numpy.array(test_set, dtype='int')

"""IV. format data"""
#1. obtain the number of users
user_number = int(max(max(training_set[:, 0]), max(test_set[:, 0])))
movies_number = int(max(max(training_set[:, 1]), max(test_set[:, 1])))

#list of list
#row is user id, movie id is column

#process training set
data_tmp = []
for user_id in range(1, user_number + 1):
    movie_id = training_set[:, 1][training_set[:, 0] == user_id]
    rating_id = training_set[:, 2][training_set[:, 0] == user_id]
    ratings = numpy.zeros(movies_number)
    ratings[movie_id -1] = rating_id
    data_tmp.append(list(ratings))

training_set = data_tmp
training_set[training_set == 0] = -1
training_set[training_set == 1] = 0
training_set[training_set == 2] = 0
training_set[training_set >= 3] = 1

#format test set
data_tmp = []
for user_id in range(1, user_number + 1):
    movie_id = test_set[:, 1][test_set[:, 0] == user_id]
    rating_id = test_set[:, 2][test_set[:, 0] == user_id]
    ratings = numpy.zeros(movies_number)
    ratings[movie_id -1] = rating_id
    data_tmp.append(list(ratings))

test_set = data_tmp
test_set[test_set == 0] = -1
test_set[test_set == 1] = 0
test_set[test_set == 2] = 0
test_set[test_set >= 3] = 1

"""V. Convert data to Torch tensors"""
training_set = torch.FloatTensor(training_set)
test_set = torch.FloatTensor(test_set)

number_visible = len(training_set[0])
number_hidden = 100
batch_size = 512

"""
"""
rbm = RBM(number_visible, number_hidden)

epochs = 10

for epoch in range(1, epochs + 1):
    train_loss = 0
    s = 0.
    for user_id in range(0, user_number - batch_size, batch_size):
        vk = training_set[user_id : user_id + batch_size]
        v0 = training_set[user_id : user_id + batch_size]
        ph0,_ = rbm.sample_hidden(v0)
        for k in range(10):
            _, hk = rbm.sample_hidden(vk)
            _, vk = rbm.sample_visible(hk)
            vk[v0 < 0] = v0[v0<0]
        phk, _ = rbm.sample_hidden(vk)
        rbm.train(v0, vk, ph0, phk)
        train_loss += torch.mean(torch.abs(v0[v0 >= 0] - vk))
        s += 1.
    print('epoch: ' + str(epoch) + ' loss: ' + str(trains_loss/s))


#testing
test_loss = 0
s = 0.
for user_id in range(user_number):
    visible = training_set[user_id : user_id + 1]
    vt = test_set[user_id : user_id + 1]
    if len(vt[vt >= 0]) > 0:
        _, hidden = rbm.sample_hidden(visible)
        _, visible = rbm.sample_visible(hidden)
        test_loss += torch.mean(torch.abs(vt[vt >= 0] - visible[visible >= 0]))
        s += 1.

print(' test loss: ' + str(test_loss/s))
