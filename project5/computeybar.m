function ybar=computeybar(xTe)
% function [ybar]=ybar(xTe);
% 
% computes the expected label 'ybar' for a set of inputs x
% generated from two standard Normal distributions (one offset by OFFSET in
% both dimensions.)
%
% INPUT:
% xTe | a 2xn matrix of column input vectors
% 
% OUTPUT:
% ybar | a 1xn vector of the expected label ybare(x)
%

global OFFSET;

[~,n]=size(xTe);
ybar=zeros(1,n);

% Feel free to use the following function to compute p(x|y)
normpdf=@(x,mu,sigma)   exp(-0.5 * ((x - mu)./sigma).^2) ./ (sqrt(2*pi) .* sigma);

Pxy1 = normpdf(xTe, 0, 1);
Pxy1 = Pxy1(1, :) .* Pxy1(2, :);
Pxy2 = normpdf(xTe, OFFSET, 1);
Pxy2 = Pxy2(1, :) .* Pxy2(2, :);

Py1 = 0.5;
Py2 = 0.5;

sumPx = Py1 .* Pxy1 + Py2 .* Pxy2;

Py1x = Py1 .* Pxy1 ./ sumPx; 

Py2x = Py2 .* Pxy2 ./ sumPx; 

y1 = 1;
y2 = 2;

ybar = y1 .* Py1x + y2 .* Py2x; 