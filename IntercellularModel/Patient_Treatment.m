global bet delt a1 m p3 k c alph pm rm ST ET
tf=30;
ET = 35;
T0 = 1e+11;
figure(1)
set(gcf, 'Position',  [100, 100, 1100, 800])
set(0,'DefaultAxesFontSize',18)
subplot(4,3,1)
% patient1
bet = 2.07e-7; delt = 0.248; a1 = 0.9; m = 0.047; p3 = 1.56e-3*1.4; k=2.37e-10; c=1.24; alph=1.72e-8; pm=1.33e-5; rm=1.98;
xdata = [2, 8, 10, 12, 13, 14, 15, 16]+4;
ydata = [18007, 506, 3253, 68, 68, 1332, 68, 68];
ST = 34;
Idodof=[T0 0 0 0.1 0 0]; 
err = zeros(1,6);
for i = 1:6
    err(i) = 1e-10;
end
options=odeset('RelTol',1e-10,'AbsTol',err); 
[T1,X1]=ode45(@CoronaModelNewTreatment,[0 tf],Idodof,options); 
ST = 4;
[T2,X2]=ode45(@CoronaModelNewTreatment,[0 tf],Idodof,options);
Idodof=[T0 0 0 0.1 0 0 2.6e+11]; 
err = zeros(1,7);
for i = 1:7
    err(i) = 1e-10;
end
options=odeset('RelTol',1e-10,'AbsTol',err); 
[T3,X3]=ode45(@CPTreatment_1,[0 tf],Idodof,options);
[T4,X4]=ode45(@CPRemTreatment_1,[0 tf],Idodof,options);
AUC11 = trapz(T1, X1(:,4))
AUC21 = trapz(T2, X2(:,4))
AUC31 = trapz(T3, X3(:,4))
AUC41 = trapz(T4, X4(:,4))
semilogy(T1,X1(:,4),'color',[1 0 0,1],'LineWidth',4,'LineStyle','-')
hold on
semilogy(T2,X2(:,4),'color',[1 0 0,0.6],'LineWidth',4,'LineStyle','--')
hold on
semilogy(T3,X3(:,4),'color',[1 0 0,0.5],'LineWidth',4,'LineStyle',':')
hold on
semilogy(T4,X4(:,4),'color',[1 0 0,0.4],'LineWidth',4,'LineStyle','-.')
xlim([0 30])
xticks([0 10 20 30])
ylim([1 1e+6])
yticks([1 1e+3 1e+6])
hold on
semilogy(xdata, ydata,'bo','markerfacecolor','blue','markersize',8)
% ylim([1 inf])
% ylabel('V','rot', 0);

subplot(4,3,2)
% patient2
bet = 1.69e-8*1.5; delt = 0.248; a1 = 0.9; m = 0.00578; p3 = 8.13e-3; k = 2.63e-10*1.4; c = 3.15; alph = 5.87e-10*2; pm = 8.65e-7*10; rm = 1.58+0.05;
xdata = [10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22]+4;
ydata = [594320, 24519974, 32654, 30312, 4719, 1332, 405, 1546, 3775, 853, 791, 68, 1933];
ST = 34;
Idodof=[T0 0 0 0.1 0 0]; 
err = zeros(1,6);
for i = 1:6
    err(i) = 1e-10;
end
options=odeset('RelTol',1e-10,'AbsTol',err); 
[T1,X1]=ode45(@CoronaModelNewTreatment,[0 tf],Idodof,options); 
ST = 6;
[T2,X2]=ode45(@CoronaModelNewTreatment,[0 tf],Idodof,options);
Idodof=[T0 0 0 0.1 0 0 2.6e+11]; 
err = zeros(1,7);
for i = 1:7
    err(i) = 1e-10;
