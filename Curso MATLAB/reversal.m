function vector = reversal(v)
    if size(v) == [1, 2]
        vector = [v(2), v(1)];
        return;
    end
    
    vector = [v(end), reversal(v(1:end-1))];
end

