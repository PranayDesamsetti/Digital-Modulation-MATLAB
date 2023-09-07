 clc;
 clear;
 close all;

 b = [1 0 1 0];

 t = 0:0.01:length(b)-0.01;
 bb = [];

 for j = 1:length(b)
     for i = 1:100
         if b(j) == 1
             bb1(i) = 1;
         else
             bb1(i) = 0;
         end
     end
     bb = [bb bb1];
 end

 c = 2*sin(2*pi*2*t);
 s = bb.*c;

 subplot(4,1,1); plot(t,bb);
 title('Message Signal'); 
 xlabel('Time'); ylabel('Amplitude');

 subplot(4,1,2); plot(t,c);
 title('Carrier Signal'); 
 xlabel('Time'); ylabel('Amplitude');

 subplot(4,1,3); plot(t,s);
 title('ASK Signal'); 
 xlabel('Time'); ylabel('Amplitude');

d = [];
for i=1:length(s)
    if s(i) == 0;
        d(i) = 0;
    else
        d(i) = 1;
    end
end
subplot(4,1,4); plot(t,d);
title('Demodulated Signal');
xlabel('Time'); ylabel('Amplitude');



