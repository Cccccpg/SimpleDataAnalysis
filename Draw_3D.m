t = 0:0.01:2*3;
t = t';
x = t;

y1 = 2 * ones(size(t));
z1 = log2(x + 0.25) + 2.5;

y2 = 4 * ones(size(t));
z2 = log2(x + 0.25) + 5;

% ����ͼ��
figure('Units', 'inches', 'Position', [0, 0, 6.75, 5]);

% ������������
hold on
plot3(x, y1, z1, 'b', 'LineWidth', 2, 'DisplayName', 'f')
plot3(x, y2, z2, 'r', 'LineWidth', 2, 'DisplayName', 'g')
hold off

grid on
xlabel('FDI')
ylabel('Quality')
zlabel('ERI')

% ����xyz���᷶ΧΪ0��8
xlim([0, 8])
ylim([0, 6])
zlim([0, 10])
% ���ͼ��
legend('Location', 'NorthEast');

% ���ù۲�Ƕ�
% ���÷�λ��Ϊ -45 �ȣ�����Ϊ 30 ��
view([-42, 24]);  

% ȥ��������̶�
set(gca, 'xtick', []);
set(gca, 'ytick', []);
set(gca, 'ztick', []);

% ������񱳾�ɫ
patch([0, 8, 8, 0], [0, 0, 6, 6], [0, 0, 0, 0], [0.8, 0.8, 0.8]); % XZ ƽ��

% �������������ɫ�ʹ�ϸ
set(gca, 'XColor', 'k', 'YColor', 'k', 'ZColor', 'k', 'LineWidth', 1);

% ����ͼ���е������С
set(gca, 'FontSize', 14);

% ����������
grid on