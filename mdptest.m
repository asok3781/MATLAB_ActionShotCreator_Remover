clear
pixelList = [54,50,45];
pixelList(:,:,2) = [48,52,43];
pixelList(:,:,3) = [50,41,47];
pixelList=uint8(pixelList);
% tic
% med = zeros(1,3);
% [med(1),med(2),med(3)] = MedianPixel(pixelList);
% [~, c, ~] = size (pixelList);
% pixelArray = permute(pixelList,[1,3,2]);
% sepdist = (pixelArray-med).^2;
% [i,x]= max(sum(sepdist(:,:,1:c)),[],'includenan');
% maxR = pixelList(1,x,1);
% maxG = pixelList(1,x,2);
% maxB = pixelList(1,x,3);
% toc
%preallocate memory for median pixels
med = zeros (1, 3);
%calculate median pixels for distance calculations
[med(1), med(2), med(3)] = MedianPixel (pixelList);
%find size of column (number of pixels) for maximum value calculation
[~, c, ~] = size (pixelList);
%create a new array with dimensions of colour and column swapped to make
%pixelList in the format of median pixel array for calculation
pixelArray = permute (pixelList, [1, 3, 2]);
%convert pixelArray to double for calculation as maximum value of uint8
%arrays is 255.
pixelArray = double (pixelArray);
%perform calculation for distance of each pixel, which the distance
%of the pixel is the square of the difference between colour values
distances = (pixelArray - med).^2;
%find the maximum of the sum of the distances of the three colours
%andeach image

%its location in pixelList; the maximum value is not used so a variable
%is not created for it.
[~, x]= max (sum (distances (:, :, 1:c)));
%retrieve maximum pixel colour values in pixelList for output and convert
%to uint8
maxR = uint8 (pixelList (1, x, 1)); %maximum for red
maxG = uint8 (pixelList (1, x, 2)); %maximum for green
maxB = uint8 (pixelList (1, x, 3));% maximum for blue
%code repeated to create separate variables for red green and bl
