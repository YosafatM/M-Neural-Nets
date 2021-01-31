function grade = grader(f1, f2, varargin)
    grade = true;
    
    for j = 1:length(varargin)
        if (f1(varargin{j}) ~= f2(varargin{j}))
            grade = false;
            return;
        end
    end
end

