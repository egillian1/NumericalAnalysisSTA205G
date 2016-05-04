function p = normd(x,m,s)
%p = NORMD(x,m,s)
% Returns the standard normal cumulative distribution function value for 
% given x, mu and sigma values 

% Toluleg greining, vor 2015: Verkefni II, 1 hluti
% Hofundar: 
% Dags: 

% If m and s are not exclusively set
if(nargin == 1)
    m = 0;
    s = 1;
end

% Pre-allocation for speed
p = zeros(length(x),1);

% CDF integral and accompanying fraction
functionToIntegrate = @(x)(exp(-(((x - m).^2)/(2*(s.^2)))));
fractionForIntegration = 1/(s * sqrt(2*pi));

% Special case where x is equal to the expected value
if(x == m)
    p = 0.5;
    return
end

% If x > m we know the integral from -inf to m is equal to 0.5
if(x > m)
    for g = 1:length(x)
        exes = linspace(m,x(g),50);
        whys = functionToIntegrate(exes);
        p(g) = 0.5 + (fractionForIntegration * trap(whys,exes));
    end
else
    % If x < m we know the integral is 0.5 minus the integral from x to m
    for g = 1:length(x)
        exes = linspace(x(g),m,50);
        whys = functionToIntegrate(exes);
        p(g) = 0.5 - (fractionForIntegration * trap(whys,exes));
    end    
end

p = p';