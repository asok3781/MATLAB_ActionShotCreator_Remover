function [mark] = TestPixelDistance(mode,specifiedFunctionName)
% Tests the PixelDistance function either with test or marking data
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
% >> TestPixelDistance
% This will test a function called PixelDistance, using the test data
%
% >> TestPixelDistance('mark')
% This will use the marking data rather than test data
% Remember marking data isn't released until after the deadline
% It will be similar to (but not identical to) the test data
%
% >> TestPixelDistance('test','pixeldistance')
% This will test the function called pixeldistance
%
% >> TestPixelDistance('mark','pixeldistance')
% This will test the function called pixeldistance using the marking data
% rather than the test data.
%
% Remember PixelDistance takes two inputs in the following order:
% 1)	An array containing three elements representing a point in 3D colour space
% 2)	An array containing three elements representing a second point in 3D colour space
%
% It returns a single output, the square of the distance between the two points in 3D colour space.
%
% author: Peter Bier

% default the mode and function name, if no optional args specified
if nargin == 0
    mode = 'test'; % default to using test data
    functionName = 'PixelDistance';
    
elseif nargin == 1
    % one input argument, mode will have been specified, no need to default
    % default functionName to that expected
    functionName = 'PixelDistance';
else
    % two inputs, mode and specified function name both passed in
    % no need to default mode but set functionName
    functionName = specifiedFunctionName;
end

% set up data with inputs and expected outputs
% can use test data or marking data
% marking data only supplied after the due date
if strcmp(mode,'test')
    load TestDataPixelDistance;
else
    try
        load MarkingDataPixelDistance;
    catch ex
        disp('Error loading marking data');
        %disp(ex);
        disp('Marking data is not released until after the due date')
        disp('Once released you need to put in in the TestScripts directory')
        return
    end    
end
input1 = PixelDistanceInput1;
input2 = PixelDistanceInput2;

expectedOutput1 = PixelDistanceExpectedOutput;

purpose = PixelDistanceTestPurpose;

totalPassed = 0;
numTests = length(input1);

% run all tests, comparing expected output against actual output
for i = 1:numTests
    m = sprintf('%s Test %i\n\tPurpose:\t%s \n\tResult:\t\t', functionName, i, purpose{i});
    
    try
        
        output1{i} = feval(functionName,input1{i},input2{i});
        % check if result returned closely matches the expected result
        tol = 0.001;
        if abs(expectedOutput1{i}-output1{i})<tol
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


