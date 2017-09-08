A typical implementation of Neural Network would be as follows:

Define Neural Network architecture to be compiled
Transfer data to your model
Under the hood, the data is first divided into batches, so that it can be ingested. The batches are first preprocessed, augmented and then fed into Neural Network for training
The model then gets trained incrementally
Display the accuracy for a specific number of timesteps
After training save the model for future use
Test the model on a new data and check how it performs