clear all
latexWidth = 4;
latexHeight = 3;

load('fromCpp.mat')

figure(2); clf

numToSmooth = 10;
numToMin = 20;

x = fromCpp(:,1);

cpu1 = fromCpp(:,2);
[cpu cpux] = minWindows(x,cpu1,numToMin);

direct1 = fromCpp(:,3);
[direct directx] = minWindows(x,direct1,numToMin);

shared1 = fromCpp(:,4);
[shared sharedx] = minWindows(x,shared1,numToMin);

myfft1 = fromCpp(:,5);
[myfft myfftx] = minWindows(x,myfft1,numToMin);

cpu = smooth(cpu,numToSmooth);
direct = smooth(direct,numToSmooth);
shared = smooth(shared,numToSmooth);
myfft = smooth(myfft,numToSmooth);

plot(cpux,cpu,directx,direct,sharedx,shared,myfftx,myfft); grid on; axis tight; hold on
legend('Time Domain CPU','Time Domain GPU global','Time Domain GPU shared','Frequency Domain  GPU','Location', 'NorthWest')
title('Convolution CPU vs GPU')
xlabel('signal length')
ylabel('time (ms)')

ff = gcf;
homer = ff.Units;
ff.Units = 'inches';
bart = ff.Position;
ff.Position = [bart(1:2) latexWidth latexHeight];
ff.PaperPositionMode = 'auto';
ff.Units = homer;
axis tight
drawnow
print(ff, '-depsc', ['CPUvsGPU']) %save as eps a 
max(x)

% 
% close all
% plot(cpux,cpu,directx,direct,sharedx,shared,myfftx,myfft); grid on; axis tight; hold on
% legend('Time Domain CPU','Time Domain GPU global','Time Domain GPU shared','Frequency Domain  GPU','Location', 'NorthWest')
% title('Convolution CPU vs GPU')
% xlabel('signal length')
% ylabel('time (ms)')
% 
% ff = gcf;
% homer = ff.Units;
% ff.Units = 'inches';
% bart = ff.Position;
% ff.Position = [bart(1:2) latexWidth latexHeight];
% ff.PaperPositionMode = 'auto';
% ff.Units = homer;
% axis tight
% marge = axis;
% axis([29 600 0 0.4])
% drawnow
% print(ff, '-depsc', ['CPUvsGPU_CPUtoGPU']) %save as eps a 
% 
% close all
% plot(cpux,cpu,directx,direct,sharedx,shared,myfftx,myfft); grid on; axis tight; hold on
% legend('Time Domain CPU','Time Domain GPU global','Time Domain GPU shared','Frequency Domain  GPU','Location', 'NorthWest')
% title('Convolution CPU vs GPU')
% xlabel('signal length')
% ylabel('time (ms)')
% 
% ff = gcf;
% homer = ff.Units;
% ff.Units = 'inches';
% bart = ff.Position;
% ff.Position = [bart(1:2) latexWidth latexHeight];
% ff.PaperPositionMode = 'auto';
% ff.Units = homer;
% axis tight
% marge = axis;
% axis([marge(1:2) 0 1.4])
% title('Convolution GPU vs GPU')
% drawnow
% print(ff, '-depsc', ['CPUvsGPU_GPUtoGPU']) %save as eps a 
% 
