%BJT Constants and Eber-Moll Parameters (subprogram BJT0)

%Universal Constants
q=1.602e-19;
k=8.617e-5;
e0=8.85e-14;

%Device/Miscellaneous Parameters
A=1.0e-4;     %A in cm2
WB=2.5e-4;    %WB in cm
T=300;  kT=k*T;

%Material Parameters
ni=1.0e10;
KS=11.8;
NE=1.0e18;
NB=1.5e16;
NC=1.5e15;
   %Mobility Fit Parameters
   NDref=1.3e17;  NAref=2.35e17;
   unmin=92;  upmin=54.3;
   un0=1268;  up0=406.9;
   an=0.91;  ap=0.88;
uE=unmin+un0./(1+(NE/NDref).^an);
uB=upmin+up0./(1+(NB/NAref).^ap);
uC=unmin+un0./(1+(NC/NDref).^an);
TauE=1.0e-7;
TauB=1.0e-6;
TauC=1.0e-6;
DE=kT*uE;
DB=kT*uB;
DC=kT*uC;
LE=sqrt(DE*TauE);
LB=sqrt(DB*TauB);
LC=sqrt(DC*TauC);
nE0=ni^2/NE;
pB0=ni^2/NB;
nC0=ni^2/NC;

%Eber-Moll Parameter Computation (W = WB)
W=WB;
fB=(DB/LB)*pB0*(cosh(W/LB)/sinh(W/LB));
IF0=q*A*((DE/LE)*nE0+fB);
IR0=q*A*((DC/LC)*nC0+fB);
aF=q*A*(DB/LB)*(pB0/sinh(W/LB))/IF0;
aR=q*A*(DB/LB)*(pB0/sinh(W/LB))/IR0;
