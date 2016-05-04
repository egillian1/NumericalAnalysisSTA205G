function w = lv1 (r,k,t,x0)
%w = lv1 (r,k,t,x0)
% Returns w as vector containing population size by time given
% growth-factor r, maximum population capacity factor k, times of
% observations as vector t, and initial population size as value x0.

% Function for population growth
f = @(t,x)(r*x*(1-x/k));

% Solution obtained using Lotke-Volterra model
w = rk2(f,t,x0);
