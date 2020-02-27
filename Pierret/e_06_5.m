%Exercise 6.5...Multiplication factor

%Initialization
close
clear

%M calculation
x=linspace(0,.99);    %x=|VA|/VBR
M3=1 ./(1-x.^3);      %M when m=3
M6=1 ./(1-x.^6);      %M when m=6

%Plotting result
plot(-x,-M3,-x,-M6); grid
axis([-1 0 -10 0])
xlabel('- |VA|/VBR')  
ylabel('- Multiplication factor')
text(-0.8,-2.5,'m = 3')
text(-0.95,-1.5,'m = 6')
