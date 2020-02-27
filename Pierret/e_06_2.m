%Variation of Ideal-Diode I-V  with semiconductor doping.
%Si step junction, T = 300K.
%In response to the "ND=" prompt type [ND1 ND2 ...] to input
%multiple doping values.

%Initialization and Universal Constants
clear
k=8.617e-5;
q=1.6e-19;

%Device, Material, and System Parameters
A=1.0e-4;
ni=1.0e10;
taup=1.0e-6;
ND=input('Input the n-side doping concentration, ND = ');
T=300;

%Hole Mobility Calculation
NAref=2.35e17;
upmin=54.3;
up0=406.9;
ap=0.88;
up=upmin+up0./(1+(ND./NAref).^ap);
%The mobility calculation here assumes the hole minority carrier
  %mobility is equal to the hole majority carrier mobility.

%I-V Calculation
VA=linspace(-1,0.2);
DP=k.*T.*up;
LP=sqrt(DP.*taup);
I0=q.*A.*(DP./LP).*(ni^2 ./ND)
I=I0.'*(exp(VA./(k.*T))-1);

%Plotting Result
close
plot(VA,I); grid;
ymin=-2*I0(1);  ymax=5*I0(1);
axis([-1,0.2,ymin,ymax]);
xlabel('VA (volts)');  ylabel('I (amps)');

%Adding axes,key
xx=[-1 0.2];  yx=[0 0];
xy=[0 0]; yy=[ymin,ymax];
hold on
plot(xx,yx,'-w',xy,yy,'-w');
j=length(ND);
for i=1:j;
    yput=(0.70-0.06*i)*ymax;
    yk(i,1)=yput; yk(i,2)=yput;
    text(-0.68,(0.69-0.06*i)*ymax,['ND=',num2str(ND(i)),'/cm3']);
end
xk=[-0.8 -0.7];
plot(xk,yk);
text(-0.74,0.75*ymax,'Si, 300K');
hold off
