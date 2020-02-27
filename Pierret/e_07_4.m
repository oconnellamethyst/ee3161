%Exercise 7.4...Forward-Bias Capacitance

%Computational constants
clear
CJ0= 120e-12;    %farads
Vbi=0.7;         %volts
Vth=0.0259;      %Vth=kT/q in volts
taun=5.0e-7;     %seconds
I0=8.0e-13;      %amps
n1=1.22;         %ideality factor
wt=input('input the angular-frequency*lifetime product--');
VA=linspace(0,0.65);

%CJ Computation
CJ=CJ0./sqrt(1-VA./Vbi);

%CD Computation
G0=I0/Vth*exp(VA./(n1*Vth));
CD=taun.*G0./(sqrt(2)*wt)*sqrt(sqrt(1+(wt)^2)-1);

%Measured CD Data
VAm=[0.1 0.2 0.3 0.4 0.42 0.44 0.46 0.48 0.50 0.52 0.54 0.56 0.58];
CDm=[1.31e-10 1.43e-10 1.61e-10 1.88e-10 1.97e-10 2.08e-10 ...
 2.23e-10 2.46e-10 2.76e-10 3.46e-10 4.40e-10 6.54e-10 9.38e-10];

%Plot
close
semilogy(VA,CJ,'--r');  axis([0 0.7 1.0e-10 1.0e-9]);  grid
hold on;  semilogy(VA,CD,'-.g');  semilogy(VA,CJ+CD)
semilogy(VAm,CDm-2e-12,'o')
xlabel('VA (volts)');  ylabel('C (farads)')

%Key
semilogy(0.12,7e-10,'o'); text(0.125,7e-10,'...C-V Data')
x=[0.1 0.2];
y1=[6.1e-10 6.1e-10]; semilogy(x,y1,'-y'); text(0.21,6.1e-10,'CJ+CD')
y2=[5.2e-10 5.2e-10]; semilogy(x,y2,'--r'); text(0.21,5.2e-10,'CJ')
y3=[4.3e-10 4.3e-10]; semilogy(x,y3,'-.g'); text(0.21,4.3e-10,'CD')
hold off