end
options=odeset('RelTol',1e-10,'AbsTol',err); 
[T3,X3]=ode45(@CPTreatment_1,[0 tf],Idodof,options);
[T4,X4]=ode45(@CPRemTreatment_1,[0 tf],Idodof,options);
AUC12 = trapz(T1, X1(:,4))
AUC22 = trapz(T2, X2(:,4))
AUC32 = trapz(T3, X3(:,4))
AUC42 = trapz(T4, X4(:,4))
semilogy(T1,X1(:,4),'color',[1 0 0,1],'LineWidth',4,'LineStyle','-')
hold on
semilogy(T2,X2(:,4),'color',[1 0 0,0.6],'LineWidth',4,'LineStyle','--')
hold on
semilogy(T3,X3(:,4),'color',[1 0 0,0.5],'LineWidth',4,'LineStyle',':')
hold on
semilogy(T4,X4(:,4),'color',[1 0 0,0.4],'LineWidth',4,'LineStyle','-.')
xlim([0 30])
xticks([0 10 20 30])
ylim([1 1e+8])
yticks([1 1e+4 1e+8])
hold on
semilogy(xdata, ydata,'bo','markerfacecolor','blue','markersize',8)
% ylim([1 inf])
% ylabel('V','rot', 0);

subplot(4,3,3)
% patient3
bet = 1.55e-7/1.7; delt = 0.344; a1 = 0.9; m = 0.495/5; p3 = 2.12e-3; k = 2.69e-10; c = 1.18; alph = 1.03e-8*1.5; pm = 1.69e-5/1.2; rm = 2.25/1.1;
xdata = [2, 7, 11, 12, 14, 15, 16]+6;
ydata = [6355, 5899, 12414, 14405, 68, 68, 68];
ST = 34;
Idodof=[T0 0 0 0.1 0 0]; 
err = zeros(1,6);
for i = 1:6
    err(i) = 1e-10;
end
options=odeset('RelTol',1e-10,'AbsTol',err); 
[T1,X1]=ode45(@CoronaModelNewTreatment,[0 tf],Idodof,options); 
ST = 6;
[T2,X2]=ode45(@CoronaModelNewTreatment,[0 tf],Idodof,options);
Idodof=[T0 0 0 0.1 0 0 2.6e+11]; 
err = zeros(1,7);
for i = 1:7
    err(i) = 1e-10;
end
options=odeset('RelTol',1e-10,'AbsTol',err); 
[T3,X3]=ode45(@CPTreatment_1,[0 tf],Idodof,options);
[T4,X4]=ode45(@CPRemTreatment_1,[0 tf],Idodof,options);
AUC13 = trapz(T1, X1(:,4))
AUC23 = trapz(T2, X2(:,4))
AUC33 = trapz(T3, X3(:,4))
AUC43 = trapz(T4, X4(:,4))
semilogy(T1,X1(:,4),'color',[1 0 0,1],'LineWidth',4,'LineStyle','-')
hold on
semilogy(T2,X2(:,4),'color',[1 0 0,0.6],'LineWidth',4,'LineStyle','--')
hold on
semilogy(T3,X3(:,4),'color',[1 0 0,0.5],'LineWidth',4,'LineStyle',':')
hold on
semilogy(T4,X4(:,4),'color',[1 0 0,0.4],'LineWidth',4,'LineStyle','-.')
xlim([0 30])
xticks([0 10 20 30])
ylim([1 1e+6])
yticks([1 1e+3 1e+6])
hold on
semilogy(xdata, ydata,'bo','markerfacecolor','blue','markersize',8)
% ylim([1 inf])
% ylabel('V','rot', 0);

