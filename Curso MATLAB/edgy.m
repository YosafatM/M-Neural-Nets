function M = edgy(img)
    shape = size(img);
    M = uint8(zeros(shape(1)-2, shape(2)-2));
    cx = [-1 0 1; -2 0 2; -1 0 1];
    cy = [1 2 1; 0 0 0; -1 -2 -1];
    
    for j = 2:shape(1)-1
       for k = 2:shape(2)-1
           A = double(img(j-1:j+1, k-1:k+1));
           sx = sum(dot(cx, A));
           sy = sum(dot(cy, A));
           M(j-1, k-1) = uint8(sqrt(sx^2 + sy^2));
       end
    end
end

