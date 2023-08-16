t = 0:0.01:2*3;
t = t';
x = t;

y1 = 2 * ones(size(t));
z1 = log2(x + 0.25) + 2.5;

y2 = 4 * ones(size(t));
z2 = log2(x + 0.25) + 5;

% 创建图表
figure('Units', 'inches', 'Position', [0, 0, 6.75, 5]);

% 绘制两条曲线
hold on
plot3(x, y1, z1, 'b', 'LineWidth', 2, 'DisplayName', 'f')
plot3(x, y2, z2, 'r', 'LineWidth', 2, 'DisplayName', 'g')
hold off

grid on
xlabel('FDI')
ylabel('Quality')
zlabel('ERI')

% 设置xyz三轴范围为0到8
xlim([0, 8])
ylim([0, 6])
zlim([0, 10])
% 添加图例
legend('Location', 'NorthEast');

% 设置观察角度
% 设置方位角为 -45 度，仰角为 30 度
view([-42, 24]);  

% 去除坐标轴刻度
set(gca, 'xtick', []);
set(gca, 'ytick', []);
set(gca, 'ztick', []);

% 添加网格背景色
patch([0, 8, 8, 0], [0, 0, 6, 6], [0, 0, 0, 0], [0.8, 0.8, 0.8]); % XZ 平面

% 设置坐标轴的颜色和粗细
set(gca, 'XColor', 'k', 'YColor', 'k', 'ZColor', 'k', 'LineWidth', 1);

% 设置图表中的字体大小
set(gca, 'FontSize', 14);

% 保留网格线
grid on