subplot(4,3,4)
% patient4
% bet = 8.74e-7; delt = 1.84; a1 = 0.92; m = 0.0276; p3 = 4.42e-3; k = 3.24e-10; c = 1.4; alph = 6.01e-10; pm = 3.44e-6; rm = 1.32;
bet = 12.7e-8*1.3; delt = 0.2; a1 = 1; m = 0.001; p3 = 9.4e-3; k = 2.2e-10; c = 1.61; alph = 1.37e-9; pm = 7.98e-5/1.8; rm = 1.21+0.02;
xdata = [2, 3, 5, 7, 8, 10, 11, 12, 13, 14, 15, 16, 17, 18]+2;
ydata = [28453782, 3053796, 134221, 18007, 3775, 12414, 106, 8558, 68, 68, 1066, 40819, 68, 9218];
ST = 34;
Idodof=[T0 0 0 0.1 0 0]; 
err = zeros(1,6);
for i = 1:6
    err(i) = 1e-10;
end
options=odeset('RelTol',1e-10,'AbsTol',err); 
[T1,X1]=ode45(@CoronaModelNewTreatment,[0 tf],Idodof,options); 
ST = 2; %rm = 1.35;
[T2,X2]=ode45(@CoronaModelNewTreatment,[0 tf],Idodof,options);
Idodof=[T0 0 0 0.1 0 0 2.6e+11]; 
err = zeros(1,7);
for i = 1:7
    err(i) = 1e-10;
end
options=odeset('RelTol',1e-10,'AbsTol',err); 
rm = 1.23;
[T3,X3]=ode45(@CPTreatment_1,[0 tf],Idodof,options);
[T4,X4]=ode45(@CPRemTreatment_1,[0 tf],Idodof,options);
AUC14 = trapz(T1, X1(:,4))
AUC24 = trapz(T2, X2(:,4))
AUC34 = trapz(T3, X3(:,4))
AUC44 = trapz(T4, X4(:,4))
semilogy(T1,X1(:,4),'color',[1 0 0,1],'LineWidth',4,'LineStyle','-')
hold on
semilogy(T2,X2(:,4),'color',[1 0 0,0.6],'LineWidth',4,'LineStyle','--')
hold on
semilogy(T3,X3(:,4),'color',[1 0 0,0.5],'LineWidth',4,'LineStyle',':')
hold on
semilogy(T4,X4(:,4),'color',[1 0 0,0.4],'LineWidth',4,'LineStyle','-.')
xlim([0 30])
xticks([0 10 20 30])
ylim([1 1e+8])
yticks([1 1e+4 1e+8])
hold on
semilogy(xdata, ydata,'bo','markerfacecolor','blue','markersize',8)
% ylim([1 inf])
% ylabel('V','rot', 0);

subplot(4,3,5)
% patient5
% bet = 1.11e-7; delt = 0.212; a1 = 2.57; a2 = 2.29; m = 0.498; p3 = 2.43e-3; k = 2.52e-10; c = 1.61; alph = 1.05e-8; pm = 3.16e-5; rm = 1.45;
bet = 5.89e-8; delt = 0.17; a1 = 1; m = 0.115; p3 = 1.96e-3; k = 5.55e-10; c = 1.14; alph = 1.91e-8; pm = 1.94e-5; rm = 1.37;
xdata = [2, 3, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22]+6;
ydata = [1332, 4719, 28139, 74018, 1332, 1933, 10697, 1933, 2602, 6355, 2416, 20896, 4719, 20896, 7944, 68, 791, 735, 68, 68];
ST = 34;
Idodof=[T0 0 0 0.1 0 0]; 
err = zeros(1,6);
for i = 1:6
    err(i) = 1e-10;
end
options=odeset('RelTol',1e-10,'AbsTol',err); 
[T1,X1]=ode45(@CoronaModelNewTreatment,[0 tf],Idodof,options); 
ST = 6;
[T2,X2]=ode45(@CoronaModelNewTreatment,[0 tf],Idodof,options);
Idodof=[T0 0 0 0.1 0 0 2.6e+11]; 
err = zeros(1,7);
for i = 1:7
    err(i) = 1e-10;
