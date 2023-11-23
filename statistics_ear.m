% % 3d array
data_pre = zeros(14,14,15);
data_sti = zeros(14,14,15);
for i = 1:15
    v1 = extractedArray1{i};
    v2 = extractedArray2{i};
    for j = 1:14
        for k = 1:14
            data_pre(j,k,i) = v1(j,k);
            data_sti(j,k,i) = v2(j,k);
        end
    end
end



%% 

% statistics
pvals = zeros(14,14);

for i = 1:14
    for j = 1:14

        pre = squeeze(squeeze(data_pre(i,j,:)));
        post = squeeze(squeeze(data_sti(i,j,:)));

        [h,pvals(i,j)] = ttest(pre,post);
        
    end
end

all_mask = zeros(14,14);
for i = 1:14
    for j = 1:14
        if pvals(i,j) < 0.05
            all_mask(i,j) = 1;
        end
    end
end
%% 


dt_pre = mean(data_pre,3);
masked_pre_avg = all_mask .* dt_pre;

dt_sti = mean(data_sti,3);
masked_sti_avg = all_mask .* dt_sti;

save('masked_ear_avg.mat','masked_pre_avg','masked_sti_avg')

