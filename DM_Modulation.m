clc
clear 
close all
 
x = [0,1.5,2.9,4,4.7,5,4.7,4,2.9,1.5,0];
 
xqofkminus1 = x(1);
delta = 1.5;
 
for k = 2:length(x)
    g(k) = x(k)-xqofkminus1; 
if g(k)>=0
    gq(k) = delta;
else
    gq(k) = -delta;
end
xq = gq(k) + xqofkminus1;
xqofkminus1 = xq; %dealy
end

% gq is quantized value -----DPCM output
% Receiver part
gq(1) = x(1);
disp('Input data'); disp(x);
disp('Delta modulator output'); disp(gq);
%gq=[0, gq]
 
xqdashofkminus1=x(1);
for k=2:length(x)
    xqdashofk(k)=gq(k)+ xqdashofkminus1;
    xqdashofkminus1=xqdashofk(k);
end
disp('Delta modulator receiver output'); disp(xqdashofk);
error= x-xqdashofk;
disp('Error between original and received samples'); disp(error);
