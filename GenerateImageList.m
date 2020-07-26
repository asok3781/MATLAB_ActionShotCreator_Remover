%This function creates a list of images inside a directory of a specified
%file extension that are in a specified directory.
%inputs: directory = a string containing the name of the directory the
%                    images are in
%        fileType = a string containing the file extension of the images
%output: imageList = a 1xn 1D cell array of image names
%author: Aaron Song
function [imageList] = GenerateImageList (directory, fileType)
%create a string to scan files that are of the specified file type using
%the dir function
scanDirectory = sprintf ('%s/*.%s', directory, fileType);
%scan specified files using dir
files = dir (scanDirectory);
%create list of image names in cell array from struc array created using
%dir
imageList = {files(1:length(files)).name};
end
