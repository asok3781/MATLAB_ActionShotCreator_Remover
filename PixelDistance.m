%This function calculates the distance between two pixels
%inputs: pixel1 = an array containing 3 values correspoinding to a pixel in
%                 a 3D colour space
%        pixel2 = another array containing 3 values correspoinding to a
%                 pixel in 3D colour space
%output: pixelDist = the square of the distance between the two points
%author: Aaron Song
function [pixelDist] = PixelDistance (pixel1, pixel2)
%convert pixels to double arrays for calculation as maximum value for uint8
%is 255
pixel1 = double (pixel1);
pixel2 = double (pixel2);
%perform calculation of distance between pixels, where the distance between
%pixels is the sum of the square of the differences of each of the colour
%values between two pixels
pixelDist = (pixel1(1) - pixel2(1))^2 + (pixel1(2) - pixel2(2))^2 + (pixel1(3) - pixel2(3))^2;
end