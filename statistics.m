%__________________________________________________________________________
%
% This code is written for students' practice in Computational Neuroscience
% class (06474-01). Please contact this e-mail (minjilee@catholic.ac.kr) 
% for more information.
%__________________________________________________________________________

load('sampledata_stat.mat')

% statistics
pvals = zeros(27,27);

for i = 1:27
    for j = 1:27

        pre = squeeze(squeeze(data1(i,j,:)));
        post = squeeze(squeeze(data2(i,j,:)));

        [h,pvals(i,j)] = ttest2(pre,post);
        
    end
end

all_mask = zeros(27,27);
for i = 1:27
    for j = 1:27
        if pvals(i,j) < 0.05
            all_mask(i,j) = 1;
        end
    end
end
