function fun = fibor(n)
    if (n < 2)
       fun = [1];
       return;
    end

    if (n == 2)
        fun = [1; 1];
        return;
    end
    
    fun = fibor(n-1);
    new = fun(end) + fun(end - 1);
    fun = [fun();  new];
end
