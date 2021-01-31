p = [1 1 2 2 -1 -2 -1 -2; 1 2 -1 0 2 1 -1 -2];
t = [0 0 0 0 1 1 1 1; 0 0 1 1 0 0 1 1];
hold on;
grid on;

for j = 1:length(p)
    if t(1, j) == 0
        if t(2, j) == 0 
            color = "r*";
        else
            color = "y*";
        end
    else
        if t(2, j) == 0 
            color = "b*";
        else
            color = "g*";
        end
    end
    
    plot(p(1, j), p(2, j), color);
end

xlim([-3 3])
ylim([-3 3])
