function [mark, averageTime] = TimePixelDistance()
% Times the PixelDistance function
%
% The name must match exactly (if the name is incorrect and you want
% to time the function, edit the name to correct it)
%
% Time PixelDistance by running it 1,000,000 times
% Timing standards are based on execution time when code is run on the
% university lab machines
% Timing will be done by testing 1,000,000 calls three times and 
% averaging the result
% Note you can only earn timing marks if your PixelDistance function
% earned full functionality marks, i.e. you need a working PixelDistance
% function to be eligible for the timing marks.
% If the average time is less than 1 seconds you get 1 mark
% if the average time is more than 1 second you do not earn a timing mark
% author: Peter Bier

% default the function name to PixelDistance, if no optional arg specified
if nargin == 0
    functionName = 'PixelDistance';
else
    functionName = specifiedFunctionName;
end

% set up 1000 input arrays
for i=1:300
    input1{i}=randi(255,3,1);
    input2{i}=randi(255,3,1);
end
for i=301:700
    input1{i}=randi(255,1,3);
    input2{i}=randi(255,1,3);
end
for i=701:1000
    input1{i}=randi(255,1,1,3);
    input2{i}=randi(255,1,1,3);
end


try
    fprintf('Begininning timing of three iterations for %s ...\n', functionName)
    for i=1:3
        tic % start the clock
        % run 1000,000 tests 1000 at a time so we can abort after
        % a short number of tests if it is really slow.
        for k =1:1000 
            for j=1:1000
                d = PixelDistance(input1{i},input2{i});                
            end
            if toc>1.5
                disp('Aborting timing as already above 1.5 seconds');
                break
            end
        end
        time(i) = toc; % stop the clock
        fprintf('Time for iteration %i was %.4f\n',i,time(i));
    end
    
    averageTime = mean(time);
    fprintf('Summary for %s: ',functionName);
    if averageTime <1
        fprintf('Average time below 1 second\n Award 1 mark\n');
        mark = 1;
        
    else
        fprintf('Average time above 1 second\n  Award 0 marks\n');
        mark = 0;
    end
    
catch ex
    disp([functionName 'FAILED test']);
    ProcessMarkingException(ex, functionName)
    mark = 0;
    averageTime = 100;
end
