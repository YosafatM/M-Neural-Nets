function hopfield(W, p, b)
    %iteración a(0)
    a = p;
    
    %siguientes iteraciones
    while true
        a_sig = satlins(W*a + b);
        
        if ~isequal(a, a_sig)
           a = a_sig;
           continue;
        end
        
        revisar(a_sig);
        break;
    end
end

function revisar(salida)
    disp(salida);
    
    if salida == naranja
        fprintf('Es una naranja\n');
    elseif salida == manzana
        fprintf('Es una manzana\n');
    else
        fprintf('No se identificó\n');
    end
end

function const = naranja
    const = [1; -1; -1];
end

function const = manzana
    const = [1; 1; -1];
end