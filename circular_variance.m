function circular_variance(angles)

% Number of angles
N = length(angles);

% Initialize vectors to store X and Y coordinates of each unit vector
X = zeros(N, 1);
Y = zeros(N, 1);

% Loop through angles and plot each unit vector
hold on
for i=1:N
    theta = angles(i)*pi/180;
    X(i) = cos(theta);
    Y(i) = sin(theta);
    plot([0 X(i)], [0 Y(i)], 'b')
end

% Calculate the average X and Y coordinates (the resultant vector)
X_bar = mean(X);
Y_bar = mean(Y);

plot([0 X_bar], [0 Y_bar], 'r', 'LineWidth', 3)

hold off

% Calculate the angle of the resultant vector
theta = atan(Y_bar/X_bar);
theta_deg = theta*180/pi;
disp(['Theta (degrees): ', num2str(theta_deg)])

% Calculate the circular variance as 1 minus the length of the resultant vector
R = [X_bar, Y_bar];
circ_variance = 1 - norm(R);
disp(['Circular variance: ', num2str(circ_variance)])

end