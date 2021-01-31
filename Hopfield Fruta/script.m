%% Inicializamos el peso y el bias
W = [0.2 0 0; 0 1.2 0; 0 0 0.2];
b = [0.9; 0; -0.9];

%% Prueba Naranja
p = [1; -1; -1];
hopfield(W, p, b);

%% Prueba Manzana
p = [1; 1; -1];
hopfield(W, p, b);

%% Prueba 1
p = [-1; -1; -1];
hopfield(W, p, b);

%% Prueba 2
p = [1; 1; 1];
hopfield(W, p, b);