end
options=odeset('RelTol',1e-10,'AbsTol',err); 
[T3,X3]=ode45(@CPTreatment_1,[0 tf],Idodof,options);
[T4,X4]=ode45(@CPRemTreatment_1,[0 tf],Idodof,options);
AUC15 = trapz(T1, X1(:,4))
AUC25 = trapz(T2, X2(:,4))
AUC35 = trapz(T3, X3(:,4))
AUC45 = trapz(T4, X4(:,4))
semilogy(T1,X1(:,4),'color',[1 0 0,1],'LineWidth',4,'LineStyle','-')
hold on
semilogy(T2,X2(:,4),'color',[1 0 0,0.6],'LineWidth',4,'LineStyle','--')
hold on
semilogy(T3,X3(:,4),'color',[1 0 0,0.5],'LineWidth',4,'LineStyle',':')
hold on
semilogy(T4,X4(:,4),'color',[1 0 0,0.4],'LineWidth',4,'LineStyle','-.')
xlim([0 30])
xticks([0 10 20 30])
ylim([1 1e+6])
yticks([1 1e+3 1e+6])
hold on
semilogy(xdata, ydata,'bo','markerfacecolor','blue','markersize',8)
% ylim([1 inf])
% ylabel('V','rot', 0);

subplot(4,3,6)
% patient6
% bet = 8.92e-8/1.4; delt = 0.0342; a1 = 2.38; a2 = 2.21; m = 0.00553; p3 = 3.81e-3; k = 2.63e-10; c = 1.01; alph = 1.58e-8; pm = 1.57e-5; rm = 1.34*1.03;
bet = 1.3e-7; delt = 0.275; a1 = 0.82; m = 0.187; p3 = 3.2e-3; k = 5e-10; c = 1.89; alph = 7.89e-9; pm = 3.1e-5; rm = 1.48;
xdata = [3, 5, 6, 7, 8, 10, 11, 12, 14, 15, 16, 17, 18, 19, 20, 21, 22]+2;
ydata = [68, 16716, 5084, 1148, 13372, 68, 2803, 2416, 3775, 124598, 68, 7944, 9218, 1933, 68, 918, 223];
ST = 34;
Idodof=[T0 0 0 0.1 0 0]; 
err = zeros(1,6);
for i = 1:6
    err(i) = 1e-10;
end
options=odeset('RelTol',1e-10,'AbsTol',err); 
[T1,X1]=ode45(@CoronaModelNewTreatment,[0 tf],Idodof,options); 
ST = 4;
[T2,X2]=ode45(@CoronaModelNewTreatment,[0 tf],Idodof,options);
Idodof=[T0 0 0 0.1 0 0 2.6e+11]; 
err = zeros(1,7);
for i = 1:7
    err(i) = 1e-10;
end
options=odeset('RelTol',1e-10,'AbsTol',err); 
[T3,X3]=ode45(@CPTreatment_1,[0 tf],Idodof,options);
[T4,X4]=ode45(@CPRemTreatment_1,[0 tf],Idodof,options);
AUC16 = trapz(T1, X1(:,4))
AUC26 = trapz(T2, X2(:,4))
AUC36 = trapz(T3, X3(:,4))
AUC46 = trapz(T4, X4(:,4))
semilogy(T1,X1(:,4),'color',[1 0 0,1],'LineWidth',4,'LineStyle','-')
hold on
semilogy(T2,X2(:,4),'color',[1 0 0,0.6],'LineWidth',4,'LineStyle','--')
hold on
semilogy(T3,X3(:,4),'color',[1 0 0,0.5],'LineWidth',4,'LineStyle',':')
hold on
semilogy(T4,X4(:,4),'color',[1 0 0,0.4],'LineWidth',4,'LineStyle','-.')
xlim([0 30])
xticks([0 10 20 30])
ylim([1 1e+6])
yticks([1 1e+3 1e+6])
hold on
semilogy(xdata, ydata,'bo','markerfacecolor','blue','markersize',8)
% ylim([1 inf])
% ylabel('V','rot', 0);

