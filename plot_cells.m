function plot_cells(im, x, y)

imshow(im, []);

N = length(x);
hold on
for i=1:N
    text(x(i), y(i), num2str(i), 'FontSize', 12, 'Color', 'r')
end
hold off

end