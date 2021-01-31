function fh = rpoly_builder(p)
    function polynomial = poly(x)
        function pol = builder(vector)
            l = length(vector);
            
            if  l == 1
                pol = vector;
                return;
            end
            
            pol = vector(end) .* x.^(l-1) + builder(vector(1:end-1));
        end
        
        polynomial = builder(p);
    end
    
    fh = @poly;
end