subplot(4,3,7)
% patient7
% bet = 2.48e-7/2.5; delt = 0.222; a1 = 0.8; m = 0.3; p3 = 0.014; k = 2.73e-10; c = 1.73+0.2; alph = 4.3e-9*2.8*1.5; pm = 2.37e-5; rm = 2.76+0.3;
bet = 13.3e-8; delt = 0.2; a1 = 0.85; m = 0.2; p3 = 9.91e-3; k = 4.28e-10; c = 1.97; alph = 4.48e-9*1.4; pm = 7.9e-5/1.2; rm = 2.83;
xdata = [1, 2, 4, 5, 6, 7, 9, 10, 11]+4;
ydata = [1250605, 68712, 546, 1794, 1546, 5476, 68, 68, 68];
ST = 34;
Idodof=[T0 0 0 0.1 0 0]; 
err = zeros(1,6);
for i = 1:6
    err(i) = 1e-10;
end
options=odeset('RelTol',1e-10,'AbsTol',err); 
[T1,X1]=ode45(@CoronaModelNewTreatment,[0 tf],Idodof,options); 
ST = 4;
[T2,X2]=ode45(@CoronaModelNewTreatment,[0 tf],Idodof,options);
Idodof=[T0 0 0 0.1 0 0 2.6e+11]; 
err = zeros(1,7);
for i = 1:7
    err(i) = 1e-10;
end
options=odeset('RelTol',1e-10,'AbsTol',err); 
[T3,X3]=ode45(@CPTreatment_1,[0 tf],Idodof,options);
[T4,X4]=ode45(@CPRemTreatment_1,[0 tf],Idodof,options);
AUC17 = trapz(T1, X1(:,4))
AUC27 = trapz(T2, X2(:,4))
AUC37 = trapz(T3, X3(:,4))
AUC47 = trapz(T4, X4(:,4))
semilogy(T1,X1(:,4),'color',[1 0 0,1],'LineWidth',4,'LineStyle','-')
hold on
semilogy(T2,X2(:,4),'color',[1 0 0,0.6],'LineWidth',4,'LineStyle','--')
hold on
semilogy(T3,X3(:,4),'color',[1 0 0,0.5],'LineWidth',4,'LineStyle',':')
hold on
semilogy(T4,X4(:,4),'color',[1 0 0,0.4],'LineWidth',4,'LineStyle','-.')
xlim([0 30])
xticks([0 10 20 30])
ylim([1 1e+8])
yticks([1 1e+4 1e+8])
hold on
semilogy(xdata, ydata,'bo','markerfacecolor','blue','markersize',8)
% ylim([1 inf])
% ylabel('V','rot', 0);

subplot(4,3,8)
% patient8
% bet = 3.68e-7/3.5; delt = 0.63; a1 = 0.8; m = 0.0255; p3 = 0.0056; k = 3.28e-10; c = 0.538+0.15; alph = 4.41e-8*2.5*1.5; pm = 6.12e-5; rm = 1.89+0.3;
bet = 9.46e-8*1.1; delt = 0.35; a1 = 0.8; m = 0.04; p3 = 8.03e-3/2.2; k = 3.5e-10; c = 1.3; alph = 9.74e-9*1.7; pm = 7e-5; rm = 2.24-0.06;
xdata = [3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 14, 15, 16, 17]+4;
ydata = [35175, 6355, 19398, 4381, 2416, 5476, 1332, 1237, 68, 2082, 68, 68, 68, 68];
ST = 34;
Idodof=[T0 0 0 0.1 0 0]; 
err = zeros(1,6);
for i = 1:6
    err(i) = 1e-10;
end
options=odeset('RelTol',1e-10,'AbsTol',err); 
[T1,X1]=ode45(@CoronaModelNewTreatment,[0 tf],Idodof,options); 
ST = 4;
[T2,X2]=ode45(@CoronaModelNewTreatment,[0 tf],Idodof,options);
Idodof=[T0 0 0 0.1 0 0 2.6e+11]; 
err = zeros(1,7);
for i = 1:7
    err(i) = 1e-10;
