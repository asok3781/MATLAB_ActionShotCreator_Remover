%This function creates an action shot image from multiple images by
%applying a median filter, calculating the most distant pixel from the
%median
%inputs: cellImages = a 1xn 1D cell array that contains RGB images in each
%                     cell element
%outputs: image = an RGB image (stored as a 3D array of uint8 values)
%author : Aaron Song
function image = ActionShot (cellImages)
%convert cell array of images to 4D array of images for calculating
%media; instead of cells of 3D arrays the cells become a new layer, it is
%similar to a cell array, but easier to use for calculations.
imgArray = cat (4 ,cellImages {:});
%convert image array to double for calculation; doing the pixel
%distance formula in uint8 caused problems where the distance maximum
%would be 255
imgArray = double (imgArray);
%perform distance calculation to find most distant pixel by finding the sum
%of the square of the difference between the colour values and median
%colour values, doing calculations element by element in the arrays
med = round (median (imgArray, 4));
difference = (imgArray - med).^2;
distance = sum (difference, 3);
%find which image the most distant pixel is in for each pixel
[~, maxIndex] = max (distance , [], 4);
%setup arrays for the creation of linear indices with sub2ind function
%arrays for rows and columns for sub2ind
[rSize, cSize, ~, ~] = size (imgArray);
[row, col] = ndgrid (1:rSize, 1:cSize);
%arrays for colour for sub2ind
red = ones (size (row));
green = repmat (2, size(row));
blue = repmat (3, size(row));
%create 3D array of linear indices to retrieve colour values from 4D array
%of images to form new image
%create indices for red
linearInd = sub2ind (size(imgArray), row, col, red, maxIndex);
%indices for blue
linearInd(:,:,2) = sub2ind (size(imgArray), row, col, green, maxIndex);
%indices for green
linearInd(:,:,3) = sub2ind (size(imgArray), row, col, blue, maxIndex);
%code repeated to form layers of 3D array
%extract colour values from 4D array of images with linear indices array to
%form new image
image = imgArray (linearInd);
%convert image back to uint8 to be able to display image
image = uint8 (image);
end