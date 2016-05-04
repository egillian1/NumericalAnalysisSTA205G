function [x] = legendrenull(n,err)
%   Zero points of Legendre polynomials with maximum error err
%   Finds zero points of Legendre polynomial of degree n.
%   Zero points are allowed a maximum error of size r and are
%   returned as vector x

% Initialization of zero point array
x = [];

% SYMS METHOD for finding Legendre polynomial:
%{
% Create a symbolic variable for the polynomial
y = sym('y');
% Create the appropriate Legendre polynomial
p = (1/(2.^n * factorial(n)))*diff((y.^2-1).^n,n);
% Turn the symbolic function into a function handle
p = matlabFunction(p);
%}

% RECURRENCE RELATION method for finding Legendre polynomial:
% Initialization of the first two Legendre polynomials
pstart = @(x)(1);
pend = @(x)(x);
% Set Legendre polynomial if n is 0 or 1
if n == 0
    pend = pstart;
elseif n == 1
    % If n == 1, the current Legendre polynomial is used
else
        % Calculate the Legendre polynomial to be used
        for i = 2:n
            tmp = pend;
            pend = @(x)(((2*i-1)/i)*x.*pend(x)-((i-1)/i).*pstart(x));
            pstart = tmp;
        end
end

% Decide length between points to use in binary search
spacing = ceil(0.5/err);
% Create points to be used in binary search
exes = linspace(-1,1,spacing);
% Binary search the given space and return points that
% are close enough to zero.
for i = 1:length(exes)-1
   point = helmingunaradferd(pend,exes(i),exes(i+1),err);
   if ~strcmp(point,'f')
       x = [x point];
   end
end
end
