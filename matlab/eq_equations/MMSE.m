clear all
close all
N1 = 12;
N2 = 25;
Lh = N1+N2+1;
L1 = 5*N1;
L2 = 5*N2;
n0 = N1+L1+1;
load('h_all.mat')
for channel_select = 1:11
% channel_select = 4

sigma_hat_squared = 0;%1e-5;

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
h = [zeros(1,12-N1t) h.' zeros(1,25-N2t)];

G = zeros(L1+L2+1,N1+N2+L1+L2+1);
for i = 1:L1+L2+1
    G(i,i:Lh+i-1) = h(end:-1:1);
end

g = zeros(1,L1+L2+1);
g(L1-N2+1:L1+N1+1) = h(end:-1:1);

% c_MMSE = (G*G' + 2*sigma_hat_squared * eye(L1+L2+1))^-1 * g';

R_hw = G*G' + 2*sigma_hat_squared * eye(L1+L2+1);
h_n0 = g';

% compute c_MMSE by solving R_hw*c_MMSE = h_n0
c_MMSE = linsolve(R_hw,h_n0);

Nfft = 512;
F = -0.5:1/Nfft:0.5-1/Nfft;

CD = fft(c_MMSE_direct,Nfft);
CD_dB = 20*log10(abs(CD));
C = fft(c_MMSE,Nfft);
C_dB = 20*log10(abs(C));
H = fft(h.',Nfft);
H_dB = 20*log10(abs(H));
I = CD.*H;
I_dB = 20*log10(abs(I));

figure(channel_select); clf
plot(F,H_dB,F,CD_dB,F,C_dB,F,I_dB)
legend('channel','direct equalizer','solve equalizer','equalized')

end