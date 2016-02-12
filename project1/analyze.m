function output=analyze(kind,truth,preds)	
% function output=analyze(kind,truth,preds)		
%
% Analyses the accuracy of a prediction
% Input:
% kind='acc' classification error
% kind='abs' absolute loss
% (other values of 'kind' will follow later)
% 

switch kind
	case 'abs'
		% compute the absolute difference between truth and predictions
		%fill in the code here
		e=abs(truth-preds);
        [d,n]=size(e);
        output=sum(sum(e))/(d*n);
	case 'acc' 
		%% fill in code here
        e=abs(truth-preds);
        [d,n]=size(e);
        e=e(e>0);
        num=length(e);
        output=1-(num/(d*n));
		 	
end;

