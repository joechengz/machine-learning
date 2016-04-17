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
    D = l2distance(X, X);

else  % case when there are two inputs (X,Z)
	%% fill in code here
    [d, n]  = size(X);
    [~, m]  = size(Z);
    if (d == 1)
        xvector = X .* X;
        zvector = Z .* Z;
    else
        xvector = sum(X .* X);
        zvector = sum(Z .* Z);
    end
    S = repmat(xvector(:), 1, m);
    R = repmat(zvector,    n, 1);
    G = X' * Z;
    D = sqrt(abs(S + R - 2 * G));

end

end
