% Fibonacci Method
function [minimum, min_value, iterations] = fibonacci_method(f, a, b, l)
    x1 = zeros(100,1);
    x2 = zeros(100,1);
    fib = zeros(20,1);
    % init
    fib(1) = 1;
    fib(2) = 1;
    for i = 2:20
        fib(i+1) = fib(i) + fib(i-1);
    end
    % find the n
    compared = (b(1) - a(1)) / l;
    n = 1;
    while fib(n) <= compared
        n = n + 1;
    end
    e = 0.0001;
    x1(1) = a(1) + (fib(n-2)/fib(n))*(b(1) - a(1));
    x2(1) = a(1) + (fib(n-1)/fib(n))*(b(1) - a(1));
    k = 1;
    while k < n - 2
        if(f(x1(k)) < f(x2(k))) % step 3
            a(k+1) = a(k);
            b(k+1) = x2(k);
            x2(k+1) = x1(k);
            x1(k+1) = a(k+1) + (fib(n-k-2)/fib(n-k))*(b(k+1) - a(k+1));
            if(k == n - 2)
                % step 5
                x1(n) = x1(n-1);
                x2(n) = x1(n-1) + e;
                if(f(x1(n)) > f(x2(n)))
                    a(n) = x1(n);
                    b(n) = b(n-1);
                else
                    a(n) = a(n-1);
                    b(n) = x2(n);
                     % terminate the algorithm
                    break;
                   
                end
            else
                k = k + 1;
            end
        else % step 2
            a(k+1) = x1(k);
            b(k+1) = b(k);
            x2(k+1) = a(k+1) + (fib(n-k-1)/fib(n-k))*(b(k+1) - a(k+1));
            x1(k+1) = x2(k);
            if(k == n - 2)
               % step 5
               x1(n) = x1(n-1);
               x2(n) = x2(n-1) + e;
               if(f(x1(n)) > f(x2(n)))
                   a(n) = x1(n);
                   b(n) = b(n-1);
               else
                   a(n) = a(n-1);
                   b(n) = x2(n);
                   % terminate the algorithm
                   break;
               end
            else
                k = k + 1;
            end
        end
    end
     % Calculate the minimum and corresponding function value 
    minimum = a(k);
    min_value = f(minimum);
    % calculate the iterations
    iterations = k; 
    


