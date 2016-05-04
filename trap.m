function T = trap(y,x)
% T = TRAP(y,x)
% Approximation of integration of function that has values (x,y)
% using the trapezoid rule approach.

% Throw errors if parameters are not correct.
if(length(y)<2)
    error('Error: Vector y not of sufficient length.')
end

if((nargin == 2) && (length(x) > 1) && (length(y) ~= length(x)))
    error('Error: Length of vector y and length of vector x differ.')
end

% CASE I: No input in x. Length of each sub-interval between points is
% assumed to be 1 (h = 1).

if(nargin == 1)
    % Value to be returned. Add end-points of interval
    % to the sum in initialization.
    integrationSum = 0.5*y(1) + 0.5*y(length(y));
    % Add points between endpoints into sum
    for vectorPlace=2 : length(y)-1
        integrationSum = integrationSum + y(vectorPlace);
    end
    % Return calculated value
    T = integrationSum;
    return
end

% CASE II: Input in x is the length of each subinterval (h = x)

if(nargin == 2 && length(x) == 1)
    % Value to be returned. Add end-points of interval
    % to the sum in initialization.
    integrationSum = 0.5*y(1) + 0.5*y(length(y));
    % Add points between endpoints into sum
    for vectorPlace=2 : length(y)-1
        integrationSum = integrationSum + y(vectorPlace);
    end
    % Multiply all intervals by x
    integrationSum = integrationSum*x;
    % Return calculated value
    T = integrationSum;
    return
end

% CASE III: Input in x is x-values of points (x,y) of function to be
% integrated (h is relative to x and y).

% Value to be returned.
totalSum = 0;
% Numerically integrate over each subinterval and add the integral of
% the subinterval to the total sum.
for vecPlace=1 : length(y)-1
    % Length of the subinterval calculated.
    intervalLength = (x(vecPlace+1)-x(vecPlace))/2;
    % Value of integration over subinterval calculated.
    partialSum = intervalLength*(y(vecPlace+1)+y(vecPlace));
    totalSum = totalSum + partialSum;
end
% Sum returned.
T = totalSum;
