function [angles_GMD, angles_MD1MD2] = combine_angles()

% Enumerate files in folder
f = dir('KP_angles');

% Ignore the first three items which are not files
n = length(f)-3;

% Initialize output
angles_GMD = [];
angles_MD1MD2 = [];

% Loop through files in folder
for i=4:n+3
    
    % Specify file name and open file
    str = ['KP_angles/', f(i).name];
    m = open(str);
    
    % Append GMD triads
    angles_GMD = [angles_GMD; angles_singlebud(m.DMGT, m.x, m.y)]; %#ok<AGROW>
    
    % Append MD1MD2 triads
    angles_MD1MD2 = [angles_MD1MD2; angles_multiplebuds(m.DMGT, m.x, m.y)]; %#ok<AGROW>
end

end