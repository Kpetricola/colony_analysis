function plot_edges(DM, x, y, im)

imshow(im, [])

N = size(DM, 1);
hold on
for i=1:N
    plot(x(DM(i, 1)), y(DM(i, 1)), 'ro')
    if DM(i, 2) == 0
        continue
    end
    plot([x(DM(i, 1)), x(DM(i, 2))], [y(DM(i, 1)), y(DM(i, 2))], 'r')
end
hold off

end