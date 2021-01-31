W = [-1 1; 2 -3];
b = [-1; 2];

p = [1 1 2 2 -1 -2 -1 -2; 1 2 -1 0 2 1 -1 -2];
t = [0 0 0 0 1 1 1 1; 0 0 1 1 0 0 1 1];
j = 0;
is_complete = false;
rango = size(p);

while ~is_complete
    is_complete = true;
    
    for k = 1:rango(2)
        j = j + 1;
        fprintf('Iteracion %d\n', j);
        
        a = hardlim(W * p(:, k) + b);
        e = error_perceptron(a, t(:, k));
        
        fprintf('Salida \n');
        disp(a);
        fprintf('Error \n');
        disp(e);
        
        if ~isequal(e, [0; 0])
            is_complete = false;
            W = W + e * p(:, k)';
            b = b + e;
            
            fprintf('Peso nuevo \n');
            disp(W);
            fprintf('Bias nuevo \n');
            disp(b);
        end
    end
end

fprintf('Peso final \n');
disp(W);
fprintf('Bias final \n');
disp(b);
