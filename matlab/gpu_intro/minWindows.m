function [ minSignal, minx ] = minWindows(x,signal,width)

minSignal = [];
minx = [];
for i = 1:floor(length(signal)/width)-1
    [A I] = min(signal(i*width+1:(i+1)*width));
    minSignal = [minSignal; A];
    minx = [minx; i*width+I];
end
end

