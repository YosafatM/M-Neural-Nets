function max = recursive_max(v)
    if size(v) == [1 1]
        max = v;
        return;
    end
    
    if (v(1) > v(end))
        max = recursive_max(v(1:end-1));
    else
        max = recursive_max(v(2:end));
    end
end