%Exercise 15.2...Comparison of IDsat Relationships

%Computational parameters
clear
z=-0.4;           %z=Vbi/VP
x=linspace(0,1);  %x=VG/VP

%P-Theory (y=IDsat/ID0)
Num=x-1-(2/3)*(z-1)*(1-((z-x)./(z-1)).^(1.5));
Den=-1-(2/3)*(z-1)*(1-(z./(z-1)).^(1.5));
yP=Num./Den;

%Square-law Theory
yS=(1-x).^2;

%Plotting result
close
plot(x,yP,x,yS,'--');  grid
xlabel('VG/VP');  ylabel('IDsat/ID0');
text(0.38,0.4,'Square-Law')
text(0.27,0.3,'Eq.(15.13)')
text(0.8,0.83,'Vbi/VP=-0.4')

