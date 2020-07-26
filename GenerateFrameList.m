%This function generates a list of the frames for other functions to use.
%This function will be used to determine which frames to extract from a
%movie file.
%inputs: frameStart = starting frame
%        step = step size
%        frames = number of frames to create
%outputs: frameValues = array of frame numbers
% author: Aaron Song
function [frameValues] = GenerateFrameList (frameStart, step, frames)
%create array using starting frame and step size and ending on the last
%frame to create the desired number of frames
frameValues = frameStart : step : frameStart + step * (frames-1);
%frameStart + step * (frames-1) calculates the last frame value in order to
%generate the desired number of frames specified in the function input
end
