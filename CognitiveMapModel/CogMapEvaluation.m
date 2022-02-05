clear all, close all,clc;
% Evaluation script for the collaborative filtering problem. This is
% essentially the same script as the evaluation server will run for your 
% submission.
%
% It first loads an input data matrix from Data.mat, and splits the known 
% values (ratings from 1 to 5 stars) into training and testing sets. 
% It then passes the training data to your custom implementation of the 
% function 
%      PredictMissingValues.m
% in order to train, and obtain predictions for all unknown entries.
% Finally, the script compares these prediced entries to the test set,
% and computes the mean squared error (MSE).

% Setup
rand('seed', 1);  % fix random seed for reproducibility

% Constants
filename = 'DataCog.mat';
prc_trn = 0.5;  % percentage of training data
nil = 0;  % missing value indicator. could also use NaN or any other value instead

% Load data
L = load(filename);
X = L.data_all;


%Remove control group 
X = X(~ismember(X(:,2),[2]),:);
%Drop missing value participants 
X = X(~ismember(X(:,1),[135,216]),:);

n = size(X,1);

%Lable of class
y = X(:,2);
%Fix a wrong SSQ number 
X(1,1)=6.94;

%Divide into two groups, trainInd,testInd
[trainInd,valInd,testInd] = dividerand(n,0.5,0,0.5);

%Drop group member and lable
X(:,1)=[];
X(:,1)=[];

%Traing part 
SVMModel = fitcsvm(X(trainInd,:),y(trainInd,:));
ScoreSVMModel = fitPosterior(SVMModel,X(trainInd,:),y(trainInd,:));

%Testing part 
[label,score] = predict(ScoreSVMModel,X(testInd,:));

%Calculate the predict result 
match = 0;
for k = 1: length(y(testInd,:))
   if (label(k)) == y(testInd(k))
          match = match + 1;
   end
end
percentage = (match/length(y(testInd,:)))*100;
match
percentage


% sv = SVMModel.SupportVectors;
% figure
% gscatter(X(:,1),X(:,2),y)
% hold on
% plot(sv(:,1),sv(:,2),'ko','MarkerSize',10)
% legend('0','1','Support Vector')
% hold off

% idx = find(X ~= nil); % indices of existing (non-zero) ratings
% n = numel(idx);
% 
% % Split into training and testing index sets
% n_trn = round(n*prc_trn);
% rp = randperm(n); %generate a random array from 1 to n
% idx_trn = idx(rp(1:n_trn));
% idx_tst = idx(rp(n_trn+1:end));
% 
% % Build training and testing matrices Training and testing data are not
% % divided according to users, but are divided randomly in the non-zero
% % dataset
% X_trn = ones(size(X))*nil;
% X_trn(idx_trn) = X(idx_trn);  % add known training values
% 
% X_tst = ones(size(X))*nil;
% X_tst(idx_tst) = X(idx_tst);  % add known testing values
% 
% 
% % Predict the missing values here!
% X_pred = PredictMissingValues(X_trn, nil);
% 
% % Compute MSE on the test set
% rmse = sqrt(mean((X_tst(X_tst ~= nil) - X_pred(X_tst ~= nil)).^2));
% 
% disp(['Root of Mean-squared error on test set: ' num2str(rmse)]);

% plot(k,err)