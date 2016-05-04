function w = lv2(a,b,c,d,t,x0)
%w = lv2(a,b,c,d,t,x0)
% Returns matrix w that contains population numbers of prey and predators
% in Lotke-Volterra model given numbers a,b,c,d; the times observances
% are made as vector t and the starting size of the populations as vector
% x0 (x0(1) are prey, x0(2) are predators).

% Lotka-Volterra functions constructed
f = @(t,x)[a*x(1)-b*x(1)*x(2); c*x(1)*x(2)-d*x(2)];

% Runge-Kutta used to obtain solution
w = rk2(f,t,x0);