end
options=odeset('RelTol',1e-10,'AbsTol',err); 
[T3,X3]=ode45(@CPTreatment_1,[0 tf],Idodof,options);
[T4,X4]=ode45(@CPRemTreatment_1,[0 tf],Idodof,options);
AUC18 = trapz(T1, X1(:,4))
AUC28 = trapz(T2, X2(:,4))
AUC38 = trapz(T3, X3(:,4))
AUC48 = trapz(T4, X4(:,4))
semilogy(T1,X1(:,4),'color',[1 0 0,1],'LineWidth',4,'LineStyle','-')
hold on
semilogy(T2,X2(:,4),'color',[1 0 0,0.6],'LineWidth',4,'LineStyle','--')
hold on
semilogy(T3,X3(:,4),'color',[1 0 0,0.5],'LineWidth',4,'LineStyle',':')
hold on
semilogy(T4,X4(:,4),'color',[1 0 0,0.4],'LineWidth',4,'LineStyle','-.')
xlim([0 30])
xticks([0 10 20 30])
ylim([1 1e+6])
yticks([1 1e+3 1e+6])
hold on
semilogy(xdata, ydata,'bo','markerfacecolor','blue','markersize',8)
% ylim([1 inf])
% ylabel('V','rot', 0);

subplot(4,3,9)
% patient9
bet = 2.12e-7/2; delt = 0.51; a1 = 0.84; m = 0.0106/3; p3 = 0.0104; k = 2.8e-10; c = 0.991+0.1; alph = 8.58e-10; pm = 9.53e-6; rm = 1.73+0.4;
xdata = [1, 2, 3, 4, 5, 6, 8, 9, 10, 11, 12, 13, 14, 15, 16, 18]+3;
ydata = [99674, 5537580, 107372, 5537580, 2442924, 1077705, 134221, 5476, 6355, 68, 9218, 9930, 68, 68, 68, 68];
ST = 34;
Idodof=[T0 0 0 0.1 0 0]; 
err = zeros(1,6);
for i = 1:6
    err(i) = 1e-10;
end
options=odeset('RelTol',1e-10,'AbsTol',err); 
[T1,X1]=ode45(@CoronaModelNewTreatment,[0 tf],Idodof,options); 
ST = 3;
[T2,X2]=ode45(@CoronaModelNewTreatment,[0 tf],Idodof,options);
Idodof=[T0 0 0 0.1 0 0 2.6e+11]; 
err = zeros(1,7);
for i = 1:7
    err(i) = 1e-10;
end
options=odeset('RelTol',1e-10,'AbsTol',err); 
[T3,X3]=ode45(@CPTreatment_1,[0 tf],Idodof,options);
[T4,X4]=ode45(@CPRemTreatment_1,[0 tf],Idodof,options);
AUC19 = trapz(T1, X1(:,4))
AUC29 = trapz(T2, X2(:,4))
AUC39 = trapz(T3, X3(:,4))
AUC49 = trapz(T4, X4(:,4))
semilogy(T1,X1(:,4),'color',[1 0 0,1],'LineWidth',4,'LineStyle','-')
hold on
semilogy(T2,X2(:,4),'color',[1 0 0,0.6],'LineWidth',4,'LineStyle','--')
hold on
semilogy(T3,X3(:,4),'color',[1 0 0,0.5],'LineWidth',4,'LineStyle',':')
hold on
semilogy(T4,X4(:,4),'color',[1 0 0,0.4],'LineWidth',4,'LineStyle','-.')
xlim([0 30])
xticks([0 10 20 30])
ylim([1 1e+8])
yticks([1 1e+4 1e+8])
hold on
semilogy(xdata, ydata,'bo','markerfacecolor','blue','markersize',8)
% ylim([1 inf])
% ylabel('V','rot', 0);

