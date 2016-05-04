function w = rk2(f,t,alpha)
%w = RK2(f,t,alpha)
% Function for determining solutions of differential
% equations using second degree Runge-Kutta method.
% 

% Stores w values in matrix
wTemp = zeros(length(alpha),length(t));
wTemp(:,1) = alpha;

% For each column, use Runge-Kutta method for approximation
for g = 2:length(t);
    intervalLength = t(g)-t(g-1);
    fOne = intervalLength.* f(t(g-1),wTemp(:,g-1));
    fTwo = intervalLength.* f(t(g),(wTemp(:,g-1) + fOne));
    wTemp(:,g) = wTemp(:,(g-1)) + 0.5 * (fOne + fTwo);
end

% Return calculated w values
w = wTemp;
