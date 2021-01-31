function cells = name_value_pairs(varargin)
    if nargin == 0 || rem(nargin, 2) ~= 0
        cells = {};
        return;
    end
    
    cells = cell(length(varargin) / 2, 2);
    y = 1;
    
    for j = 1:2:length(varargin)
        if ~ischar(varargin{j})
            cells = {};
            return;
        end
        
        cells{y, 1} = varargin{j};
        cells{y, 2} = varargin{j+1};
        y = y + 1;
    end
end