subplot(4,3,10)
% patient10
% bet = 1.83e-7/1.5; delt = 0.229; a1 = 0.8; m = 0.496/3; p3 = 0.0418; k = 2.66e-10; c = 3.91; alph = 3e-9; pm = 5.65e-5; rm = 1.8-0.23;  
bet = 12.2e-8; delt = 0.229; a1 = 0.8; m = 0.16/1.3; p3 = 41.8e-3/4.1; k = 2.66e-10; c = 3.91; alph = 3e-9; pm = 5.65e-5; rm = 1.57;
xdata = [6, 8, 9, 10, 11, 12, 13]+6;
ydata = [279, 22510, 1451243, 8558, 5084, 1148, 853];
ST = 34;
Idodof=[T0 0 0 0.1 0 0]; 
err = zeros(1,6);
for i = 1:6
    err(i) = 1e-10;
end
options=odeset('RelTol',1e-10,'AbsTol',err); 
[T1,X1]=ode45(@CoronaModelNewTreatment,[0 tf],Idodof,options); 
ST = 6;
[T2,X2]=ode45(@CoronaModelNewTreatment,[0 tf],Idodof,options);
Idodof=[T0 0 0 0.1 0 0 2.6e+11]; 
err = zeros(1,7);
for i = 1:7
    err(i) = 1e-10;
end
options=odeset('RelTol',1e-10,'AbsTol',err); 
[T3,X3]=ode45(@CPTreatment_1,[0 tf],Idodof,options);
[T4,X4]=ode45(@CPRemTreatment_1,[0 tf],Idodof,options);
AUC110 = trapz(T1, X1(:,4))
AUC210 = trapz(T2, X2(:,4))
AUC310 = trapz(T3, X3(:,4))
AUC410 = trapz(T4, X4(:,4))
semilogy(T1,X1(:,4),'color',[1 0 0,1],'LineWidth',4,'LineStyle','-')
hold on
semilogy(T2,X2(:,4),'color',[1 0 0,0.6],'LineWidth',4,'LineStyle','--')
hold on
semilogy(T3,X3(:,4),'color',[1 0 0,0.5],'LineWidth',4,'LineStyle',':')
hold on
semilogy(T4,X4(:,4),'color',[1 0 0,0.4],'LineWidth',4,'LineStyle','-.')
xlim([0 30])
xticks([0 10 20 30])
ylim([1 1e+8])
yticks([1 1e+4 1e+8])
hold on
semilogy(xdata, ydata,'bo','markerfacecolor','blue','markersize',8)
% ylim([1 inf])
% ylabel('V','rot', 0);

subplot(4,3,11)
% patient11
% bet = 1.15e-7; delt = 0.326; a1 = 0.8; m = 0.2/3; p3 = 1.3e-3; k = 5.44e-10; c = 0.157; alph = 3.42e-8; pm = 7.44e-5; rm = 2.42;
bet = 12.5e-8; delt = 0.2; a1 = 0.9; m = 0.2/3; p3 = 1.3e-3; k = 4e-10; c = 0.75; alph = 8.09e-9; pm = 6.5e-5; rm = 2.54-0.04;
xdata = [0, 1, 2, 3, 4, 5, 7, 8, 9, 10]+6;
ydata = [2416, 9930, 3775, 13372, 1546, 18007, 12414, 28139, 68, 68];
ST = 34;
Idodof=[T0 0 0 0.1 0 0]; 
err = zeros(1,6);
for i = 1:6
    err(i) = 1e-10;
end
options=odeset('RelTol',1e-10,'AbsTol',err); 
[T1,X1]=ode45(@CoronaModelNewTreatment,[0 tf],Idodof,options); 
ST = 6;
[T2,X2]=ode45(@CoronaModelNewTreatment,[0 tf],Idodof,options);
Idodof=[T0 0 0 0.1 0 0 2.6e+11]; 
err = zeros(1,7);
for i = 1:7
    err(i) = 1e-10;
