clc
clear 
close all

x1(1) = 1;
x2(1) = 0;
x3(1) = 0;
x4(1) = 0;
x5(1) = 0;

for i = 2:31
    x2(i) = x1(i-1);
    x3(i) = x2(i-1);
    x4(i) = x3(i-1);
    x5(i) = x4(i-1);
    x1(i) = xor(x1(i-1),xor(x2(i-1),xor(x4(i-1),x5(i-1))));
end

disp('PN Sequence Output (5,4,2,1)'); disp(x5);

NZ = 0;
NO = 0;
for i = 1:31
    if x5(i) == 1
        NO = NO + 1;
    else
        NZ = NZ + 1;
    end
end
disp('Number of Ones'); disp(NO);
disp('Number of Zeros'); disp(NZ);

if NO == NZ + 1
    disp('Balance Property is Satisfied');
else
    disp('Balance Property is NOT Satisfied');
end


