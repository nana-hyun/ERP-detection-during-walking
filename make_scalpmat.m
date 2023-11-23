for i=1:15
    % i를 2자리로 표현한 문자열 생성
    paddedIndex = sprintf('%02d', i);

    % 파일 이름 생성
    filename = ['Data_Sample' paddedIndex '.mat'];
    filename_save1 = ['trg_scalp' paddedIndex '.mat'];
    filename_save2 = ['ntrg_scalp' paddedIndex '.mat'];

    % 파일 로드
    load(filename);
    raw_data = epo_tr.x(:,1:32,:);
    col = epo_tr.y;
    
    % 1인 열의 인덱스를 찾음
    index_col1 = find(col(2, :) == 1); % 'XXX'
    index_col2 = find(col(1, :) == 1); % 'OOO'
    
    
    % raw 데이터를 두 부분으로 나눔
    raw_ntrg = raw_data(:, :, index_col1);
    raw_trg = raw_data(:, :, index_col2);

    

    save(filename_save1,"raw_trg")
    save(filename_save2',"raw_ntrg")

end

