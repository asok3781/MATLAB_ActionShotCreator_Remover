function [mark] = TestGenerateFrameList(mode,specifiedFunctionName)
% Tests the GenerateFrameList function either with test or marking data
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
% >> TestGenerateFrameList
% This will test a function called GenerateFrameList, using the test data
%
% >> TestGenerateFrameList('mark')
% This will use the marking data rather than test data
% Remember marking data isn't released until after the deadline
% It will be similar to (but not identical to) the test data
%
% >> TestGenerateFrameList('test','GenerateFrameList')
% This will test the function called GenerateFrameList
%
% >> TestGenerateFrameList('mark','GenerateFrameList')
% This will test the function called GenerateFrameList using the marking data
% rather than the test data.
%
% Remember GenerateFrameList takes three inputs in the following order:
% 1)	A starting frame number
% 2)	A step size
% 3)	The number of frames to generate (n)
%
% It returns a single output, a 1xn 1D array, where n is the desired number 
% of frames (n).  The first element of the array will be the starting frame 
% number and each subsequent element will have a frame value that is the 
% step size greater than the last.
% author: Peter Bier

% default the mode and function name, if no optional args specified
if nargin == 0
    mode = 'test'; % default to using test data
    functionName = 'GenerateFrameList';
    
elseif nargin == 1
    % one input argument, mode will have been specified, no need to default
    % default functionName to that expected
    functionName = 'GenerateFrameList';
else
    % two inputs, mode and specified function name both passed in
    % no need to default mode but set functionName
    functionName = specifiedFunctionName;
end

% set up data with inputs and expected outputs
% can use test data or marking data
% marking data only supplied after the due date
if strcmp(mode,'test')
    load TestDataGenerateFrameList;
else
    try
        load MarkingDataGenerateFrameList;
    catch ex
        disp('Error loading marking data');
        %disp(ex);
        disp('Marking data is not released until after the due date')
        disp('Once released you need to put in in the TestScripts directory')
        return
    end    
end
input1 = GenerateFrameListInput1;
input2 = GenerateFrameListInput2;
input3 = GenerateFrameListInput3;
expectedOutput1 = GenerateFrameListExpectedOutput;

purpose = GenerateFrameListTestPurpose;

totalPassed = 0;
numTests = length(input1);

% run all tests, comparing expected output against actual output
for i = 1:numTests
    m = sprintf('%s Test %i\n\tPurpose:\t%s \n\tResult:\t\t', functionName, i, purpose{i});
    
    try
        
        output1{i} = feval(functionName,input1(i),input2(i),input3(i));
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
allocatedMarks = 2;
mark = ProcessMarksSummary(functionName,totalPassed,numTests,allocatedMarks);


