function [mark] = TestMostDistantPixel(mode,specifiedFunctionName)
% Tests the MostDistantPixel function either with test or marking data
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
% >> TestMostDistantPixel
% This will test a function called MostDistantPixel, using the test data
%
% >> TestMostDistantPixel('mark')
% This will use the marking data rather than test data
% Remember marking data isn't released until after the deadline
% It will be similar to (but not identical to) the test data
%
% >> TestMostDistantPixel('test','MostDistantPixel')
% This will test the function called MostDistantPixel
%
% >> TestMostDistantPixel('mark','MostDistantPixel')
% This will test the function called MostDistantPixel using the marking data
% rather than the test data.
%
% Remember MostDistantPixel takes one input:
% A 1xnx3 3D array of RGB values representing a list of pixels 
% (pixel 1 will be in column 1, pixel 2 in column 2 etc).   
% Typically n will be greater than 1 (i.e. there are two or more pixels
% in the list) but your code should still be able to handle the special 
% case of n being 1.
%
% It returns three outputs in the following order:
% 1)	The red value of the most distant pixel
% 2)	The green value of the most distant pixel
% 3)	The blue value of the most distant pixel 
%
% author: Peter Bier

% default the mode and function name, if no optional args specified
if nargin == 0
    mode = 'test'; % default to using test data
    functionName = 'MostDistantPixel';
    
elseif nargin == 1
    % one input argument, mode will have been specified, no need to default
    % default functionName to that expected
    functionName = 'MostDistantPixel';
else
    % two inputs, mode and specified function name both passed in
    % no need to default mode but set functionName
    functionName = specifiedFunctionName;
end

% set up data with inputs and expected outputs
% can use test data or marking data
% marking data only supplied after the due date
if strcmp(mode,'test')
    load TestDataMostDistantPixel;
else
    try
        load MarkingDataMostDistantPixel;
    catch ex
        disp('Error loading marking data');
        %disp(ex);
        disp('Marking data is not released until after the due date')
        disp('Once released you need to put in in the TestScripts directory')
        return
    end    
end
input1 = MostDistantPixelInput1;

expectedOutput1 = MostDistantPixelExpectedOutput1;
expectedOutput2 = MostDistantPixelExpectedOutput2;
expectedOutput3 = MostDistantPixelExpectedOutput3;

purpose = MostDistantPixelTestPurpose;

totalPassed = 0;
numTests = length(input1);

% run all tests, comparing expected output against actual output
for i = 1:numTests
    m = sprintf('%s Test %i\n\tPurpose:\t%s \n\tResult:\t\t', functionName, i, purpose{i});
    
    try
        
        [output1(i) output2(i) output3(i)] = feval(functionName,input1{i});

        if isequal(expectedOutput1(i),output1(i)) && isequal(expectedOutput2(i),output2(i)) && isequal(expectedOutput3(i),output3(i))
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


