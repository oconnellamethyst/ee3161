%Simulation of Diffusion (DiffDemo)
%One-dimensional system, right and left jumps equally probable

%Initialization
close
x= [0.5 1.5 2.5 3.5 4.5];
y= [1.0e6 0 0 0 0];  %NOTE: initial position can be changed
[xp,yp]=bar(x,y);
plot(xp,yp); text(0.5,1.1e6,'t = 0');
axis([0,5,0,1.2e6]);
pause (0.5)
N=15;                %NOTE: increase N for extended run

%Computations and Plotting
for ii=1:N,
%Diffusion step calculation
bin(1)=round(y(1)/2 + y(2)/2);
bin(2)=round(y(1)/2 + y(3)/2);
bin(3)=round(y(2)/2 + y(4)/2);
bin(4)=round(y(3)/2 + y(5)/2);
bin(5)=round(y(4)/2 + y(5)/2);
y=bin;
[xp,yp]=bar(x,y);
axis(axis);
plot(xp,yp); text(0.5,1.1e6,['t = ',num2str(ii)]);
axis([0,5,0,1.2e6]);
pause (0.5)
end
