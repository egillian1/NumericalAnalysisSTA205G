function answer = secantmethod(f, x0, x1, err)
% Find zero of function using secant method
% f is the function to be used, x0 and x1 the first two variables of the
% sequence and err is the maximum allowance of error (variation from
% correct value).

    % Array containing the values of the sequence initialized
    x = [x0,x1];
    % Length of array
    counter = 2;
    while 1
        counter = counter + 1;
        
        % Calculation of the next x in the sequence
        xone = x(counter - 1);
        xtwo = x(counter - 2);
        x(counter) = xone - (f(xone)*(xone - xtwo))/(f(xone) - f(xtwo));
        
        % Checking error on the value and evaluation
        error = abs(x(counter) - x(counter - 1));
        if(error < err)
            answer = x(counter - 1);
            return
        end
    end
    
end