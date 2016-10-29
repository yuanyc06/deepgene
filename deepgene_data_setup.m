function geneData = deepgene_data_setup(varargin)

opts.dataDir = fullfile('data','data_mat_all') ;
% opts.featNum = 22834;
opts.sampleNum = 3122;
opts.classEleSelected = 5;
opts.simThd = 0.7;
opts.geneLocNum = 800;

dataList = dir(fullfile(opts.dataDir, '*.mat'));
dataList = {dataList.name};
dataNum = length(dataList);

% CGF
clusterName = fullfile('model', ['cluster_data_', num2str(opts.simThd), '.mat']);
load(clusterName);
classes = 1:max(vecClass2);
geneSelected = [];
for i = classes
    if length(find(vecClass2==i)) >= opts.classEleSelected
        currGeneSelected = classSort{i}(1:opts.classEleSelected);
        geneSelected = [geneSelected; currGeneSelected];
    end
end
geneSelected = sort(geneSelected, 'ascend');

% ISR
geneData = zeros(length(geneSelected) + opts.geneLocNum, opts.sampleNum);
for i = 1:dataNum
    gene = load(fullfile(opts.dataDir, dataList{i}));
    gene = gene.feat;
    gene1 = gene(geneSelected);
    geneZero = find(gene == 0);
    [~, geneIdx] = sort(gene, 'descend');
    geneIdx = geneIdx(1:opts.geneLocNum);
    gene2 = geneIdx;
    gene2(ismember(gene2, geneZero)) = 0;
    vecFrame = zeros(opts.geneLocNum, 1);
    geneIdx = sort(gene2(gene2>0), 'ascend');
    vecFrame(1:length(geneIdx)) = geneIdx;
    gene2 = vecFrame;
    geneData(:,i) = [gene1; gene2];
end

geneData = single(geneData);