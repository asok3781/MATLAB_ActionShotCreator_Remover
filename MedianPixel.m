%This function calculates the median RGB values from a list of pixels
%inputs: pixelList = a  1xnx3 3D array that represents a list of pixels
%outputs: medRed = the median red value of R values from pixelList
%         medGreen = the median green value of G values from pixelList
%         medBlue = the median blue value of B values from pixelList
%author: Aaron Song
function [medRed, medGreen, medBlue] = MedianPixel (pixelList)
%calculate median of red pixels
medRed = round (median (pixelList (:,:,1)));
%calculate median of green pixels
medGreen = round (median (pixelList (:,:,2)));
%calculate median of blue pixels
medBlue = round (median (pixelList (:,:,3)));
%code repeated becuase new variables are created for each colour; values
%are rounded in the case that number of pixels is even
end