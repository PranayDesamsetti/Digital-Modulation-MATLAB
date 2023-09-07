clc
clear
close all;
b = [0 1 1 0 1 0 0 0]; % Input as per Simon Haykin example
 
% Method -1 Pick and drop method
t = 0:0.01:2-0.01; % time set for 2 bits
s1=1*cos((2*pi*1*t)+(pi/4)); % First Carrier signal
s2=1*cos((2*pi*1*t)+(3*pi/4)); % Second Carrier signal
s3=1*cos((2*pi*1*t)+(5*pi/4)); % Third Carrier signal
s4=1*cos((2*pi*1*t)+(7*pi/4)); % Fourth Carrier signal
QPSK1 = [s3 s1 s1 s2];
subplot(6,2,1); plot(t,s1,'LineWidth',2)
title('pi/4');
subplot(6,2,2); plot(t,s2,'LineWidth',2)
title('3*pi/4');
subplot(6,2,3); plot(t,s3,'LineWidth',2)
title('5*pi/4');
subplot(6,2,4); plot(t,s4,'LineWidth',2)
title('7*pi/4');
subplot(6,1,3); plot(QPSK1,'LineWidth',2)
title('QPSK - 1');
 
%QPSK2
% BPSK1 - Even bits
% b=input('enter the binary no:');
b = [1 0 0 0];
t = 0:0.01:2*length(b)-0.01;
bb1 = [];
bb = [];
for j=1:length(b)
    for i = 1:200 % time doubled
        if b(j) == 1
            bb1(i) = 1;
        else
            bb1(i) = 0; % unipolar
        end
    end
    bb = [bb bb1];
end
% carrier signal
c1 = 1*sin(2*pi*1*t);
s = [];
for i = 1:length(bb)
if bb(i) == 1
    s1(i) = c1(i);
else
    s1(i) = -c1(i); % 180 degree phase shift
end
end
%plotting
subplot(6,1,4); plot(t,s1,'LineWidth',2);
title('BPSK for Even bits'); 
 
% BPSK2 - Odd bits
% b=input('enter the binary no:');
b = [0 1 1 0];
t = 0:0.01:2*length(b)-0.01;
bb1 = [];
bb = [];
for j = 1:length(b)
    for i = 1:200 % time doubled
        if b(j) == 1
            bb1(i) = 1;
        else
            bb1(i) = 0; %unipolar
        end
    end
    bb = [bb bb1];
end
% carrier signal
c1 = 1*cos(2*pi*1*t);
s=[];
for i = 1:length(bb)
if bb(i) == 1
    s2(i) = c1(i);
else
    s2(i) = -c1(i); % 180 degree phase shift
end
end
%plotting
subplot(6,1,5); plot(t,s2,'LineWidth',2);
title('BPSK for Odd bits');
QPSK2 = s1+s2;
subplot(6,1,6); plot(t,QPSK2,'LineWidth',2);
title('QPSK - 2')
