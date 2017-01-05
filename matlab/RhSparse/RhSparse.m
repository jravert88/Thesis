Rh = zeros(186);
for i = 1:186
    Rh(i,i) = 1;
    for j = 1:38
        if(i-j>0)
            Rh(i-j,i) = 1;
        end
        if(i+j<186+1)
            Rh(i+j,i) = 1;
        end
    end
end
surf(Rh)
percentSparse = length(find(Rh==0))/length(Rh)^2
find(Rh==0)

h = randn(38,1);
hx = xcorr(h,h);
for i = 1:186
    Rh(i,i) = 1;
    for j = 1:38
        if(i-j+1>0)
            Rh(i-j+1,i) = abs(hx(38-j+1));
        end
        if(i+j-1<186+1)
            Rh(i+j-1,i) = abs(hx(38-j+1));

        end
    end
end
