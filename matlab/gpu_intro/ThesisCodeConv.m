clear all
latexWidth = 5;
latexHeight = 4;

load('fromCpp.mat')

numToSmooth = 1;
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

figure(1); clf
plot(cpux,cpu,directx,direct,sharedx,shared,myfftx,myfft); grid on;
ax = gca;
legend('Time Domain CPU','Time Domain GPU global','Time Domain GPU shared','Frequency Domain  GPU','Location', 'NorthWest')
% title('Convolution CPU vs GPU')
xlabel('signal length')
ylabel('time (ms)')

ax.FontName = 'Times New Roman';

ff = gcf;
homer = ff.Units;
ff.Units = 'inches';
bart = ff.Position;
ff.Position = [bart(1:2) latexWidth latexHeight];
ff.PaperPositionMode = 'auto';
ff.Units = homer;
drawnow
print(ff, '-dpng', ['CPUvsGPU']) %save as eps a 


figure(2); clf
plot(cpux,cpu,directx,direct,sharedx,shared,myfftx,myfft); grid on;
ax = gca;
legend('Time Domain CPU','Time Domain GPU global','Time Domain GPU shared','Frequency Domain  GPU','Location', 'NorthWest')
% title('Convolution CPU vs GPU')
xlabel('signal length')
ylabel('time (ms)')

ax.FontName = 'Times New Roman';

ff = gcf;
homer = ff.Units;
ff.Units = 'inches';
bart = ff.Position;
ff.Position = [bart(1:2) latexWidth latexHeight];
ff.PaperPositionMode = 'auto';
ff.Units = homer;
axis([29 600 0 0.3])
drawnow
print(ff, '-dpng', ['CPUvsGPU_CPUtoGPU']) %save as eps a 



figure(3); clf
plot(cpux,cpu,directx,direct,sharedx,shared,myfftx,myfft); grid on;
ax = gca;
legend('Time Domain CPU','Time Domain GPU global','Time Domain GPU shared','Frequency Domain  GPU','Location', 'NorthWest')
% title('Convolution CPU vs GPU')
xlabel('signal length')
ylabel('time (ms)')

ax.FontName = 'Times New Roman';

ff = gcf;
homer = ff.Units;
ff.Units = 'inches';
bart = ff.Position;
ff.Position = [bart(1:2) latexWidth latexHeight];
ff.PaperPositionMode = 'auto';
ff.Units = homer;
marge = axis;
axis([marge(1:2) 0 1.1])
drawnow
print(ff, '-dpng', ['CPUvsGPU_GPUtoGPU']) %save as eps a 

figure(4); clf
plot(x,cpu1,x,direct1,x,shared1,x,myfft1); grid on;
ax = gca;
legend('Time Domain CPU','Time Domain GPU global','Time Domain GPU shared','Frequency Domain  GPU','Location', 'NorthWest')
% title('Convolution CPU vs GPU')
xlabel('signal length')
ylabel('time (ms)')

ax.FontName = 'Times New Roman';

ff = gcf;
homer = ff.Units;
ff.Units = 'inches';
bart = ff.Position;
ff.Position = [bart(1:2) latexWidth latexHeight];
ff.PaperPositionMode = 'auto';
ff.Units = homer;
drawnow
print(ff, '-dpng', ['CPUvsGPU_spikes']) %save as eps a 