x = 0 : 0.01: 8;
y1 = log2(x + 0.4) + 3.5;

figure;
plot(x + 1, y1, 'k', 'LineWidth', 2);

% ����xyz���᷶ΧΪ0��8
xlim([0, 10])
ylim([0, 8])

grid on;
xlabel('FDI');
ylabel('Quality');

% ȥ��������̶�
set(gca, 'xtick', []);
set(gca, 'ytick', []);
% �������������ɫ�ʹ�ϸ
set(gca, 'XColor', 'k', 'YColor', 'k', 'LineWidth', 1);

% ����ͼ���е������С
set(gca, 'FontSize', 14);