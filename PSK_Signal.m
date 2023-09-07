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

 c1 = 2*sin(2*pi*2*t);
 c2 = -2*sin(2*pi*2*t);
 s = [];

 for i = 1:length(bb)
     if bb(i) == 1
         s(i) = c1(i);
     else
         s(i) = c2(i);
     end
 end

 subplot(5,1,1); plot(t,bb);
 title('Message Signal'); 
 xlabel('Time'); ylabel('Amplitude');

 subplot(5,1,2); plot(t,c1);
 title('Carrier Signal 1'); 
 xlabel('Time'); ylabel('Amplitude');

 subplot(5,1,3); plot(t,c2);
 title('Carrier Signal 2'); 
 xlabel('Time'); ylabel('Amplitude');

 subplot(5,1,4); plot(t,s);
 title('PSK Signal'); 
 xlabel('Time'); ylabel('Amplitude');

d = [];
for i=1:length(s)
    if s(i) == c1(i);
        d(i) = 0;
    else
        d(i) = 1;
    end
end
subplot(5,1,5); plot(t,d);
title('Demodulated Signal');
xlabel('Time'); ylabel('Amplitude');



