import os
import numpy as np
import pandas as pd
from scipy.misc import imread
from sklearn.metrics import accuracy_score
import tensorflow as tf 

#To stop potential randomness
seed = 128
rng = np.random.RandomState(seed)

#the first step is to set directory paths, for safekeeping
CNU_HOME = os.environ['CNU_ROOT']
datasets_path = os.path.join(CNU_HOME, 'datasets',\
                                       'neural_network_tensorflow',\
                                       'digit_recognizer')

#reading datasets
train = pd.read_csv(os.path.join(datasets_path, 'train.csv'))
test = pd.read_csv(os.path.join(datasets_path, 'test.csv'))
sample_submission = pd.read_csv(os.path.join(datasets_path,\
                                             'sample_submission.csv'))

train.head()

img_name = rng.choice(train.filename)
print img_name