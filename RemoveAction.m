%This function creates an image that removes action from multiple images by
%applying a median filter
%inputs: imageCells = a 1xn 1D cell array that contains RGB images
%outputs: image = an RGB image (stored as a 3D array)
%author : Aaron Song
function image = RemoveAction (imageCells)
%convert cell array of images to 4D array of images for calculating
%median colour values; instead of cells of 3D arrays the cells become a new
%layer; a 4D array is similar to a cell array of 3D arrays, but is easier
%to use for calculations
imageArray = cat (4, imageCells{:});
%calculate median pixel and create a 3D array for new image in the 4th
%dimension, using MATLAB's built-in function median's ability to calculate
%values in a specified dimension (in this case, the 4th dimension as we
%want to find the median of the colour values between the images).
image = median (imageArray, 4);
end