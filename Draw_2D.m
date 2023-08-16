x = 0 : 0.01: 8;
y1 = log2(x + 0.4) + 3.5;

figure;
plot(x + 1, y1, 'k', 'LineWidth', 2);

% 设置xyz三轴范围为0到8
xlim([0, 10])
ylim([0, 8])

grid on;
xlabel('FDI');
ylabel('Quality');

% 去除坐标轴刻度
set(gca, 'xtick', []);
set(gca, 'ytick', []);
% 设置坐标轴的颜色和粗细
set(gca, 'XColor', 'k', 'YColor', 'k', 'LineWidth', 1);

% 设置图表中的字体大小
set(gca, 'FontSize', 14);