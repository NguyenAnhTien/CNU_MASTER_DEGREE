
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

% Initialize the HMM with the first set of values.
pi_init_1 = [0.6 0.4]';
A_init_1 = [0.6 0.4; 0.6 0.4];
B_init_1 = [0.6 0.2; 0.4 0.8];

% Then use function MultSeqTrainDoHMMBWsc to train the HMM with the Baum-Welch training
% algorithm.

maxEpoch=1000;
[piTrained_1, ATrained_1, BTrained_1, SumRecProbs_1]=...
    MultSeqTrainDoHMMBWsc(pi_init_1, A_init_1, B_init_1, ...
    NumericData(1:70), maxEpoch);

pi_init_2 = [0.5 0.5]';
A_init_2 = [0.6 0.4; 0 1];
B_init_2 = [0.6 0; 0.4 1];
maxEpoch=1000;
[piTrained_2, ATrained_2, BTrained_2, SumRecProbs_2]=...
    MultSeqTrainDoHMMBWsc(pi_init_2, A_init_2, B_init_2, ...
    NumericData(1:70), maxEpoch);
% 
% piTrained_2, ATrained_2, BTrained_2
% 
% 
% % Now compute the Viterbi score for each of the remaining 30 symbol sequences in
% % file DOHMMTrainingData.mat.
% for i=1:30
%     [ViterbiScoreScaled1(i),BestPath1{i}] = VitDoHMMsc(...
%         piTrained_1,ATrained_1,BTrained_1,NumericData{i});
%     
%     [ViterbiScoreScaled2(i),BestPath2{i}] = VitDoHMMsc(...
%         piTrained_2,ATrained_2,BTrained_2,NumericData{i});
% end
% 
% ViterbiScoreScaled1
% BestPath1
O = cell2mat(NumericData);
[ViterbiScoreScaled1,BestPath1] = VitDoHMMsc(...
         piTrained_1,ATrained_1,BTrained_1, O);
[ViterbiScoreScaled2,BestPath2] = VitDoHMMsc(...
         piTrained_2,ATrained_2,BTrained_2, O);
best_path_1 = real(BestPath1);
best_path_2 = real(BestPath2);
