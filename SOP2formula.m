function [out] = SOP2formula(data)
% FILIP GEIB // CTU FEL KYR 2019 // B0B35LSP // HW01
    
    % find out bit size
    bitSiz = size(data, 2);
    
    % prepare out as cell
    out = cell(size(data,1), 1);

    % go thru data
    for row = 1 : size(data, 1)
        % create tmp for row formula
        tmp = '('; %#ok<*AGROW>
        
        % go thru every bit
        for bit = 1 : bitSiz
            % check if bit present
            if data(row, bit) == '1'
                % if required add '*'
                if size(tmp,2) > 1
                   tmp = [tmp '*']; 
                end
                % add bit to row formula
                tmp = [tmp sprintf('X%d', bitSiz - bit)];
            % check if bit negation present
            elseif data(row, bit) == '0'
                % if required add '*'
                if size(tmp, 2) > 1
                   tmp = [tmp '*'];
                end
                % add bit to row formula
                tmp = [tmp sprintf('X%d''', bitSiz - bit)];
            end
        end
        
        % close bracket
        tmp = [tmp ')'];

        % add row to cell array
        out(row) = {tmp};
    end
    
    % merge rows with '+'
    out = strjoin(out, '+');
    
end

