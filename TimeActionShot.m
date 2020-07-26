function [mark, averageTime] = TimeActionShot()
% Times the ActionShot function
%
% The name must match exactly (if the name is incorrect and you want
% to time the function, edit the name to correct it)
% default the function name to ActionShot, if no optional arg specified

load TestDataTiming
functionName = 'ActionShot';
try
    fprintf('Begininning timing of three iterations for %s ...\n', functionName)
    for i=1:3
        tic % start the clock
        Output = ActionShot(ExpectedInput);
        time(i) = toc; % stop the clock
        fprintf('Time for iteration %i was %.4f\n',i,time(i));
    end
    
    averageTime = mean(time);
    fprintf('Summary for %s: ',functionName);
    if averageTime <1
        fprintf('Average time below 1 second\n Award 2 marks\n');
        mark = 2;
        
    elseif averageTime <5
        fprintf('Average time betwee 1 and 5 seconds\n  Award 1 mark\n');
        mark = 1;
    else
        fprintf('Average time above 5 seconds\n  Award 0 marks\n');
        mark = 1;
    end
    
catch ex
    disp([functionName 'FAILED test']);
    ProcessMarkingException(ex, functionName)
    mark = 0;
    averageTime = 100;
end
