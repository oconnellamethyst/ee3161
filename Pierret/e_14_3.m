%Exercise 14.3...Least-Squares fit to MS diode I-V data
%ln(I)=ln(Is)+qVA/n1kT

I=[4.047e-7 2.792e-6 1.890e-5 1.263e-4 8.084e-4 4.487e-3];
VA=[0.1 0.15 0.2 0.25 0.3 0.35];
y=log(I);
c=polyfit(VA,y,1);     %least squares fit function
                       %c(1)=slope;  c(2)=ln(Is)
slope=c(1);
format compact
n1=1/(0.0259*slope)    %kT/q=0.0259V
Is=exp(c(2))
