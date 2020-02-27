%Mobility versus Dopant Concentration (Si,300K)

%Fit Parameters
NDref=1.3e17;  NAref=2.35e17;
unmin=92;  upmin=54.3;
un0=1268;  up0=406.9;
an=0.91;  ap=0.88;

%Mobility Calculation
N=logspace(14,19);
un=unmin+un0./(1+(N/NDref).^an);
up=upmin+up0./(1+(N/NAref).^ap);

%Plotting results
close
loglog(N,un,N,up); grid;
axis([1.0e14 1.0e19 1.0e1 1.0e4]);
xlabel('NA or ND (cm-3)');
ylabel('Mobility (cm2/V-sec)');
text(1.0e15,1500,'Electrons');
text(1.0e15,500,'Holes');
text(1.0e18,2000,'Si,300K');


