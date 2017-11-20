
close('all');
clear;

load DOHMMTrainingData;

L=length(TrainingData);
for i=1:L
    for j=1:length(TrainingData{i})
        if TrainingData{i}(j)=='H'
            NumericData{i}(j)=1;
        else
            NumericData{i}(j)=2;
        end
    end
end

pi_init_2 = [0.5 0.5]';
A_init_2 = [0.6 0.4; 0.01 0.99];
B_init_2 = [0.6 0.01; 0.4 0.99];
maxEpoch=1000;
[piTrained_2, ATrained_2, BTrained_2,SumRecProbs_2] = MultSeqTrainDoHMMBWsc(pi_init_2, A_init_2, B_init_2,NumericData(1:70), maxEpoch);

piTrained_2, ATrained_2, BTrained_2


