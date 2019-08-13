function angles = angles_multiplebuds(DMGT, x, y)

% Number of triads
N = size(DMGT, 1);

% Initialize output
angles = [];

% Loop through triads
for i=1:N
    
    % Calculate number of daughter cells
    ds = DMGT(:,2)==i;
    nd = sum(ds);
    
    % Do not analyze triads with fewer than two daughers
    if nd<2
        continue
    end
    
    % Find the IDs of the first and second daughters (not necessarily in
    % the order they were created, but in the order they were clicked)
    ids = find(ds);
    da = ids(1);
    db = ids(2);
    
    % X and Y coordinates of mother (M) and daughter (DA, DB) cells
    xm = x(i);
    ym = y(i);
    xda = x(da);
    yda = y(da);
    xdb = x(db);
    ydb = y(db);
    
    % Vectors from M to DA and M to DB
    va = [xda-xm, yda-ym];
    vb = [xdb-xm, ydb-ym];
    
    % Use the dot product to calculate the absolute value of the angle
    % between the vectors
    theta = acos(dot(va, vb)/(norm(va)*norm(vb)));
    
    % Convert from radians to degrees
    theta = theta*180/pi;
    
    % Append angle
    angles = [angles; theta]; %#ok<AGROW>
end

end