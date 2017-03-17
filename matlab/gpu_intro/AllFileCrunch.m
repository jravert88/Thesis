clear all
load('fromCpp_186taps_all.mat')

figure(9); clf
x = fromCpp(:,1);
CPUtime = fromCpp(:,3);
plot(x,CPUtime,'.'); hold on

myCPUtimeData = [];
for xTest = 1:max(x)
    myTestData = CPUtime(find(x==xTest));
    myCPUtimeData = [myCPUtimeData myTestData];
end
% 
% figure(1); clf
% plot(myVar)

