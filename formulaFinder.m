% FILIP GEIB // CTU FEL KYR 2019 // B0B35LSP // HW01
close all; clear; clc;

% change YOUR private morse code
morse = '01110111010001000101000111010101000111011101110111011100';

% compute 2-power size
morseSize = pow2(ceil(log2(size(morse, 2))));

% generate stop bit binary string
stop = zeros(1, morseSize);
stop(size(morse,2) : end) = 1;
stop = sprintf('%d', stop);

% expand moorse with '-' (dnc) to match 2. power length
morse = [morse repmat('-', 1, morseSize - size(morse,2))];

% minimalize and SOP morse truth table
[morseSOP, ~, ~, morse] = minTruthtable(morse, 'ev');

% SOP char array to formula, display
morseFormula = SOP2formula(morseSOP);
disp(['Morse formula: ' morseFormula]);

% minimalize and SOP stop bit truth table
[stopSOP, ~, ~, stop] = minTruthtable(stop, 'ev');

% SOP char array to formula, display
stopFormula = SOP2formula(stopSOP);
disp(['Stop  formula: ' stopFormula]);
