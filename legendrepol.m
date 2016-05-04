function [p] = legendrepol(x,n)
%   Calculates the value of n first Legendre polynomials.
%   Uses the points from the vector x as bridging
%   points, calculates the value of the n first Legendre
%   polynomials and returns them as the vector p. 

    A = zeros(n,length(x));
    A(1,:) = ones(1,length(x));
    A(2,:) = x;
    for i = 3:n
        n = i-1;
        A(i,:) = (((2*n-1)/n)*x).*A((i-1),:)-((n-1)/n)*A((i-2),:);
    end
    p = A(n+1,:);
end
