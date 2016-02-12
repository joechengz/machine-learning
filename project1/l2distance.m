function D=l2distance(X,Z)
% function D=l2distance(X,Z)
%	
% Computes the Euclidean distance matrix. 
% Syntax:
% D=l2distance(X,Z)
% Input:
% X: dxn data matrix with n vectors (columns) of dimensionality d
% Z: dxm data matrix with m vectors (columns) of dimensionality d
%
% Output:
% Matrix D of size nxm 
% D(i,j) is the Euclidean distance of X(:,i) and Z(:,j)
%
% call with only one input:
% l2distance(X)=l2distance(X,X)
%

if (nargin==1) % case when there is only one input (X)
	%% fill in code here
    D=l2distance(X,X);

else  % case when there are two inputs (X,Z)
	%% fill in code here
    	%% fill in code here
    [d,n]=size(X);
    [d,m]=size(Z);
    S1=diag(X'*X);
    S=repmat(S1,1,m);
    R1=diag(Z'*Z);
    R=repmat(R1',n,1);
    G=innerproduct(X,Z);
    D=sqrt(S+R-2*G);

end;
%



