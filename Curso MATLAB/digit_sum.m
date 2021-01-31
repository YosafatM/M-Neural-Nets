function sum = digit_sum(integer)
    module = rem(integer, 10);
    
    if (module == 0 && 10 > integer)
        sum = module;
    else
        sum = module + digit_sum((integer - module) / 10);
    end
end

