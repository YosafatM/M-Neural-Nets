function e = error_perceptron(a,t)
    if isequal(size(a), size(t))
       e = t - a;
    else
        error('No son del mismo tamaño');
    end
end

