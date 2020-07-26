% Test or Mark all the eight specified functions for the 2019 matlab project
% To use this script requires a small amount of setup (see below).
%
%
% Author: Peter Bier
%
% Setup:
% You will need to add the TestScripts directory to the
% matlab path so that Matlab can find the test scripts and test data files
% To do this from within Matlab right click on the directory
% called TestScripts and choose add to path, "Selected folders and subfolders").
% Adding a directory to the Matlab path allows Matlab to locate anything
% in that directory.  This allows you to keep your test scripts separate
% from the directory your code is stored in.
% This script assumes that you will change into a working directory
% that contains the code you want to test.
% Once setup is complete you can mark code by typing TestAll from
% within your working directory.  You can also test individual functions
% using the appropriate marking script, e.g. calling TestPixelDistance will
% test the PixelDistance function.
%
% Note that if a function name is mispelled you can still use
% scripts to mark them, just specify the function name
% used as an optional argument (e.g. if the PixelDistance function is
% named incorrectly with a lower case "p" and "d", you could mark it by typing:
% TestPixelDistance('pixeldistance')

clear
clc

mode = 'mark'; % can also use 'mark' once marking data provided.

% set up list of functions to mark
functionsList = {'GenerateFrameList', 'MedianPixel', ...
    'GenerateImageList','ReadImages', 'PixelDistance', 'MostDistantPixel', ...
    'RemoveAction','ActionShot'};


divider='=======================================================';
totalMark = 0;
% Call the test function for each listed function, e.g. TestPixelDistance
for i=1:length(functionsList)
    mark(i) = feval(['Test' functionsList{i}],mode,functionsList{i});
    totalMark = totalMark + mark(i);
    input('Hit enter to continue');
    disp(divider);
end

disp(['Your total functionality mark for the 8 functions is ' num2str(totalMark) '/24'])

% Next call the timing scripts if all relevent tests passed and
% we wish to mark timing

markTiming = input('Do you wish to mark for timing? Enter y for yes, n for no:','s');

if strncmp(lower(markTiming),'y',1)
    timingMark = 0;
    
    
    % Time PixelDistance if it passed all tests
    if mark(5) == 3
        timingMark = timingMark + TimePixelDistance();
    end
    input('Hit enter to continue');
    
    % Time RemoveAction if it passed all tests
    if mark(7) == 4
        timingMark = timingMark + TimeRemoveAction();
    end
    input('Hit enter to continue');
    
    % Time ActionShot if it passed all tests
    if mark(8) == 4
        timingMark = timingMark + TimeActionShot();
    end
    
    
    disp(['Your total timing mark is ' num2str(timingMark) '/4'])
    
    
end