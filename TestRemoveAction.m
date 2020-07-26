function [mark] = TestRemoveAction(mode,specifiedFunctionName)
% Tests the RemoveAction function either with test or marking data
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
% >> TestRemoveAction
% This will test a function called RemoveAction, using the test data
%
% >> TestRemoveAction('mark')
% This will use the marking data rather than test data
% Remember marking data isn't released until after the deadline
% It will be similar to (but not identical to) the test data
%
% >> TestRemoveAction('test','RemoveAction')
% This will test the function called RemoveAction
%
% >> TestRemoveAction('mark','RemoveAction')
% This will test the function called RemoveAction using the marking data
% rather than the test data.
%
% Remember RemoveAction takes one input
% A 1xn 1D cell array containing n images, where each element is an RGB 
% image (recall RGB images stored as 3D arrays of uint8 values ranging from 0 to 255).
%
%It returns one output:
% An RGB image (stored as 3D arrays of uint8 values ranging from 0 to 255) 
% that was obtained by taking the median RGB values of the stack of corresponding pixels from the source images.
%
% author: Peter Bier

% default the mode and function name, if no optional args specified
if nargin == 0
    mode = 'test'; % default to using test data
    functionName = 'RemoveAction';
    
elseif nargin == 1
    % one input argument, mode will have been specified, no need to default
    % default functionName to that expected
    functionName = 'RemoveAction';
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
    load TestDataRemoveAction;
else
    try
        load MarkingDataRemoveAction;
    catch ex
        disp('Error loading marking data');
        %disp(ex);
        disp('Marking data is not released until after the due date')
        disp('Once released you need to put in in the TestScripts directory')
        return
    end    
end
input1 = RemoveActionInput;

expectedOutput1 = RemoveActionExpectedOutput;

purpose = RemoveActionTestPurpose;

totalPassed = 0;
numTests = length(input1);

% run all tests, comparing expected output against actual output
for i = 1:numTests
    m = sprintf('%s Test %i\n\tPurpose:\t%s \n\tResult:\t\t', functionName, i, purpose{i});
    
    try
        
        output1{i} = feval(functionName,input1{i});
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
allocatedMarks = 4;
mark = ProcessMarksSummary(functionName,totalPassed,numTests,allocatedMarks);


