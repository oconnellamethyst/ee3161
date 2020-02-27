% Comparison of forward bias I-VA for Si and Ge diodes at 300K.
%   This program uses a simplified formula for the current:
%   I = I01*exp(qVA/(kT)) + I02*exp(qVA/(2kT)).   
%   Also, Vbi=EG/2q+(kT/q)ln(ND/ni).

%Initialization
close
clear

% Constants
T=300;              % Temperature in Kelvin
k=8.617e-5;         % Boltzmann constant eV/K
e0=8.85e-14;        % permittivity of free space (f/cm)
q=1.602e-19;        % charge on an electron (coul)
KS=[11.8 16];       % Dielectric constant [Si Ge]
ni=[1.0e10 2.5e13]; % intrinsic carrier conc. at 300K [Si Ge]
up=[437 1500];      % hole mobility [Si Ge]
EG=[1.12 0.66];     % band gap [Si Ge]

% Given Constants   
A=1.0e-4;           % cm^2
ND=1.0e16;          % cm^(-3)
taun=1.0e-6;        % seconds
taup=1.0e-6;        % seconds

% I01 
DP=k*T.*up;
LP=sqrt(DP.*taup);
I01=q*A.*(DP./LP.*ni.^2./ND);

% I02
Vbi=EG/2+k*T.*log(ND./ni);
W=sqrt(2.*KS*e0/(q*ND).*Vbi);
I02=q*A.*ni/sqrt(taun*taup).*W.*(k*T)./(3 .*Vbi./4);

% Currents for both Silicon ISi and Germanium IGe
VA=linspace(0.1,1);
ISi=I01(1).*exp(VA./(k*T))+I02(1).*exp(VA./(2*k*T));
IGe=I01(2).*exp(VA./(k*T))+I02(2).*exp(VA./(2*k*T));

% Plot
semilogy(VA,ISi,VA,IGe,'-'); grid
axis([0 1 1.0e-12 1.0e-3]);
xlabel ('VA (volts)');
ylabel ('I (A)');
text(.7, 1.4e-9,'T = 300K');
text(.7, 4.0e-10,'ND = 1.0e16 /cm^3');
text(.25, 1.4e-5,'Ge');
text(.48, 1.4e-8,'Si');

