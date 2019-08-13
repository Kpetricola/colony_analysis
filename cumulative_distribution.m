function cumulative_distribution(angles_GMD)

% Sort angles in ascending order
angles_GMD_sort = sort(angles_GMD);

% Plot angles in ascending order
N = length(angles_GMD);
Y = (1:N)/N;

plot(angles_GMD_sort, Y, 'LineWidth', 2)

xlim([-180, 180])
xticks([-180, -120, -60, 0, 60, 120, 180])

hold on
h1 = plot([0 0], [0 1], 'Color', [0.5 0.5 0.5]);
h2 = plot([-180 180], [0.5 0.5], 'Color', [0.5 0.5 0.5]);
hold off
uistack(h1,'bottom');
uistack(h2,'bottom');
grid on

xlabel('Angle of budding (degrees)')
ylabel('Fraction of data')

% Calculate the angles that bound fractions of the data about the median
frac = 50;
idx_bottom = round(N*(0.5-frac/2/100));
idx_top = round(N*(0.5+frac/2/100));

angle_bottom = angles_GMD_sort(idx_bottom);
angle_top = angles_GMD_sort(idx_top);

disp([num2str(frac), ' percent of data contained within: ', num2str(angle_bottom), ' and ', num2str(angle_top), '.'])

end