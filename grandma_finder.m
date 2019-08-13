function DMG = grandma_finder(DM)

% Given a table that defines the mother of each cell, finds the grandmother of each cell

N = size(DM, 1);

g = zeros(N, 1);

for i=1:N
    m = DM(i, 2);
    % Skip cell without mother cell (ie first cell in colony)
    if m == 0
        continue
    end
    g(i) = DM(m, 2);
end

DMG = [DM, g];

end