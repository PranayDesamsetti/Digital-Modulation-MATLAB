clc
clear
close all

x = [0.3 1.5 0.5 1 2.3 3.7 2.8 3.4 2.8 0];
xq_k_1 = 0.5;

for k = 1:10
    g(k) = x(k) - xq_k_1;
    if g(k) >= 0 && g(k) < 1
        gq(k) = 0.5;
    elseif g(k) >= 1 && g(k) < 2
        gq(k) = 1.5;
    elseif g(k) >= 2 && g(k) < 3
        gq(k) = 2.5;
    elseif g(k) >= 3 && g(k) < 4
        gq(k) = 3.5;
    elseif g(k) >= -1 && g(k) < 0
        gq(k) = -0.5;
    elseif g(k) >= -2 && g(k) < -1
        gq(k) = -1.5;
    elseif g(k) >= -3 && g(k) < -2
        gq(k) = -2.5;
    elseif g(k) >= -4 && g(k) < -3
        gq(k) = -3.5;
    end
    xq(k) = gq(k) + xq_k_1;
    xq_k_1 = xq(k);
end

xq_d_k_1 = 0.5;

for k = 1:10
    xqd(k) = gq(k) + xq_d_k_1;
    xq_d_k_1 = xqd(k);
end
E = x-xqd;

disp('Input Data'); disp(x);
disp('DPCM Output'); disp(gq);
disp('DPCM Reciever Output'); disp(xqd);
disp('Error'); disp(E);





