function [ answer ] = logistic( x0, r, m )
% Logistic function
%   Function for calculating points and plotting
%   them with the series given by the
%   formula x_{n+1} = rx_n(1-x_n)
    answer(1,1) = x0; % Set first value in vector
    for i = 2:m
        % Calculate value using previous value and formula
        answer(1,i) = r * answer(1,(i-1)) * (1 - answer(1,(i-1)));
    end
    %plot(answer);
    %%% Code to add scatter points for
    %%% bifurcation plotting:
    for l = 991:m
        hold on;
        scatter(r,answer(1,l));
    end
end