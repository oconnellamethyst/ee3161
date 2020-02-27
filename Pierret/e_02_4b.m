%Experimental fit of Sproul-Green ni data (275K - 375K)

%ni calculation
T=275:25:375;
k=8.617e-5;
ni=(9.15e19).*(T./300).^2 .*exp(-0.5928./(k*T));

%Display result on screen
j=length(T);
fprintf('\n\n T          ni\n');
for ii=1:j,
fprintf('%-10.f%-10.3e\n',T(ii),ni(ii));
end