end
options=odeset('RelTol',1e-10,'AbsTol',err); 
[T3,X3]=ode45(@CPTreatment,[0 tf],Idodof,options);
[T4,X4]=ode45(@CPRemTreatment,[0 tf],Idodof,options);
AUC111 = trapz(T1, X1(:,4))
AUC211 = trapz(T2, X2(:,4))
AUC311 = trapz(T3, X3(:,4))
AUC411 = trapz(T4, X4(:,4))
semilogy(T1,X1(:,4),'color',[1 0 0,1],'LineWidth',4,'LineStyle','-')
hold on
semilogy(T2,X2(:,4),'color',[1 0 0,0.6],'LineWidth',4,'LineStyle','--')
hold on
semilogy(T3,X3(:,4),'color',[1 0 0,0.5],'LineWidth',4,'LineStyle',':')
hold on
semilogy(T4,X4(:,4),'color',[1 0 0,0.4],'LineWidth',4,'LineStyle','-.')
xlim([0 30])
xticks([0 10 20 30])
ylim([1 1e+6])
yticks([1 1e+3 1e+6])
hold on
semilogy(xdata, ydata,'bo','markerfacecolor','blue','markersize',8)
% ylim([1 inf])
% ylabel('V','rot', 0);

subplot(4,3,12)
% patient12
% bet = 1.34e-7; delt = 0.177*2; a1 = 0.7; m = 0.000208*50; p3 = 6.42e-3; k = 9.65e-11/1.2; c = 1.37; alph = 8.18e-10*2; pm = 1.45e-3; rm = 1.61+0.17;
bet = 6.07e-8; delt = 0.2; a1 = 0.9; m = 0.001; p3 = 9.31e-3; k = 0.9e-10*1.4; c = 1.7; alph = 1.12e-9; pm = 7.7e-5; rm =1.98;
xdata = [1, 2, 3, 4, 5, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 18, 20]+4;
ydata = [99674, 1160941, 640221, 5965269, 74018, 24249, 3020, 11524, 7944, 68, 15518, 13372, 4719, 1237, 123, 918, 470];
ST = 34;
Idodof=[T0 0 0 0.1 0 0]; 
err = zeros(1,6);
for i = 1:6
    err(i) = 1e-10;
end
options=odeset('RelTol',1e-10,'AbsTol',err); 
[T1,X1]=ode45(@CoronaModelNewTreatment,[0 tf],Idodof,options); 
ST = 4;
[T2,X2]=ode45(@CoronaModelNewTreatment,[0 tf],Idodof,options);
Idodof=[T0 0 0 0.1 0 0 2.6e+11]; 
err = zeros(1,7);
for i = 1:7
    err(i) = 1e-10;
end
options=odeset('RelTol',1e-10,'AbsTol',err); 
[T3,X3]=ode45(@CPTreatment_1,[0 tf],Idodof,options);
[T4,X4]=ode45(@CPRemTreatment_1,[0 tf],Idodof,options);
AUC112 = trapz(T1, X1(:,4))
AUC212 = trapz(T2, X2(:,4))
AUC312 = trapz(T3, X3(:,4))
AUC412 = trapz(T4, X4(:,4))
semilogy(T1,X1(:,4),'color',[1 0 0,1],'LineWidth',4,'LineStyle','-')
hold on
semilogy(T2,X2(:,4),'color',[1 0 0,0.6],'LineWidth',4,'LineStyle','--')
hold on
semilogy(T3,X3(:,4),'color',[1 0 0,0.5],'LineWidth',4,'LineStyle',':')
hold on
semilogy(T4,X4(:,4),'color',[1 0 0,0.4],'LineWidth',4,'LineStyle','-.')
xlim([0 30])
xticks([0 10 20 30])
ylim([1 1e+8])
yticks([1 1e+4 1e+8])
hold on
semilogy(xdata, ydata,'bo','markerfacecolor','blue','markersize',8)
% ylim([1 inf])
% ylabel('V','rot', 0);
set(figure(1),'Renderer','painters')