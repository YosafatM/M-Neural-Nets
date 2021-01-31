function [fun, last] = rfibonacci(n)
    if (n == 2)
        fun = 1;
        last = 1;
        return;
    end
    
    [fun, last] = rfibonacci(n-1);
    total = fun + last;
    last = fun;
    fun = total;
end
