% bisection method 
function [minimum, min_value, iterations] = bisection_algorithm(f, a, b, e, l)
    k = 1;
    x1 = zeros(100,1);
    x2 = zeros(100,1);
    
    while b(k) - a(k) >= l
         x1(k) = (a(k)+b(k))/2 - e;
         x2(k) = (a(k)+b(k))/2 + e;
        if(f(x1(k)) < f(x2(k)))
            a(k+1) = a(k);
            b(k+1) = x2(k);
        else
            a(k+1) = x1(k);
            b(k+1) = b(k);
        end
        k = k + 1;
    end
     % Calculate the minimum and corresponding function value 
    minimum = a(k);
    min_value = f(minimum);
    % calculate the iterations
    iterations = k; 
    


