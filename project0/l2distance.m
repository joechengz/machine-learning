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
    [d,n]=size(X);
    T=zeros(n,1);
    T1=X'*X;
    for i=1:n
        T(i,1)=T1(i,i);
    end;
    M=ones(1,n);
    S=T*M;
    R=M'*T';
    G=innerproduct(X);
    D=sqrt(S+R-2*G);

else  % case when there are two inputs (X,Z)
	%% fill in code here
    [d,n]=size(X);
    [d,m]=size(Z);
    T=zeros(n,1);
    T1=X'*X;
    T2=Z'*Z;
    T3=zeros(1,m);
    for i=1:n
        T(i,1)=T1(i,i);
    end;
    for i=1:m
        T3(1,i)=T2(i,i);
    end;
    M=ones(1,m);
    Q=ones(n,1);
    S=T*M;
    R=Q*T3;
    G=innerproduct(X,Z);
    D=sqrt(S+R-2*G);

end;
%



