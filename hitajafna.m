function hitajafna(x0,y0,x1,y1,n)
%
%   hitajafna(x0,y0,x1,y1,n)
%

% Create coefficient vectors
ak = l2sin(x0,y0,n);
bk = l2sin(x1,y1,n);

% Initialize meshgrid for graph
[X,Y] = meshgrid(linspace(0,pi,100),linspace(0,1,100));

% Create function u to be used on meshgrid

u = @(x,y)(0);
for j = 1:n
    utemp = @(x,y)(((sinh(j*(1-y)).\sinh(j))*ak(j) + ...
    (sinh(j*y).\sinh(j))*bk(j)) * sin(j*x));
    newu = @(x,y)(u(x,y) + utemp(x,y));
    u = newu;
end
mesh(u(X,Y));
