function preds=knnclassifier(xTr,yTr,xTe,k);
% function preds=knnclassifier(xTr,yTr,xTe,k);
%
% k-nn classifier 
%
% Input:
% xTr = dxn input matrix with n column-vectors of dimensionality d
% xTe = dxm input matrix with n column-vectors of dimensionality d
% k = number of nearest neighbors to be found
%
% Output:
%
% preds = predicted labels, ie preds(i) is the predicted label of xTe(:,i)
%


% output random result as default (you can erase this code)
%[d,n]=size(xTe);
%[d,ntr]=size(xTr);
%if k>ntr,k=ntr;end;

%currently assigning random predictions
%un=unique(yTr);
%preds=un(ceil(rand(1,n)*length(un)));

%% fill in code here
if~exist('k','var')||isempty(k)
    k=1;
end;
[I,~]=findknn(xTr,xTe,k);
temp=0;
if(k==1)
    preds=yTr(I);
else
    knnpreds=yTr(I);
    classlabel =unique(yTr);
    nclass=length(classlabel);
    for i=1:nclass
        classcounter(i,:)=sum(knnpreds==classlabel(i));
    end;
    [~, winnerLabelIndex] = max(classcounter, [], 1);
    temp=length(unique(classcounter));
    preds=classlabel(winnerLabelIndex);
end;
while(temp==1&&k>1)
    k=k-1;
    [I,~]=findknn(xTr,xTe,k);
    if(k==1)
        preds=yTr(I);
    else
    knnpreds=yTr(I);
    classlabel =unique(yTr);
    nclass=length(classlabel);
    for i=1:nclass
        classcounter(i,:)=sum(knnpreds==classlabel(i));
    end;
    [~, winnerLabelIndex] = max(classcounter, [], 1);
    temp=length(unique(classcounter));
    preds=classlabel(winnerLabelIndex);
    end;
end;

