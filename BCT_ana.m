% after statistics.m
% 데이터 계산
wei = zeros(2, 15);
for i = 1:15
    e1 = efficiency_wei(data_nt(:,:,i));
    e2 = efficiency_wei(data_t(:,:,i));
    wei(1, i) = e1;
    wei(2, i) = e2;
end

% 통계 분석
[h, p_val] = ttest(squeeze(wei(1, :)), squeeze(wei(2, :)));

% 값 이름 설정
valueNames = {'Non-target', 'Target'};

% 바플롯 그리기
figure;
b=bar([mean(wei(1, :)); mean(wei(2, :))]); % 그룹화된 바플롯
b.FaceColor = 'flat';
b.CData(2,:) = [.5 0 .5];
xticklabels(valueNames);
ylabel('Efficiency Value avg');

% 통계 결과 표시
text(1, max(max(wei)), sprintf('p = %.4f', p_val), 'VerticalAlignment', 'top', 'HorizontalAlignment', 'left');

saveas(gcf, 'avg_tnt_efficiency.png');
