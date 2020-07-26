%This function reads into MATLAB a list of images, given the directory and
%filenames of the images.
%inputs: directory = a string containing the directory where the images are
%                    stored
%        fileNames = a cell array of file names
%output: pictures = a 1xn 1D cell array containing RGB images (each cell is
%                   a 3D uint8 array)
%author: Aaron Song
function [pictures] = ReadImages (directory, fileNames)
%create new cell array of directories for each files by passing a cell
%array, cell by cell through sprintf function
location = cellfun(@(i) sprintf('%s\\%s', directory, i), fileNames, 'UniformOutput', false);
%create cell array of 3D arrays for each image by passing cell array of
%directories of the images, cell by cell into imread function
pictures = cellfun(@(i) imread(i), location, 'UniformOutput', false);
end