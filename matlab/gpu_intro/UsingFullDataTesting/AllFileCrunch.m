clear all
close all
load('all186_mat.mat')

CPUtime_pdfMax = [];
for i = x
    [f,xi] = ksdensity(CPUtime_mat(:,i));
    [A I] = max(f);
    CPUtime_pdfMax = [CPUtime_pdfMax; xi(I)];
end

CPUfreq_pdfMax = [];
for i = x
    [f,xi] = ksdensity(CPUfreq_mat(:,i));
    [A I] = max(f);
    CPUfreq_pdfMax = [CPUfreq_pdfMax; xi(I)];
end

GPUtime_g_pdfMax = [];
for i = x
    [f,xi] = ksdensity(GPUtime_g_mat(:,i));
    [A I] = max(f);
    GPUtime_g_pdfMax = [GPUtime_g_pdfMax; xi(I)];
end

GPUtime_s_pdfMax = [];
for i = x
    [f,xi] = ksdensity(GPUtime_s_mat(:,i));
    [A I] = max(f);
    GPUtime_s_pdfMax = [GPUtime_s_pdfMax; xi(I)];
end
plot(smooth(CPUtime_pdfMax,100)); hold on
plot(smooth(CPUfreq_pdfMax,100))
plot(smooth(GPUtime_g_pdfMax,100))
plot(smooth(GPUtime_s_pdfMax,100))
% load('fromCpp_186taps_all.mat')
%
% figure(9); clf
% x = fromCpp(:,1);
% CPUtime = fromCpp(:,3);
% CPUfreq = fromCpp(:,4);
% GPUtime_g = fromCpp(:,5);
% GPUtime_s = fromCpp(:,6);
% % GPUfreq = fromCpp(:,7);
% plot(x,CPUtime,'.'); hold on; grid on
% plot(x,CPUfreq,'.')
% plot(x,GPUtime_g,'.')
% plot(x,GPUtime_s,'.')
% % plot(x,GPUfreq,'.'); hold off
% drawnow
%
%
% CPUtime_mat = [];
% CPUfreq_mat = [];
% GPUtime_g_mat = [];
% GPUtime_s_mat = [];
% GPUfreq_mat = [];
% for xTest = 1:max(x)
%     myX = find(x==xTest);
%     CPUtime_mat   = [CPUtime_mat   CPUtime(myX)];
%     CPUfreq_mat   = [CPUfreq_mat   CPUfreq(myX)];
%     GPUtime_g_mat = [GPUtime_g_mat GPUtime_g(myX)];
%     GPUtime_s_mat = [GPUtime_s_mat GPUtime_s(myX)];
% %     GPUfreq_mat   = [GPUfreq_mat   GPUfreq(myX)];
% end
% x = 1:max(x);
% save ('all186_mat.mat','x','CPUtime_mat','CPUfreq_mat','GPUtime_g_mat','GPUtime_s_mat','GPUfreq_mat')
