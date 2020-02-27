% BJT Equilibrium Energy Band Diagram Generator
% This program plots out the BJT equilibrium energy band diagram

% Original version authored by Aaron Luft as part of a course project for Prof. Gerry Neudeck
% Major revisions by R. F. Pierret

DOPING=[1e18 -1e16 1e15];   % E, B, and C type and doping concentrations (- = n-type)
WB=1.0e-4;   %Total base width in cm; 1.0e-4cm=1micrometer
close

%Constants
T=300;        % Temperature in Kelvin
k=8.617e-5;   % Boltzmann constant eV/K
e0=8.85e-14;  % permittivity of free space (f/cm)
q=1.602e-19;  % charge on an electron (coul)
KS=11.8;      % Dielectric constant of Si at 300K
ni=1.0e10;    % intrinsic conc. of Silicon at 300K
EG=1.12;      % Silicon band gap (eV)
%end constants

%General Computations and Manipulations
NE = DOPING (1);                % Emitter doping and type
NB = DOPING (2);                % Base doping and type
NC = DOPING (3);                % Collector doping and type

sE = sign (NE);
sB = sign (NB);
sC = sign (NC);

NE = abs(NE);           % Emitter doping
NB = abs(NB);           % Base doping
NC = abs(NC);           % Collector doping

Ei_emitter  = [ (sE * k * T * log ( NE / ni ) ) ...
	       (-sB * k * T * log ( NB / ni ) ) ];
Ei_collector = [ (sB * k * T * log ( NB / ni ) ) ...
	       (-sC * k * T * log ( NC / ni ) ) ];

Vbi  = [ (sum (Ei_emitter)) (sum (Ei_collector)) ];
svbi = sign (Vbi);
Vbi  = abs  (Vbi);

			% Depletion width on emitter side of EB junction
xE  = sqrt(2*KS*e0/q*NB*Vbi(1)/(NE*(NB+NE)));
			% Depletion width on base side of EB junction
xBeb = sqrt(2*KS*e0/q*NE*Vbi(1)/(NB*(NE+NB)));

			% Depletion width on base side of CB junction
xBcb  = sqrt(2*KS*e0/q*NC*Vbi(2)/(NB*(NC+NB)));
			% Depletion width on collector side of EB junction
xC = sqrt(2*KS*e0/q*NB*Vbi(2)/(NC*(NB+NC)));
W = WB-xBeb-xBcb;

if W < 0
error('For the given DOPING and WB the base is totally depleted.')
end
  
if ( xC > xE )          % Adjust the x-axis for optimum looking plot
HIGH_X = 1.5;           
LOW_X = xC/xE;
else
HIGH_X = xE/xC;
LOW_X  = 1.5;
end

VMAX = 3;                        % Maximium Plot Voltage
plot ( [-LOW_X*xE HIGH_X*xC+WB ] , [ 0 VMAX ] , 'i');
hold on;

% EB JUNCTION
xlft = -LOW_X*xE;               % Leftmost x position
xrght = xBeb + W/2;             % Rightmost x position

x = linspace(xlft, xrght, 200);
sVx = -svbi(1) * sE * sB;

Vx1=sVx * (Vbi(1)-q*NB.*(xBeb-x).^2/(2*KS*e0).*(x<=xBeb)).*(x>=0);
Vx2=sVx * 0.5*q*NE.*(xE+x).^2/(KS*e0).*( x>=-xE & x<0 );
Vx=Vx1+Vx2;     % V as a function of x

EF=Vx(1)+VMAX/2-sE*k*T*log(NE/ni);  % Fermi level

Ec = -Vx+EG/2+VMAX/2;
Ev = -Vx-EG/2+VMAX/2;
Ei = -Vx+VMAX/2;

LEc = Ec (1);
LEv = Ev (1);
LEi = Ei (1);

% Plot V vs x
plot ( x, Ec );                               % Ec
plot ( x, Ev );                               % Ev
plot ( x, Ei, 'w:');                        % Ei
plot ( [xlft 0], [ EF EF ], 'w' );      % EF on left
plot ( [ 0 0 ], [ 0.15 VMAX-0.15 ], 'w--' );    % Junction center


% CB JUNCTION
xlft = -xBcb-W/2;               % Leftmost x position
xrght = HIGH_X*xC;      % Rightmost x position

x = linspace(xlft, xrght, 200);
sVx = -svbi(2) * sC * sB;

Vx1=sVx * (Vbi(2)-q*NC.*(xC-x).^2/(2*KS*e0).*(x<=xC)).*(x>=0);
Vx2=sVx * 0.5*q*NB.*(xBcb+x).^2/(KS*e0).*( x>=-xBcb & x<0 );
Vx=Vx1+Vx2;     % V as a function of x

OFFSET = (Ec(200))-(-Vx(1)+EG/2+VMAX/2);
Ec = (-Vx+EG/2+VMAX/2) + OFFSET;
Ev = (-Vx-EG/2+VMAX/2) + OFFSET;
Ei = (-Vx+VMAX/2) + OFFSET;

x = x + WB;

% Plot V vs x
plot ( x, Ec );                         % Ec
plot ( x, Ev );                         % Ev
plot ( x, Ei, 'w:');                            % Ei
plot ([0 xrght+WB], [EF EF], 'w');  %EF on right
plot ( [ WB WB ], [ 0.15 VMAX-0.15 ], 'w--' );  % Junction center

if ( sC == -1 )
    RIGHT = 'N';
else
    RIGHT = 'P';
end

if ( sB == -1 )
    MIDL = 'N';
else
    MIDL = 'P';
end

if ( sE == -1 )
    LEFT = 'N';
else
    LEFT = 'P';
end

A = -LOW_X*xE/2;
B = WB + ((HIGH_X*xC+WB)-WB)/2;

text ( A , 2.5, LEFT );
text ( WB/2, 2.5, MIDL );
text ( B , 2.5, RIGHT);


text ( x(200), Ec (200), 'Ec' );
text ( x(200), Ei (200), 'Ei' );
text ( x(200), Ev (200), 'Ev' );
text ( x(200), EF , 'EF' );

REG = [ LEFT(1) MIDL(1) RIGHT(1) ];
TITLE = [ ('Energy band diagram for the ') (REG) (' device') ];
title (TITLE);

