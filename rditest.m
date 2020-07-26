clear
directory = 'lunar';
fileNames = GenerateImageList('lunar','jpg');

tic
pictures = cell (1,length(fileNames));
for i = 1 : length(fileNames)
    s=sprintf('%s\\%s',directory,fileNames{i});
    pictures{i} = imread(s);
end
toc

tic
s=cellfun(@(a) sprintf('%s\\%s',directory,a),fileNames,'UniformOutput',false);
pictures = cellfun(@(a) imread(a),s,'UniformOutput',false);
toc