%ni vs. T calculation for Si (200K - 700K) used in Fig. 2.20

%Initialization
format short e

%Constants and T-range
k=8.617e-5;
A=2.510e19;
Eex=0.0074;    %Value was adjust to match S&G ni(300K) value
T=200:25:700;
                
%Band Gap vs. T
EG0=1.17;
a=4.730e-4;
b=636;
EG=EG0-a.*(T.^2)./(T+b);

%Effective mass ratio (mnr=mn*/m0, mpr=mp*/m0)
mnr=1.028 + (6.11e-4).*T - (3.09e-7).*T.^2;
mpr=0.610 + (7.83e-4).*T - (4.46e-7).*T.^2;

%Computation of ni
ni=A.*((T./300).^(1.5)).*((mnr.*mpr).^(0.75)).*exp(-(EG-Eex)./(2 .*k.*T));

%Display output on screen
j=length(T);
fprintf('\n\n T          ni\n');
for ii=1:j,
fprintf('%-10.f%-10.3e\n',T(ii),ni(ii));
end

