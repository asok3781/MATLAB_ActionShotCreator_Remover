%This function calculates the most distant pixel to the median RGB values
%of a given list
%inputs: pixelList = a 1xnx3 3D array representing pixels through RGB
%                    values
%output: maxR = red value of most distant pixel
%        maxG = green value of most distant pixel
%        maxB = blue value of most distant pixel
%author : Aaron Song
function [maxR, maxG, maxB] = MostDistantPixel (pixelList)
%preallocate memory for median pixels with array of zeros
med = zeros (1, 3);
%calculate median pixels for distance calculations
[med(1), med(2), med(3)] = MedianPixel (pixelList);
%find size of column (number of pixels) for maximum value calculation
[~, c, ~] = size (pixelList);
%create a new array with dimensions of colour and column swapped to make
%pixelList in the format of the median pixel array for calculation
pixelArray = permute (pixelList, [1, 3, 2]);
%convert pixelArray to double for calculation, as maximum value of uint8
%arrays is 255
pixelArray = double (pixelArray);
%perform calculation for distance of each colour value from the median
%colour value, where the distance is the difference between the colour
%value and the median squared
distances = (pixelArray - med).^2;
%find the maximum of the sum of the distances of the three colours
%of each pixel, finding its location within pixelArray; a variable for the
%value of the maximum distance is not created as it is not used
[~, maxIndex]= max (sum (distances (:, :, 1:c)));
%retrieve maximum pixel colour values in pixelList for output and convert
%to uint8
maxR = uint8 (pixelList (1, maxIndex, 1)); %maximum for red
maxG = uint8 (pixelList (1, maxIndex, 2)); %maximum for green
maxB = uint8 (pixelList (1, maxIndex, 3)); %maximum for blue
%code repeated to create separate variables for red, green, and blue
end
