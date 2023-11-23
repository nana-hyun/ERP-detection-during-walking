load('C:\Users\nahyun\Track#5 EEG(+Ear-EEG)-based ERP detection during walking\HERMES Toolbox\Output\ear_re_indexes.mat')
%1 - pre sti / 2 - sti

% 각 cell에서 14 x 14 x 1 형태의 배열 추출
extractedArray1 = cellfun(@(x) x(:, :, 1), indexes.PSI.data, 'UniformOutput', false);
meanArray1 = mean(cat(3, extractedArray1{:}), 3);

extractedArray2 = cellfun(@(x) x(:, :, 2), indexes.PSI.data, 'UniformOutput', false);
meanArray2 = mean(cat(3, extractedArray2{:}), 3);

meanArr1 = abs(meanArray1);
meanArr2 = abs(meanArray2);
% figure 생성 및 크기 설정
figure('Position', [100, 100, 1800, 600]);

% 첫 번째 subplot (meanArray1)
subplot(1, 2, 1);
imagesc(meanArr1);
colormap('hot'); % 선택적으로 colormap 설정
colorbar; % 선택적으로 colorbar 추가

% x, y 축 레이블 추가
xlabel('X-axis');
ylabel('Y-axis');

% 제목 추가
title('Heatmap of meanArray1');

% 두 번째 subplot (meanArray2)
subplot(1, 2, 2);
imagesc(meanArr2);
colormap('hot'); % 선택적으로 colormap 설정

% 첫 번째 subplot과 colorbar 범위를 동일하게 설정
caxis([min(meanArr1(:)), max(meanArr1(:))]);
colorbar; % 선택적으로 colorbar 추가


% x, y 축 레이블 추가
xlabel('X-axis');
ylabel('Y-axis');

% 제목 추가
title('Heatmap of meanArray2');



%% 
load('C:\Users\nahyun\Track#5 EEG(+Ear-EEG)-based ERP detection during walking\ear_chanloc.mat')
% PSI_pre 및 PSI_sti 계산
PSI_pre = threshold_proportional(masked_pre_avg, 1);
PSI_sti = threshold_proportional(masked_sti_avg, 1);

% 각 subplot에 대한 edge list 생성
LL_ijw_pre = adj2edgeL(triu(PSI_pre));
LL_ijw_sti = adj2edgeL(triu(PSI_sti));  

% figure 생성/  chanloc- GSN 256
figure('Position',[100,100,1500,800]);
colormap('jet')

% 첫 번째 subplot (LL_ijw_nt)
h1 = subplot(1, 2, 1);
CE_ds.chanPairs = LL_ijw_pre(:, 1:2);
CE_ds.connectStrength = LL_ijw_pre(:, 3);
CE_ds.connectStrengthLimits = [-0.3 1];
topoplot_connect(CE_ds, chanloc);
title('rest','HorizontalAlignment', 'center', 'FontSize', 20, 'Position', [0, -0.8]); % subplot 타이틀 설정
axis off; % 축 숨기기


% 두 번째 subplot (LL_ijw_t)
h2 = subplot(1, 2, 2);
CE_ds_1.chanPairs = LL_ijw_sti(:, 1:2);
CE_ds_1.connectStrength = LL_ijw_sti(:, 3);
CE_ds_1.connectStrengthLimits = [-0.3 1];
topoplot_connect(CE_ds_1, chanloc);
title('stimuli','HorizontalAlignment', 'center', 'FontSize', 20, 'Position', [0, -0.8]); % subplot 타이틀 설정
axis off; % 축 숨기기

% 그림을 파일로 저장

saveas(gcf, 'avg_ear_vis.png');
%% 

% coolwarm colormap 정의
cool_part = bone(128);     % "cool" colormap의 파란색 부분
warm_part = flipud(pink(128));  % "winter" colormap의 흰색에서 빨간색으로 변하는 부분

% 두 부분을 합쳐서 "coolwarm" colormap 생성
cmap = [cool_part; warm_part];


% figure 생성 및 크기 설정
figure('Position', [100, 100, 1800, 600]);

% 첫 번째 subplot (meanArray1)
subplot(1, 2, 1);
imagesc(masked_pre_avg);
colormap(cmap); % 선택적으로 colormap 설정
colorbar; % 선택적으로 colorbar 추가
caxis([min(masked_sti_avg(:)), max(masked_sti_avg(:))]);
% x, y 축 레이블 추가
xlabel('X-axis');
ylabel('Y-axis');

% 제목 추가
title('avg of masked pre-stimulus');

% 두 번째 subplot (meanArray2)
subplot(1, 2, 2);
imagesc(masked_sti_avg);
colormap(cmap); % 선택적으로 colormap 설정

% 첫 번째 subplot과 colorbar 범위를 동일하게 설정

colorbar; % 선택적으로 colorbar 추가


% x, y 축 레이블 추가
xlabel('X-axis');
ylabel('Y-axis');

% 제목 추가
title('avg of masked stimulus');

saveas(gcf, 'avg_ear_hitmap.png');