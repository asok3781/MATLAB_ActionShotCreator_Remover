im=GenerateImageList('lunar','jpg');
imageArray=ReadImages('lunar',im);
tic
colourarray=cat(4,imageArray{:});
med=median(colourarray,4);
toc
% for j = 1:c
%     for i = 1:r
%         for x = 1:length(imageArray)
%             imagePixels = imageArray{x};
%             pixelList (1,x,1) = imagePixels(i,j,1);
%             pixelList (1,x,2) = imagePixels(i,j,2);
%             pixelList (1,x,3) = imagePixels(i,j,3);
%         end
%         [image(i,j,1),image(i,j,2),image(i,j,3)] = MedianPixel(pixelList);
%     end
% end