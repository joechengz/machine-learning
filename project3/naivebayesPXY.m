function [posprob,negprob] = naivebayesPXY(x,y)
% function [posprob,negprob] = naivebayesPXY(x,y);
%
% Computation of P(X|Y)
% Input:
% x : n input vectors of d dimensions (dxn)
% y : n labels (-1 or +1) (1xn)
%
% Output:
% posprob: probability vector of p(x|y=1) (dx1)
% negprob: probability vector of p(x|y=-1) (dx1)
%

% add one all-ones positive and negative example
[d,n]=size(x);
x=[x ones(d,2)];
y=[y -1 1];

[d,n] = size(x);
%% fill in code here
s1 = sum(x);
%xalpha = sum(x,2);
posidx = find(y==1);
negidx = find(y==-1);
m=sum(sum(x));
posm = x(:,posidx);
negm = x(:,negidx);
posprob = sum(posm,2)/sum(s1(posidx));
%posprob = factorial(m)*(postheta.^xalpha)/prod(factorial(xalpha));
negprob = sum(negm,2)/sum(s1(negidx));
%negprob = factorial(m)*(negtheta.^xalpha)/prod(factorial(xalpha));

