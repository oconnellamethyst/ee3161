%Exercise 8.2--Turn-off/Turn-on Concentration Plot Generator


%Determine type of desired plot
close
clear
s=menu('Choose the desired plot','OFF-Linear','OFF-Semilog',...
   'ON-Linear','ON-Semilog');

%Compute ts/taup if reverse-bias plot is desired
if s<=2,
  %Let Iratio=IR/IF and TS=ts/taup
  Iratio=input('Please input the IR/IF ratio:  IR/IF = ');
  if Iratio==0,    %Catch if IR=0
     TS=1;
     else
     TS=(erfinv(1. /(1+Iratio)))^2;
     end
  else
  end

%Set values of X and T to be computed for desired plot
%X=x'/LP and T=t/taup
if s==1 | s==2,
  X=0:0.03:3;
  T=TS/10:TS/10:TS;
  else
  X=0:0.03:3;
  T=[0.1:0.1:2];
  end

%Plot steady-state curve, set axes-labels
y0=exp(-X);
if s==1 | s==3,
  plot(X,y0,'g')
  axis([0 3 0 1])
  else
  semilogy(X,y0,'g')
  axis([0 3 1.0e-3 1])  
  end
xlabel('x`/LP'); ylabel('[pn(x`,t)-pn0]/[pnmax-pn0]')
grid; hold on

%Primary computations and time-dependent plots
j=length(T);
for i=1:j,
  A=exp(-X).*(1-erf(X./(2*sqrt(T(i)))-sqrt(T(i))));
  B=exp(X).*(1-erf(X./(2*sqrt(T(i)))+sqrt(T(i))));
  yon=(A-B)/2;    %yon=[pn(x',t)-pn0]/[pnmax-pn0] during turn-on
  if s==3,
    plot(X,yon);
  elseif s==1,
    yoff=exp(-X)-(1+Iratio).*yon;    %yoff=[pn(x',t)-pn0]/[pnmax-pn0] during turn-off
    plot(X,yoff);
  else
  end
  if s==4,
    semilogy(X,yon);
  elseif s==2,
    yoff=exp(-X)-(1+Iratio).*yon;
    semilogy(X,yoff);
    else
    end
end
hold off
