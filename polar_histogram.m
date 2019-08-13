function polar_histogram(angles)

polarhistogram(angles*pi/180, 18)

Ax = gca; % current axes
Ax.ThetaGrid = 'on';
Ax.RGrid = 'on';
Ax.RTickLabel = []; 
Ax.ThetaTickLabel = [];

end