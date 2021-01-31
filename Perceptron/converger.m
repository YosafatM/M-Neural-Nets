function [W, b] = converger(p, t, W0, b0) %W0 y b0 son opcionales
    % Revisar el número de argumentos
    if nargin == 0 || nargin > 4
        error('El número de argumentos: %d, no es aceptable.', nargin);
    end

    % Verificar si las entradas son doubles
    if ~isa(p, 'double') || ~isa(t, 'double') || ...
        ~ismatrix(p) || ~ismatrix(t)
        error('Las entradas no son matrices de tipo double');
    end
    
    size_p = size(p);
    size_t = size(t);
    
    % Verificar que p y t son de la misma longitud, y que son matrices
    if size_p(2) ~= size_t(2)
        error('La matriz de entradas y la de targets no tienen el mismo ancho');
    end
    
    % Si se insertaron los argumentos opcionales se igualan con la salida
    % Si no, entonces, las igualamos con valores aleatorios
    if nargin == 4
        if ~isa(W0, 'double') || ~ismatrix(W0) || ~isequal(size(W0), [size_t(1), 2])
            error('El peso inicial no cumple con lo mínimo para la asignación');
        end
        
        if ~isa(b0, 'double') || ~ismatrix(b0) || ~isequal(size(b0), [size_t(1), 1])
            error('El bias inicial no cumple con lo mínimo para la asignación');
        end
        
        b = b0;
        W = W0;
    elseif nargin == 3
        if ~isa(W0, 'double') || ~ismatrix(W0) || ~isequal(size(W0), [size_t(1), 2])
            error('El peso inicial no cumple con lo mínimo para la asignación');
        end
        
        W = W0;
        b = randn(size_t(1), 1);
    else
        W = randn(size_t(1), 2);
        b = randn(size_t(1), 1);
    end
    
    % Comenzamos el proceso
    is_complete = false;
    j = 0;
    
    while ~is_complete
        is_complete = true;

        for k = 1:size_t(2)
            j = j + 1;
            a = hardlim(W * p(:, k) + b);
            e = error_perceptron(a, t(:, k));

            if ~isequal(e, zeros(size_t(1), 1))
                is_complete = false;
                W = W + e * p(:, k)';
                b = b + e;
            end
        end
    end
    
    fprintf('Peso final\n');
    disp(W);
    fprintf('Bias final\n');
    disp(b);
    
    % Graficado de puntos, estas variables son para el rango
    figure;
    hold on;
    grid on;
    title('Perceptron');
    max_y = []; min_y = [];
    max_x = []; min_x = [];
    
    for j = 1:length(p)
        if isempty(max_y)
            max_y = p(2, j);
            min_y = p(2, j);
            max_x = p(1, j);
            min_x = p(1, j);
        end
        
        if (p(2, j) > max_y)
            max_y = p(2, j);
        end
        
        if (p(1, j) > max_x)
            max_x = p(1, j);
        end
        
        if (p(2, j) < min_y)
            min_y = p(2, j);
        end
        
        if (p(1, j) < min_x)
            min_x = p(1, j);
        end
        
        nombre = "[ ";
        for k = 1:size_t(1)
            clase = sprintf("%d ", t(k, j));
            nombre = strcat(nombre, clase);
        end
        nombre = strcat(nombre, "]");
        
        plot(p(1, j), p(2, j), "*");
        text(p(1, j) + 0.2, p(2, j) + 0.2, nombre);
    end
    
    % Graficado de frontera
    min_x = min_x - 2;
    min_y = min_y - 2;
    max_x = max_x + 2;
    max_y = max_y + 2;
    xlim([min_x max_x]);
    ylim([min_y max_y]);
    size_w = size(W);
    
    for j = 1:size_w(1)
        x = fix(min_x):fix(max_x);
        y = ( -b(j, 1) - W(j, 1) * x ) / W(j, 2);
        plot(x, y);
    end
end

function e = error_perceptron(a,t)
    e = t - a;
end