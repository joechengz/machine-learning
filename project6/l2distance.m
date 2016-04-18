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

[d,n]=size(X);
% YOUR CODE (you can copy it from previous projects)
if (nargin==1) % case when there is only one input (X)
	%% fill in code here
   D = l2distance(X,X);

else  % case when there are two inputs (X,Z)
	%% fil in code here
%    A = diag(X'*X);
%    B = diag(Z'*Z); 
%    A = repmat(A,1,columns(sym(Z)));
%    B = repmat(B',columns(sym(X)),1);
%    C = (A + B - 2*X'*Z);
%    D = sqrt(C); 
    [d,n]=size(X);
    [d,m]=size(Z);
    S1=diag(X'*X);
    S=repmat(S1,1,m);
    R1=diag(Z'*Z);
    R=repmat(R1',n,1);
    G=innerproduct(X,Z);
    D=sqrt(S+R-2*G);
end;


