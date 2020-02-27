function [y] = cvintgrd(U)
global UF
F=sqrt(exp(UF).*(exp(-U)+U-1)+exp(-UF).*(exp(U)-U-1));
y=(1-exp(-U)).*(exp(U)-U-1)./(2*F.^3);
