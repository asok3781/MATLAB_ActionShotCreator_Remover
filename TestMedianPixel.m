function [mark] = TestMedianPixel(mode,specifiedFunctionName)
% Tests the MedianPixel function either with test or marking data
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
% >> TestMedianPixel
% This will test a function called MedianPixel, using the test data
%
% >> TestMedianPixel('mark')
% This will use the marking data rather than test data
% Remember marking data isn't released until after the deadline
% It will be similar to (but not identical to) the test data
%
% >> TestMedianPixel('test','MedianPixel')
% This will test the function called MedianPixel
%
% >> TestMedianPixel('mark','MedianPixel')
% This will test the function called MedianPixel using the marking data
% rather than the test data.
%
% Remember MedianPixel takes one input:
% A 1xnx3 3D array of RGB values representing a list of pixels 
% (pixel 1 will be in column 1, pixel 2 in column 2 etc).   
% Typically n will be greater than 1 (i.e. there are two or more pixels
% in the list) but your code should still be able to handle the special 
% case of n being 1.
%
% It returns three outputs in the following order:
% 1)	The median red value, which will be the median of all the R values from the list of pixels
% 2)	The median green value, which will be the median of all the G values from the list of pixels
% 3)	The median blue value, which will be the median of all the B values from the list of pixels
%
% author: Peter Bier

% default the mode and function name, if no optional args specified
if nargin == 0
    mode = 'test'; % default to using test data
    functionName = 'MedianPixel';
    
elseif nargin == 1
    % one input argument, mode will have been specified, no need to default
    % default functionName to that expected
    functionName = 'MedianPixel';
else
    % two inputs, mode and specified function name both passed in
    % no need to default mode but set functionName
    functionName = specifiedFunctionName;
end

% set up data with inputs and expected outputs
% can use test data or marking data
% marking data only supplied after the due date
if strcmp(mode,'test')
    load TestDataMedianPixel;
else
    try
        load MarkingDataMedianPixel;
    catch ex
        disp('Error loading marking data');
        %disp(ex);
        disp('Marking data is not released until after the due date')
        disp('Once released you need to put in in the TestScripts directory')
        return
    end    
end
input1 = MedianPixelInput1;

expectedOutput1 = MedianPixelExpectedOutput1;
expectedOutput2 = MedianPixelExpectedOutput2;
expectedOutput3 = MedianPixelExpectedOutput3;

purpose = MedianPixelTestPurpose;

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
allocatedMarks = 2;
mark = ProcessMarksSummary(functionName,totalPassed,numTests,allocatedMarks);


