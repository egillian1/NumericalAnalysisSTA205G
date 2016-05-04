function M = daemi40hreyfimynd(t0,dt0,t)
%M = DAEMI40(t0,dt0,t)
% Draws an animated plot of a pendulum whose position is approximated using
% the Runge-Kutta method. Function requires starting time t0, starting
% position dt0 and vector with times t of positions to approximate.

% Boundaries for the animated plot
xmin = -1;
xmax = 1;
ymin = -2;
ymax = 0;

% Vector for Runge-Kutta approximation
theta0 = [t0; dt0];
% Function for position approximation
f = @(t,theta)[theta(2); -9.8*sin(theta(1))];
% Runge-Kutta approximation performed
w = rk2(f,t,theta0);

i = 1;
while 1
    % Frame number i and appropriate plot drawn
    plot(sin(w(1,i)),-cos((w(1,i))),'ro');
    hold on
    plot([0 sin(w(1,i))],[0 -cos((w(1,i)))]);

    % Define boundaries to properly fit plot
    axis([xmin,xmax,ymin,ymax]);
    axis equal
    title('Pend�ll - hermun - hreyfimynd');
    xlabel('cos(\theta)');
    ylabel('sin(\theta)');
    hold off
    % Add frame to M
    M(i) = getframe;

    % Counter to perpetuate animation
    i = mod((i + 1),length(t));
    if(i == 0)
        i = i + 1;
    end
end
