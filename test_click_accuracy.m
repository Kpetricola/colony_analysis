function displacement = test_click_accuracy()

s = 300;    % Image size
r = 13;     % Cell radius

N = 20;     % Number of tests

displacement = zeros(N, 1);

for i=1:N
    % Plot circle at random position
    msk = zeros(s);
    x = randi(s-2*r)+r;
    y = randi(s-2*r)+r;
    msk(y, x) = 1;
    dst = bwdist(msk);
    imshow(dst, [])
    msk = dst < r;
    imshow(msk)
    set(gcf, 'Position', [580.6, 267, 478.4, 477.6])
    
    % User to click center of circle
    [xu, yu] = getpts;
    
    % Distance from click to center of circle
    displacement(i) = sqrt((xu-x)^2 + (yu-y)^2);
end

% Print average displacement and associated error in angle
displacement_mean = mean(displacement);
disp(['Average displacement: ', num2str(displacement_mean), ' pixels'])

error_in_angle = atan(displacement_mean/(2*r));
disp(['Error in angle: ', num2str(error_in_angle), ' degrees'])

end