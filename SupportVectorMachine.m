%Name: Anastasios Antonopoulos
%A.M:  1115201400014

%Clear console
clear; clc; close all;
%Load Dataset
load('datasets.mat');

% Define SVM model 1
M_1 = fitcsvm(x, t,'KernelFunction','rbf','KernelScale',1);

%Create crossvalidation model
crossmodel_1= crossval(M_1);

%Measure model's performance
prediction_1 = kfoldPredict(crossmodel_1);

performance_1 = classperf(t,prediction_1,'Positive',1,'Negative',0);

accuracy1 = 1 - kfoldLoss(crossmodel_1, 'LossFun', 'ClassifError');
accuracy1 = accuracy1 * 100;
sensitivity1 = performance_1.Sensitivity * 100;
specificity1 = performance_1.Specificity * 100;

%Total performance results
results_M1 = {'Accuracy:    ', 'Sensitivity: ', 'Specificity: ';
            accuracy1,sensitivity1,specificity1};
msg1 = sprintf("Results for SVM Model 1");
str1 = sprintf('%s  %.2f \n',results_M1{:});
%Display results on command window
disp(msg1);
disp(str1);

% Define SVM model 1
M_2 = fitcsvm(x, t,'KernelFunction','gaussian','KernelScale','auto');

%Create crossvalidation model
crossmodel_2= crossval(M_2);

%Measure model's performance
prediction_2 = kfoldPredict(crossmodel_2);
performance_2 = classperf(t,prediction_2,'Positive',1,'Negative',0);

accuracy2 = 1 - kfoldLoss(crossmodel_2, 'LossFun', 'ClassifError');
accuracy2 = accuracy2 * 100;
sensitivity2 = performance_2.Sensitivity * 100;
specificity2 = performance_2.Specificity * 100;

%Total performance results
results_M2 = {'Accuracy:    ', 'Sensitivity: ', 'Specificity: ';
            accuracy2,sensitivity2,specificity2};
msg2 = sprintf("Results for SVM Model 2");
str2 = sprintf('%s  %.2f \n',results_M2{:});
%Display results on command window
disp(msg2);
disp(str2);
