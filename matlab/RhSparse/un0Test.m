N1 = 12;
N2 = 25;
L1 = N1*5;
L2 = N2*5;
n0 = N1+L1+1;
hhat = -N1:N2;
hhat = hhat+.01;


for i = 1:186
    H0(i:i+length(hhat)-1,i) = hhat.';    
end

delta = zeros(size(H0,1),1);
delta(n0) = 1;

un0 = H0'*delta;
un0 = un0(1:186);

figure(1); clf
stem(un0);

hold on

a = H0';
stem(a(:,n0))