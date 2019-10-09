function [susta, vhdl] = SOP2formula(data)
% FILIP GEIB // CTU FEL KYR 2019 // B0B35LSP // HW01
    
    % find out bit size
    bitSiz = size(data, 2);
    
    % prepare out as cell
    susta = cell(size(data,1), 1);
    vhdl = cell(size(data,1), 1);

    % go thru data
    for row = 1 : size(data, 1)
        % create tmp for row formula
        tmpSusta = '('; %#ok<*AGROW>
        tmpVhdl = '('; %#ok<*AGROW>
        
        % go thru every bit
        for bit = 1 : bitSiz
            % check if bit present
            if data(row, bit) == '1'
                % if required add '*'
                if size(tmpSusta,2) > 1
                   tmpSusta = [tmpSusta '.']; 
                   tmpVhdl = [tmpVhdl ' and '];
                end
                % add bit to row formula
                tmpSusta = [tmpSusta sprintf('X%d', bitSiz - bit)];
                tmpVhdl = [tmpVhdl sprintf('%c', char(bit + 64))];
            % check if bit negation present
            elseif data(row, bit) == '0'
                % if required add '*'
                if size(tmpSusta, 2) > 1
                   tmpSusta = [tmpSusta '.'];
                   tmpVhdl = [tmpVhdl ' and '];
                end
                % add bit to row formula
                tmpSusta = [tmpSusta sprintf('X%d''', bitSiz - bit)];
                tmpVhdl = [tmpVhdl sprintf('not %c', char(bit + 64))];
            end
        end
        
        % close bracket
        tmpSusta = [tmpSusta ')'];
        tmpVhdl = [tmpVhdl ')'];

        % add row to cell array
        susta(row) = {tmpSusta};
        vhdl(row) = {tmpVhdl};
    end
    
    % merge rows with '+' / 'or'
    susta = strjoin(susta, '+');
    vhdl = strjoin(vhdl, ' or ');
    
end

