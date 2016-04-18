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
% disp('Performing cross validation ...');
% [bestC,bestP]=crossvalidate(xTr,yTr,'rbf',2.^[-1:8],2.^[-2:3]);
% [bestC,bestP]=crossvalidate(xTr, yTr, kernel, [bestC-5:2:bestC+5], [bestP-2:0.5:bestP+2]);
% disp('Training SVM ...');
% svmclassify=trainsvm(xTr,yTr,bestC,'rbf',bestP);

kernel = 'rbf';
disp('Performing cross validation ...');
[bestC,bestP]=crossvalidate(xTr,yTr,kernel,[50,300],[0,20]);
disp('Training SVM ...');
svmclassify=trainsvm(xTr,yTr,bestC,kernel,bestP);
