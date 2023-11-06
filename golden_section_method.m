% golden ratio method
function [minimum, min_value, iterations] = golden_section_method(f, a, b, l)
    k = 1;
    x1 = zeros(1000,1);
    x2 = zeros(1000,1);
    % init
    g = 0.618;
    x1(1) = a(1) + (1 - g)*(b(1) - a(1));
    x2(1) = a(1) + g * (b(1) - a(1));
   
    while b(k) - a(k) >= l
        if(f(x1(k)) < f(x2(k)))
            a(k+1) = a(k);
            b(k+1) = x2(k);
            x2(k+1) = x1(k);
            x1(k+1) = a(k+1) + (1-g)*(b(k+1) - a(k+1));
        else %step 2
            a(k+1) = x1(k);
            b(k+1) = b(k);
            x2(k+1) = a(k+1) + g*(b(k+1) - a(k+1));
            x1(k+1) = x2(k);
        end
        k = k + 1;
    end
     % Calculate the minimum and corresponding function value 
    minimum = a(k);
    min_value = f(minimum);
    % calculate the iterations
    iterations = k; 
    


