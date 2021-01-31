%% Función AND de dos entradas
% Se sabe que da 0 con {01, 10, 00} y da 1 con {11}
W = [1 1];
theta = 1;
mcculloh([0; 0], W, theta);
mcculloh([0; 1], W, theta);
mcculloh([1; 0], W, theta);
mcculloh([1; 1], W, theta);

%% Función OR de dos entradas
% Se sabe que da 1 con {01, 10, 11} y da 0 con {00} 
W = [1 1];
theta = 0;
mcculloh([0; 0], W, theta);
mcculloh([0; 1], W, theta);
mcculloh([1; 0], W, theta);
mcculloh([1; 1], W, theta);

%% Función NOT
% Se sabe que da 1 con {0}, y que da 0 con {1}
W = -1;
theta = -1;
mcculloh(0, W, theta);
mcculloh(1, W, theta);