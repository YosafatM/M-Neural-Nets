function salida = mcculloh(X, W, theta)
    fprintf('Entrada\n');
    disp(X);
    n = W * X;
    
    if n > theta
        salida = 1;
    else
        salida = 0;
    end
    
    fprintf('Salida %d\n\n', salida);
end

