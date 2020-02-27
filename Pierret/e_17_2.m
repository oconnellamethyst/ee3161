% "Universal" ID-VD Characteristics /// Square-Law Theory

%Initialization
close
clear

%Let VGT = VG - VT;
for VGT=4:-1:1,

     %Primary Computation
     VD=linspace(0,VGT);
     ID=VGT.*VD-VD.*VD./2;
     IDsat=VGT*VGT/2;
     VD=[VD,9];
     ID=[ID,IDsat];

     %Plotting and Labeling
     if VGT==4,
     plot(VD,ID);  grid;
	 axis([0 10 0 10]);
     xlabel('VD (volts)');  ylabel('ID/(ZuCo/L)');
     text(8,IDsat+0.2,'VG-VT=4V');
     hold on
     else,
     plot(VD,ID);
     %The following 'if' labels VG-VT curves < 4
     if VGT==3,
     text(8,IDsat+0.2,'VG-VT=3V');
     elseif VGT==2,
     text(8,IDsat+0.2,'VG-VT=2V');
     else,
     text(8,IDsat+0.2,'VG-VT=1V');
     end
     end
end
hold off
