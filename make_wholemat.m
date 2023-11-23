for i=1:15
    % i를 2자리로 표현한 문자열 생성
    paddedIndex = sprintf('%02d', i);

    % 파일 이름 생성
    filename = ['Data_Sample' paddedIndex '.mat'];
    filename_save1 = ['whole-ear' paddedIndex '.mat'];
    filename_save2 = ['whole_scalp' paddedIndex '.mat'];

    % 파일 로드
    load(filename);
    raw_data1 = epo_tr.x(:,37:50,:);
    raw_data2 = epo_tr.x(:,1:32,:);

    save(filename_save1,"raw_data1")
    save(filename_save2,"raw_data2")
end

