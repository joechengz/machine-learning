function svmclassify=autosvm(xTr,yTr)
%	function svmclassify=autosvm(xTr,yTr)
% INPUT:	
% xTr : dxn input vectors
% yTr : 1xn input labels
% 
% Output:
% svmclassify : a classifier (scmclassify(xTe) returns the predictions on xTe)
%
%
% Performs cross validation to train an SVM with optimal hyper-parameters on xTr,yTr
%
disp('Performing cross validation ...');
[bestC,bestP]=crossvalidate(xTr,yTr,'rbf',2.^[-1:8],2.^[-2:3]);
%newC = log2(bestC);
%newP = log2(bestP);
%Cs = 2.^[(newC - 0.75) : 0.25 : (newC + 0.75)];
%paras = 2.^[(newP - 0.75): 0.25 : (newP + 0.75)]; 

%[bestC,bestP] = crossvalidate(xTr,yTr,'rbf',Cs,paras);
disp('Training SVM ...');
svmclassify=trainsvm(xTr,yTr,bestC,'rbf',bestP);

