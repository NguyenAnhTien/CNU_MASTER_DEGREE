"""
File: rbm.py
============

Copyright (c) Tien Anh Nguyen

@brief
@detail
"""

import torch

class RBM(object):
    def __init__(self, number_visible, number_hidden):
       """
       torch.randn return a tensor which is filled with random numbers from a
       normal distribution with mean 0 and variance 1 and 
       shape = (number_visible(row), number_hidden(column))
       """
       self.W = torch.randn(number_hidden, number_visible)
       self.a = torch.randn(1, number_hidden) #bias of hidden nodes
       self.b = torch.randn(1, number_visible) #bias of visible nodes

    def sample_hidden(self, visible_output):
        wx = torch.mm(visible_output, self.W.t()) 
        activation = wx + self.a.expand_as(wx)
        prob_h_given_v_vector = torch.sigmoid(activation)
        #prob_hidden_given_visible is one-hot vector
        prob_h_given_v = torch.bernoulli(prob_h_given_v_vector)
        return prob_h_given_v_vector, prob_h_given_v

    def sample_visible(self, hidden_output):
        wy = torch.mm(hidden_output, self.W)
        activation = wy + self.b.expand_as(wy)
        prob_v_given_h_vector = torch.sigmoid(activation)
        prob_v_given_h = torch.bernoulli(prob_v_given_h_vector)
        return prob_v_given_h_vector, prob_v_given_h

    def train(self, v0, vk, ph0, phk):
        self.W += torch.mm(v0.t(), ph0) - torch.mm(vk.t(), phk)
        self.b += torch.sum((v0 - vk), 0)
        self.a += torch.sum((p0 - phk), 0)
