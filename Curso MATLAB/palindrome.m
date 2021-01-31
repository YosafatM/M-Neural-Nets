function is_pal = palindrome(string)
    if size(string) == [1 1]
        is_pal = true;
        return;
    elseif size(string) == [1 2]
        is_pal = string(1) == string(2);
        return;
    end
    
    if string(1) == string(end)
        is_pal = palindrome(string(2:end-1));
    else
        is_pal = false;
    end
end
