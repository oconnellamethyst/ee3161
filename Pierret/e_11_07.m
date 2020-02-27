%BJT Common Base/Emitter Input/Output Characteristics

%Input Eber-Moll Parameters
bjt0

%Limiting Voltages used in Calculation
VbiE=kT*log(NE*NB/ni^2);
VbiC=kT*log(NC*NB/ni^2);
VCB0=50;
VCE0=50;

%Choice of Characteristic
format compact
echo on
%THIS PROGRAM COMPUTES BJT INPUT AND OUTPUT CHARACTERISTICS
% Subprogram BJT0 is a run-time requirement.
% Modify entries in BJT0 to change device/material parameters.
% Modify axis commands to change plot min/max values.
echo off
close
c=menu('Specify the desired characteristic','Common Base Input',...
    'Common Base Output','Common Emitter Input','Common Emitter Output');
j=input('Specify number of curves per plot...');

%Calculation Proper
for i=1:j,

     %Common-Base Input Characteristics
     if c==1,
     VCB=-(i-1)*5;
     VEB=0:0.005:VbiE;
     jj=length(VEB);
     IE=(IF0.*(exp(VEB/kT)-1) - aR.*IR0.*(exp(VCB/kT)-1))*1.0e3;
     %1.0e3 in the preceeding equation changes IE units to mA
     if i==1,
     plot(VEB,IE);  axis([.35 .85 0 5]);
     grid;  xlabel('VEB(volts)');  ylabel('IE(mA)');
     else plot(VEB,IE);
     end

     %Common-Base Output Characteristics
     elseif c==2,
     IE=(j-i)*1.0e-3;    
     VCB1=2:-0.01:0;
     VCB2=0:-VCB0/200:-VCB0;
     VCB=[VCB1,VCB2];
     jj=length(VCB);
     IC=(aF*IE-(1-aF*aR)*IR0*(exp(VCB/kT)-1))*(1.0e3);
     if i==1,
     plot(-VCB,IC);  axis([-VCB0/10 VCB0 0 1.3e3*IE]);
     grid;  xlabel('-VCB(volts)');  ylabel('IC(mA)');
     text(5,1.1e3*IE,'IEstep=1mA');
     else plot(-VCB,IC);
     end

     else
     end

     %Common-Emitter Input Characteristics
     if c==3,
     VEC=(i-1)*5;
     VEB=0:0.005:VbiE;
     jj=length(VEB);
     IB0=(1-aF).*IF0+(1-aR).*IR0;
     IB1=(1-aF).*IF0+(1-aR).*IR0.*exp(-VEC/kT);
     IB=(IB1.*exp(VEB/kT)-IB0)*(1.0e6);
     if i==1,
     plot(VEB,IB);  axis([.35 .85 -5 20]);
     grid;  xlabel('VEB(volts)');   ylabel('IB(uA)');
     else plot(VEB,IB);
     end

     %Common-Emitter Output Characteristics
     elseif c==4,
     IB=(j-i)*2.5e-6;
     VECA=0:0.01:VCE0/50;
     VECB=VCE0/50:VCE0/200:VCE0;
     VEC=[VECA,VECB];
     jj=length(VEC);
     IB0=(1-aF).*IF0+(1-aR).*IR0;
     IB1=(1-aF).*IF0+(1-aR).*IR0.*exp(-VEC/kT);
     IC=((aF.*IF0-IR0.*exp(-VEC/kT)).*(IB+IB0)./IB1+IR0-aF.*IR0)*(1.0e3);
     if i==1,
     jA=length(VECA);
     plot(VEC,IC);  axis([0 VCE0 0 2.5*IC(jA)]);
     grid;  xlabel('VEC(volts)');  ylabel('IC(mA)');
     text(5,2*IC(jA),'IBstep=2.5uA');
     else plot(VEC,IC);
     end

     else
     end
hold on
end
hold off
