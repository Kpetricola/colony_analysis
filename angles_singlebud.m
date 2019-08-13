function angles = angles_singlebud(DMGT, x, y)

% Number of triads
N = size(DMGT, 1);

% Initialize output
angles = [];

% Loop through triads
for i=1:N
    
    % Calculate number of daughter cells
    ds = DMGT(:,2)==i;
    nd = sum(ds);
    
    % Do not analyze triads with multiple daughters
    if nd>1
        continue
    end
    
    % Do not analyze triads without a grandmother
    if DMGT(i,3)==0
        continue
    end
    
    % X and Y coordinates of grandmother (G), mother (M), and daughter (D) cells
    xD = x(DMGT(i, 1));
    yD = y(DMGT(i, 1));
    xM = x(DMGT(i, 2));
    yM = y(DMGT(i, 2));
    xG = x(DMGT(i, 3));
    yG = y(DMGT(i, 3));
    
    % Vectors from G to M, and from M to D
    vGM = [xM - xG, yM - yG];
    vMD = [xD - xM, yD - yM];
    
    % Use the dot product to calculate the absolute value of the angle
    % between the vectors
    theta = acos(dot(vGM, vMD)/(norm(vGM)*norm(vMD)));
    
    % Use the cross product to calculate the sign of the angle between the
    % vectors. Positive corresponds to budding in a CW direction, and
    % negative in a CCW direction
    cross_product = cross([vGM, 0], [vMD, 0]);
    theta = -theta*sign(cross_product(3));
    
    % Convert from radians to degrees
    theta = theta*180/pi;
    
    % Append angle
    angles = [angles; theta]; %#ok<AGROW>
end

end