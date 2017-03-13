clear all
close all
N1 = 12;
N2 = 25;
Lh = N1+N2+1;
L1 = 5*N1;
L2 = 5*N2;
n0 = N1+L1+1;
load('h_all.mat')
% for channel_select = 1:11
channel_select = 1

switch channel_select
        case 0
            h = 1;
            N1t = 0;
            N2t = 0;
            SNR = (0:15)';
        case 1
            if ~exist('h_all','var'), load h_all.mat, end
            h = h_all{channel_select};
            N1t = 1;
            N2t = 7;
            SNR = 200;%(0:16)';
        case 2
            if ~exist('h_all','var'), load h_all.mat, end
            h = h_all{channel_select};
            N1t = 2;
            N2t = 17;
            SNR = (0:21)';
        case 3
            if ~exist('h_all','var'), load h_all.mat, end
            h = h_all{channel_select};
            N1t = 1;
            N2t = 22;
            SNR = (0:21)';
        case 4
            if ~exist('h_all','var'), load h_all.mat, end
            h = h_all{channel_select};
            h = h(1:19);
            N1t = 6;
            N2t = 12;
            SNR = (0:21)';
        case 5
            if ~exist('h_all','var'), load h_all.mat, end
            h = h_all{channel_select};
            N1t = 1;
            N2t = 1;
            SNR = (0:28)';
        case 6
            if ~exist('h_all','var'), load h_all.mat, end
            h = h_all{channel_select};
            N1t = 1;
            N2t = 2;
            SNR = (0:18)';
        case 7
            if ~exist('h_all','var'), load h_all.mat, end
            h = h_all{channel_select};
            N1t = 0;
            N2t = 4;
            SNR = (0:21)';
        case 8
            if ~exist('h_all','var'), load h_all.mat, end
            h = h_all{channel_select};
            N1t = 2;
            N2t = 3;
            SNR = (0:21)';
        case 9
            if ~exist('h_all','var'), load h_all.mat, end
            h = h_all{channel_select};
            N1t = 1;
            N2t = 1;
            SNR = (0:16)';
        case 10
            if ~exist('h_all','var'), load h_all.mat, end
            h = h_all{channel_select};
            N1t = 2;
            N2t = 3;
            SNR = (0:27)';
        case 11
            if ~exist('h_all','var'), load h_all.mat, end
            h = h_all{channel_select};
            h = h(1:6);
            N1t = 3;
            N2t = 2;
            SNR = (0:34)';
        otherwise
            error('channel_select = %d not supported\n',channel_select);
end
h = [zeros(12-N1t,1); h; zeros(25-N2t,1)];


H = zeros(N1+N2+L1+L2+1,L1+L2+1);
for i = 1:L1+L2+1
    H(i:i+Lh-1,i) = h;
end   

u_n0 = zeros(N1+N2+L1+L2+1,1);
u_n0(n0) = 1;

R_h = H'*H;
h_n0 = H'*u_n0;

% compute c_ZF by solving R_h*c_ZF = h_n0
c_ZF = linsolve(R_h,h_n0);
c_ZFdirect = (H'*H)^-1*H'*u_n0;

figure(channel_select); clf
stem(abs(c_ZF-c_ZFdirect)); grid on; hold on
% end