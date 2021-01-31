W = [1 0; 0 1];
b = [1; 1];
alfa = 0.04;

p = [1 1 2 2 -1 -2 -1 -2; 1 2 -1 0 2 1 -1 -2];
t = [-1 -1 -1 -1 1 1 1 1; -1 -1 1 1 -1 -1 1 1];
j = 0;
is_complete = false;
rango = size(p);

while ~is_complete || j < 5 * rango(2)
    is_complete = true;
    
    for k = 1:rango(2)
        j = j + 1;
        fprintf('Iteracion %d\n', j);
        
        a = purelin(W * p(:, k) + b);
        e = (t(:, k) - a).^ 2;
        
        fprintf('Salida \n');
        disp(a);
        fprintf('Error \n');
        disp(e);
        
        if ~isequal(e, zeros(2, 1))
            is_complete = false;
            W = W + 2 * alfa * (t(:, k) - a)*p(:, k)';
            b = b + 2 * alfa * (t(:, k) - a);
            
            fprintf('Peso nuevo \n');
            disp(W);
            
            fprintf('Bias nuevo \n');
            disp(b);
        end
    end
end

fprintf('Peso final en la iteración %d\n', j);
disp(W);