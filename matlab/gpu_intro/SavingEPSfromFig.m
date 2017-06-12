
latexWidth = 4;
latexHeight = 3;

uiopen('C:\Users\ecestudent\Dropbox\ThesisGit\Thesis\matlab\gpu_intro\CPUvsGPU1.fig',1)
drawnow

ff = gcf;
homer = ff.Units;
ff.Units = 'inches';
bart = ff.Position;
ff.Position = [bart(1:2) latexWidth latexHeight];
ff.PaperPositionMode = 'auto';
ff.Units = homer;
axis tight
xlabel('numPoints')
print(ff, '-dpng', ['CPUvsGPUwithMemcpy']) %save as eps a 

close all

uiopen('C:\Users\ecestudent\Dropbox\ThesisGit\Thesis\matlab\gpu_intro\CPUvsGPU2.fig',1)
drawnow
ff = gcf;
homer = ff.Units;
ff.Units = 'inches';
bart = ff.Position;
ff.Position = [bart(1:2) latexWidth latexHeight];
ff.PaperPositionMode = 'auto';
ff.Units = homer;
axis tight
xlabel('numPoints')
print(ff, '-dpng', ['CPUvsGPU']) %save as eps a 

close all

uiopen('C:\Users\ecestudent\Dropbox\ThesisGit\Thesis\matlab\gpu_intro\CPUvsGPU3.fig',1)
drawnow
ff = gcf;
homer = ff.Units;
ff.Units = 'inches';
bart = ff.Position;
ff.Position = [bart(1:2) latexWidth latexHeight];
ff.PaperPositionMode = 'auto';
ff.Units = homer;
axis tight
xlabel('numPoints')
print(ff, '-dpng', ['CPUvsGPUzoomed']) %save as eps a 