%Base-width Modulation included calc of Eber-Moll Parameters
%Subprogram BJTmod

xnEB=sqrt((2*KS*e0/q)*(NE/(NB*(NE+NB)))*(VbiE-VEB));
xnCB=sqrt((2*KS*e0/q)*(NC/(NB*(NC+NB)))*(VbiC-VCB));
W=WB-xnEB-xnCB;
fB=(DB/LB)*pB0*(cosh(W/LB)./sinh(W/LB));
IF0=q*A.*((DE/LE)*nE0+fB);
IR0=q*A.*((DC/LC)*nC0+fB);
aF=q*A*(DB/LB)*(pB0./sinh(W/LB))./IF0;
aR=q*A*(DB/LB)*(pB0./sinh(W/LB))./IR0;
