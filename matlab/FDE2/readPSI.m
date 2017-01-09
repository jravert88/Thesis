fileID = fopen('FreqTestFileFromMatlabPSI_r.txt','r');
formatSpec = '%f';
A = fscanf(fileID,formatSpec);
whos A
fclose(fileID);
myAxis = -2:4/length(A):2-1/length(A);
plot(myAxis,10*log10((fftshift(A))))
whos myAxis 

load('RR1.mat')
% rr = ifft(RR);
% rr = resample(rr,100,1);
% RR = fft(RR);
hold on
myAxis = -4:8/length(RR):4-1/length(RR);
plot(myAxis,10*log10(fftshift(RR))-65)
grid on
hold off

marge = axis;
axis([-2 2 marge(3:4)])

