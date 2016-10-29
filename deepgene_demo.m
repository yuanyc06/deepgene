% DeepGene demo

function deepgene_demo()
run matconvnet/matlab/vl_setupnn;
gpus = 1;
dataDir = fullfile('data', 'data_mat_all');
outFile = 'result.txt';

data = deepgene_data_setup('dataDir', dataDir);
label = deepgene_test('data', data, 'gpus', gpus);

dataList = dir(fullfile(dataDir, '*.mat'));
dataList = {dataList.name};

fid = fopen(outFile, 'wt');
for i = 1:length(label)
    fprintf(fid, '%s %d\n', dataList{i}, label(i));
end
fclose(fid);
