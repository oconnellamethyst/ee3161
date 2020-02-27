%Exercise 7.1...Normalized C-V curves

%Computation
clear
m=[1 0 -1];
s=1 ./(m+2);
x=linspace(-25,0);   %x=VA/Vbi
y=[];                %y=CJ/CJ0
for i=1:3,
y=[y;1 ./(1-x).^s(i)];
end

%Plot
close
plot(x,y,'-');  grid
axis([-25 0 0 1])
xlabel('VA/Vbi');  ylabel('CJ/CJ0')
text(-20,.42,'linear (m=1)')
text(-20,.27,'step (m=0)')
text(-20,.10,'hyperabrupt (m=-1)')
