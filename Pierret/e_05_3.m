% This program calculates and plots the depletion width vs impurity
% concentration in Silicon p+/n and n+/p step junctions at 300K.
%
% Three plots are generated corresponding to VA = 0.5V, 0.0V, and -10V
%
%       The Vbi relationship employed is Vbi=(EG/2q)+(kT/q)ln(NB/ni)
%       where NB is the impurity concentration on the lightly doped side.

%Constants and Parameters
T=300;          % Temperature in Kelvin
k=8.617e-5;     % Boltzmann constant (eV/K)
e0=8.85e-14;    % permittivity of free space (F/cm)
q=1.602e-19;    % charge of an electron (coul)
KS=11.8;        % dielectric constant of Si at 300K
ni=1e10;        % intrinsic carrier conc. in Silicon at 300K (cm^-3)
EG=1.12;        % band gap of Silicon (eV)

%Choose variable values
NB=logspace(14,17);    % doping ranges from 1e14 to 1e17
VA=[ 0.5 0 -10 ];      % VA values set

%Depletion width calculation
Vbi=EG/2+k*T.*log(NB./ni);
W(1,:)=1.0e4*sqrt(2*KS*e0/q.*(Vbi-VA(1))./NB);
W(2,:)=1.0e4*sqrt(2*KS*e0/q.*(Vbi-VA(2))./NB);
W(3,:)=1.0e4*sqrt(2*KS*e0/q.*(Vbi-VA(3))./NB);

%Plot
close
loglog(NB, W,'-')
axis([1.0e14 1.0e17 1.0e-1 1.0e1])
grid
xlabel('NA or ND (cm^-3)')
ylabel('W (micrometers)')
set(gca,'DefaultTextUnits','normalized')
text(.38,.26,'VA=0.5V')
text(.38,.50,'VA=0')
text(.38,.76,'VA= -10V')
text(.77,.82,'Si,300K')
text(.77,.79,'p+/n and n+/p')
set(gca,'DefaultTextUnits','data')
