function labelOut = deepgene_test(varargin)

opts.data = zeros(1200, 3122);
opts.gpus = [];
opts.modelDir = 'model';
opts = vl_argparse(opts, varargin) ;
opts.modelPath = fullfile(opts.modelDir, 'deepgene.mat');

% conduct testing
net = dagnn.DagNN.loadobj(load(opts.modelPath)) ;
targetLayer = net.getVarIndex('prediction');
net.vars(targetLayer).precious = 1;
if ~isempty(opts.gpus)
    gpuDevice(opts.gpus) ;
    net.move('gpu');
    opts.data = gpuArray(opts.data);
end
net.mode = 'test' ;

dataNum = size(opts.data, 2);
labelOut = zeros(dataNum, 1);
for i = 1:dataNum
    dataThis = opts.data(:, i);
    dataThis = reshape(dataThis, 1, 1, length(dataThis));
    net.eval({'input', dataThis}) ;
    prediction = gather(net.vars(targetLayer).value);
    prediction = vl_nnsoftmax(prediction);
    [~, labelOut(i)] = max(prediction);
end

