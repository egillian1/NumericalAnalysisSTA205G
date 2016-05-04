function c = newtonbruun(x,y)
%   Newton bridging polynomial with regard to points (x,y)
%   Returns the factors of the bridging polynomial that
%   uses points (x,y) from the input vectors. The factors 
%   are returned as vector c.

% Toluleg greining, vor 2016: Verkefni I, 2 hluti
% Hofundar: 
% Dags: 

% Initialization of matrix to contain divided difference table
A = zeros(length(x),length(x)+1);

formerx = x(1);
placeholdery = y;
for g = 2:length(x)
    if formerx == x(g)
       placeholdery(g) = placeholdery(g-1); 
    end
    formerx = x(g);
end

A(:,1) = x;
A(:,2) = placeholdery;

% Populate table with calculated values
% Keep track of what column we're working with in the divided difference 
% table with j. Variable placeholderj is then the matlab column we want to
% place the values in.
for placeholderj = 3:length(x)+1
    anchorpoint = 1;
    j = placeholderj-2;
    % For loop that calculates the values to be put into column number
    % placeholderj.
    for i = 1:length(x)-j
        % Check to see if the derivative is necessary
        if (A(i+j,1)-A(i,1)) == 0
            A(i,placeholderj) = y(anchorpoint + j)/factorial(j);
        else
           anchorpoint = i;
           A(i,placeholderj) = (A(i+1,placeholderj-1)-A(i,placeholderj-1))/(A(i+j,1)-A(i,1)); 
           % A(i,placeholderj) = (A(i+1,placeholderj-1)-A(i,placeholderj-1))/(A(i+j,1)-A(i,1));
        end
    end
end

A = A

% Take the top line of the divided difference table and return the values
% calculated.
c = A(1,:);
