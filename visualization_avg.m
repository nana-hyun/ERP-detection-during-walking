load('C:\Users\nahyun\chanlocs.mat')
% GC_2_nt 및 GC_2_t 계산
GC_2_nt = threshold_proportional(masked_nt_avg, 0.021);
GC_2_t = threshold_proportional(masked_t_avg, 0.021);

% 각 subplot에 대한 edge list 생성
LL_ijw_nt = adj2edgeL(triu(GC_2_nt));
LL_ijw_t = adj2edgeL(triu(GC_2_t));  

% figure 생성
figure('Position',[100,100,1500,800]);
colormap('jet')

% 첫 번째 subplot (LL_ijw_nt)
h1 = subplot(1, 2, 1);
CE_ds.chanPairs = LL_ijw_nt(:, 1:2);
CE_ds.connectStrength = LL_ijw_nt(:, 3);
CE_ds.connectStrengthLimits = [0.23 0.3];
topoplot_connect_directed(CE_ds, data);
title(['non target'],'HorizontalAlignment', 'center', 'FontSize', 20, 'Position', [0, -0.8]); % subplot 타이틀 설정
axis off; % 축 숨기기

% 두 번째 subplot (LL_ijw_t)
h2 = subplot(1, 2, 2);
CE_ds.chanPairs = LL_ijw_t(:, 1:2);
CE_ds.connectStrength = LL_ijw_t(:, 3);
CE_ds.connectStrengthLimits = [0.23 0.3];
topoplot_connect_directed(CE_ds, data);
title(['target'],'HorizontalAlignment', 'center', 'FontSize', 20, 'Position', [0, -0.8]); % subplot 타이틀 설정
axis off; % 축 숨기기

% 그림을 파일로 저장

saveas(gcf, 'avg_vis.png');
