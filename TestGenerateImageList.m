function [mark] = TestGenerateImageList(mode,specifiedFunctionName)
% Tests the GenerateImageList function either with test or marking data
% note that no marks are awarded if the function returns values of the
% wrong type.
%
% It has two optional arguments, mode and specifiedFunctionName,
% mode specifies whether to use test or marking data
% (marking data is only provided after the deadline is passed)
% specifiedFunctionName can be used to specify a different filename for
% the function in the event that the author has mispelt their function name
%
% Example calls
%
% >> TestGenerateImageList
% This will test a function called GenerateImageList, using the test data
%
% >> TestGenerateImageList('mark')
% This will use the marking data rather than test data
% Remember marking data isn't released until after the deadline
% It will be similar to (but not identical to) the test data
%
% >> TestGenerateImageList('test','GenerateImageList')
% This will test the function called GenerateImageList
%
% >> TestGenerateImageList('mark','GenerateImageList')
% This will test the function called GenerateImageList using the marking data
% rather than the test data.
%
% Remember GenerateImageList takes two inputs in the following order:
% 1) A string containing the name of the directory the images are contained in
% 2) A string containing the file extension of the images to fetch
%
% It returns one output:
% A 1xn 1D cell array containing n strings where each element is the 
% filename of an image from the specified directory that has a particular 
% file extension 
%
% author: Peter Bier

% default the mode and function name, if no optional args specified
if nargin == 0
    mode = 'test'; % default to using test data
    functionName = 'GenerateImageList';
    
elseif nargin == 1
    % one input argument, mode will have been specified, no need to default
    % default functionName to that expected
    functionName = 'GenerateImageList';
else
    % two inputs, mode and specified function name both passed in
    % no need to default mode but set functionName
    functionName = specifiedFunctionName;
end

pwd

% set up data with inputs and expected outputs
% can use test data or marking data
% marking data only supplied after the due date
if strcmp(mode,'test')
    load TestDataGenerateImageList;
else
    try
        load MarkingDataGenerateImageList;
    catch ex
        disp('Error loading marking data');
        %disp(ex);
        disp('Marking data is not released until after the due date')
        disp('Once released you need to put in in the TestScripts directory')
        return
    end    
end
input1 = GenerateImageListInput1;
input2 = GenerateImageListInput2;

% set up the base directory to be the one containing 
% TestGenerateImageList.m
% this directory will also contain a number of subfolders and images
basedir = which('TestGenerateImageList');
basedir = basedir(1:(length(basedir)-length('TestGenerateImageList.m')));
expectedOutput1 = GenerateImageListExpectedOutput;

purpose = GenerateImageListTestPurpose;

totalPassed = 0;
numTests = length(input1);

% run all tests, comparing expected output against actual output
for i = 1:numTests
    m = sprintf('%s Test %i\n\tPurpose:\t%s \n\tResult:\t\t', functionName, i, purpose{i});
    
    try
        
        output1{i} = feval(functionName,[basedir input1{i}],input2{i});
        % check if result returned closely matches the expected result
      
        if isequal(expectedOutput1{i},output1{i})
            totalPassed = totalPassed + 1;
            disp([m 'Passed test']);
        else
            disp([m 'FAILED test']);
        end
        
    catch ex
        disp([m 'FAILED test']);
        ProcessMarkingException(ex, functionName)
    end
    
end

% display marks summary
allocatedMarks = 3;
mark = ProcessMarksSummary(functionName,totalPassed,numTests,allocatedMarks);


