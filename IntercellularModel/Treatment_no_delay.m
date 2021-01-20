global ST ET m alph rm lam
lam = 10;
tf=30;
T0 = 1e+11;
Idodof=[T0 0 0 0.1 0 0]; 
err = zeros(1,6);
for i = 1:6
    err(i) = 1e-9;
end
ST = 40;
ET = 60;
m = 0.057; alph = 7.08e-9; rm = 1.98;
options=odeset('RelTol',1e-9,'AbsTol',err); 
[T1,X1]=ode45(@CoronaNewModel,[0 tf],Idodof,options); 
AUC1 = trapz(T1, X1(:,4))
Vpeak1 = max(X1(:,4))
Epeak1 = max(X1(:,5))
D1 = (1e+11-min(X1(:,1)))/1e+9
ST = 7;
ET = 60;
[T2,X2]=ode45(@CoronaNewModel,[0 tf],Idodof,options); 
AUC2 = trapz(T2, X2(:,4))
Vpeak2 = max(X2(:,4))
Epeak2 = max(X2(:,5))
D2 = (1e+11-min(X2(:,1)))/1e+9
ST = 6;
ET = 60;
[T3,X3]=ode45(@CoronaNewModel,[0 tf],Idodof,options); 
AUC3 = trapz(T3, X3(:,4))
Vpeak3 = max(X3(:,4))
Epeak3 = max(X3(:,5))
D3 = (1e+11-min(X3(:,1)))/1e+9
ST = 5;
ET = 60;
[T4,X4]=ode45(@CoronaNewModel,[0 tf],Idodof,options); 
AUC4 = trapz(T4, X4(:,4))
Vpeak4 = max(X4(:,4))
Epeak4 = max(X4(:,5))
D4 = (1e+11-min(X4(:,1)))/1e+9
figure(1)
% set(gcf, 'Position',  [100, 100, 1200, 250])
set(gcf, 'Position',  [100, 100, 1200, 800])
set(0,'DefaultAxesFontSize',18)
subplot(4,3,1) 
plot(T1,X1(:,1),'color',[0 0 0,1],'LineWidth',4,'LineStyle','-')
hold on
plot(T2,X2(:,1),'color',[0 0 0,0.6],'LineWidth',4,'LineStyle','--')
hold on
plot(T3,X3(:,1),'color',[0 0 0,0.5],'LineWidth',4,'LineStyle',':')
hold on
plot(T4,X4(:,1),'color',[0 0 0,0.4],'LineWidth',4,'LineStyle','-.')
xlim([0 30])
xticks([0 10 20 30])
ylim([9e+10 10e+10])
yticks([9e+10 10e+10])
ylabel('T','rot', 0);
title('(a)','FontWeight','normal');
subplot(4,3,2) 
semilogy(T1,X1(:,4),'color',[0 0 0,1],'LineWidth',4,'LineStyle','-')
hold on
semilogy(T2,X2(:,4),'color',[0 0 0,0.6],'LineWidth',4,'LineStyle','--')
hold on
semilogy(T3,X3(:,4),'color',[0 0 0,0.5],'LineWidth',4,'LineStyle',':')
hold on
semilogy(T4,X4(:,4),'color',[0 0 0,0.4],'LineWidth',4,'LineStyle','-.')
hold on
plot([0 30], [68 68],'color',[0 0.7 0,1],'LineWidth',2)
xlim([0 30])
xticks([0 10 20 30])
ylim([1 1e+6])
yticks([1 1e+3 1e+6])
ylabel('V','rot', 0);
title('(b)','FontWeight','normal');
subplot(4,3,3) 
semilogy(T1,X1(:,5),'color',[0 0 0,1],'LineWidth',4,'LineStyle','-')
hold on
semilogy(T2,X2(:,5),'color',[0 0 0,0.6],'LineWidth',4,'LineStyle','--')
hold on
semilogy(T3,X3(:,5),'color',[0 0 0,0.5],'LineWidth',4,'LineStyle',':')
hold on
semilogy(T4,X4(:,5),'color',[0 0 0,0.4],'LineWidth',4,'LineStyle','-.')
xlim([0 30])
xticks([0 10 20 30])
ylim([1 1e+3])
yticks([1 1e+3])
ylabel('E','rot', 0);
title('(c)','FontWeight','normal');
ST = 40;
ET = 60;
m = 0.057/160; alph = 7.08e-9; rm = 1.98;
options=odeset('RelTol',1e-9,'AbsTol',err); 
[T1,X1]=ode45(@CoronaNewModel,[0 tf],Idodof,options); 
AUC1 = trapz(T1, X1(:,4))
Vpeak1 = max(X1(:,4))
Epeak1 = max(X1(:,5))
D1 = (1e+11-min(X1(:,1)))/1e+9
ST = 7;
ET = 60;
[T2,X2]=ode45(@CoronaNewModel,[0 tf],Idodof,options); 
AUC2 = trapz(T2, X2(:,4))
Vpeak2 = max(X2(:,4))
Epeak2 = max(X2(:,5))
D2 = (1e+11-min(X2(:,1)))/1e+9
ST = 6;
ET = 60;
[T3,X3]=ode45(@CoronaNewModel,[0 tf],Idodof,options); 
AUC3 = trapz(T3, X3(:,4))
Vpeak3 = max(X3(:,4))
Epeak3 = max(X3(:,5))
D3 = (1e+11-min(X3(:,1)))/1e+9
ST = 5;
ET = 60;
[T4,X4]=ode45(@CoronaNewModel,[0 tf],Idodof,options); 
AUC4 = trapz(T4, X4(:,4))
Vpeak4 = max(X4(:,4))
Epeak4 = max(X4(:,5))
D4 = (1e+11-min(X4(:,1)))/1e+9
subplot(4,3,4) 
plot(T1,X1(:,1),'color',[1 0 0,1],'LineWidth',4,'LineStyle','-')
hold on
plot(T2,X2(:,1),'color',[1 0 0,0.6],'LineWidth',4,'LineStyle','--')
hold on
plot(T3,X3(:,1),'color',[1 0 0,0.5],'LineWidth',4,'LineStyle',':')
hold on
plot(T4,X4(:,1),'color',[1 0 0,0.4],'LineWidth',4,'LineStyle','-.')
xlim([0 30])
xticks([0 10 20 30])
ylim([8e+10 10e+10])
yticks([8e+10 9e+10 10e+10])
ylabel('T','rot', 0);
title('(d)','FontWeight','normal');
subplot(4,3,5) 
semilogy(T1,X1(:,4),'color',[1 0 0,1],'LineWidth',4,'LineStyle','-')
hold on
semilogy(T2,X2(:,4),'color',[1 0 0,0.6],'LineWidth',4,'LineStyle','--')
hold on
semilogy(T3,X3(:,4),'color',[1 0 0,0.5],'LineWidth',4,'LineStyle',':')
hold on
semilogy(T4,X4(:,4),'color',[1 0 0,0.4],'LineWidth',4,'LineStyle','-.')
hold on
plot([0 30], [68 68],'color',[0 0.7 0,1],'LineWidth',2)
xlim([0 30])
xticks([0 10 20 30])
ylim([1 3e+6])
yticks([1 1e+3 1e+6])
ylabel('V','rot', 0);
title('(e)','FontWeight','normal');
subplot(4,3,6) 
semilogy(T1,X1(:,5),'color',[1 0 0,1],'LineWidth',4,'LineStyle','-')
hold on
semilogy(T2,X2(:,5),'color',[1 0 0,0.6],'LineWidth',4,'LineStyle','--')
hold on
semilogy(T3,X3(:,5),'color',[1 0 0,0.5],'LineWidth',4,'LineStyle',':')
hold on
semilogy(T4,X4(:,5),'color',[1 0 0,0.4],'LineWidth',4,'LineStyle','-.')
xlim([0 30])
xticks([0 10 20 30])
ylim([1 1e+6])
yticks([1 1e+3 1e+6])
ylabel('E','rot', 0);
title('(f)','FontWeight','normal');

ST = 40;
ET = 60;
m = 0.057; alph = 7.08e-9/13; rm = 1.98;
options=odeset('RelTol',1e-9,'AbsTol',err); 
[T1,X1]=ode45(@CoronaNewModel,[0 tf],Idodof,options); 
AUC1 = trapz(T1, X1(:,4))
Vpeak1 = max(X1(:,4))
Epeak1 = max(X1(:,5))
D1 = (1e+11-min(X1(:,1)))/1e+9
ST = 7;
ET = 60;
[T2,X2]=ode45(@CoronaNewModel,[0 tf],Idodof,options); 
AUC2 = trapz(T2, X2(:,4))
Vpeak2 = max(X2(:,4))
Epeak2 = max(X2(:,5))
D2 = (1e+11-min(X2(:,1)))/1e+9
ST = 6;
ET = 60;
[T3,X3]=ode45(@CoronaNewModel,[0 tf],Idodof,options); 
AUC3 = trapz(T3, X3(:,4))
Vpeak3 = max(X3(:,4))
Epeak3 = max(X3(:,5))
D3 = (1e+11-min(X3(:,1)))/1e+9
ST = 5;
ET = 60;
[T4,X4]=ode45(@CoronaNewModel,[0 tf],Idodof,options); 
AUC4 = trapz(T4, X4(:,4))
Vpeak4 = max(X4(:,4))
Epeak4 = max(X4(:,5))
D4 = (1e+11-min(X4(:,1)))/1e+9
subplot(4,3,7) 
plot(T1,X1(:,1),'color',[0 0 1,1],'LineWidth',4,'LineStyle','-')
hold on
plot(T2,X2(:,1),'color',[0 0 1,0.6],'LineWidth',4,'LineStyle','--')
hold on
plot(T3,X3(:,1),'color',[0 0 1,0.5],'LineWidth',4,'LineStyle',':')
hold on
plot(T4,X4(:,1),'color',[0 0 1,0.4],'LineWidth',4,'LineStyle','-.')
xlim([0 30])
xticks([0 10 20 30])
ylim([4e+10 10e+10])
yticks([4e+10 7e+10 10e+10])
ylabel('T','rot', 0);
title('(g)','FontWeight','normal');
subplot(4,3,8) 
semilogy(T1,X1(:,4),'color',[0 0 1,1],'LineWidth',4,'LineStyle','-')
hold on
semilogy(T2,X2(:,4),'color',[0 0 1,0.6],'LineWidth',4,'LineStyle','--')
hold on
semilogy(T3,X3(:,4),'color',[0 0 1,0.5],'LineWidth',4,'LineStyle',':')
hold on
semilogy(T4,X4(:,4),'color',[0 0 1,0.4],'LineWidth',4,'LineStyle','-.')
hold on
plot([0 30], [68 68],'color',[0 0.7 0,1],'LineWidth',2)
xlim([0 30])
xticks([0 10 20 30])
ylim([1 1e+8])
yticks([1 1e+4 1e+8])
ylabel('V','rot', 0);
title('(h)','FontWeight','normal');
subplot(4,3,9) 
semilogy(T1,X1(:,5),'color',[0 0 1,1],'LineWidth',4,'LineStyle','-')
hold on
semilogy(T2,X2(:,5),'color',[0 0 1,0.6],'LineWidth',4,'LineStyle','--')
hold on
semilogy(T3,X3(:,5),'color',[0 0 1,0.5],'LineWidth',4,'LineStyle',':')
hold on
semilogy(T4,X4(:,5),'color',[0 0 1,0.4],'LineWidth',4,'LineStyle','-.')
xlim([0 30])
xticks([0 10 20 30])
ylim([1 1e+3])
yticks([1 1e+3])
ylabel('E','rot', 0);
title('(i)','FontWeight','normal');

ST = 40;
ET = 60;
m = 0.057; alph = 7.08e-9; rm = 1;
options=odeset('RelTol',1e-9,'AbsTol',err); 
[T1,X1]=ode45(@CoronaNewModel,[0 tf],Idodof,options); 
AUC1 = trapz(T1, X1(:,4))
Vpeak1 = max(X1(:,4))
Epeak1 = max(X1(:,5))
D1 = (1e+11-min(X1(:,1)))/1e+9
ST = 7;
ET = 60;
[T2,X2]=ode45(@CoronaNewModel,[0 tf],Idodof,options); 
AUC2 = trapz(T2, X2(:,4))
Vpeak2 = max(X2(:,4))
Epeak2 = max(X2(:,5))
D2 = (1e+11-min(X2(:,1)))/1e+9
ST = 6;
ET = 60;
[T3,X3]=ode45(@CoronaNewModel,[0 tf],Idodof,options); 
AUC3 = trapz(T3, X3(:,4))
Vpeak3 = max(X3(:,4))
Epeak3 = max(X3(:,5))
D3 = (1e+11-min(X3(:,1)))/1e+9
ST = 5;
ET = 60;
[T4,X4]=ode45(@CoronaNewModel,[0 tf],Idodof,options); 
AUC4 = trapz(T4, X4(:,4))
Vpeak4 = max(X4(:,4))
Epeak4 = max(X4(:,5))
D4 = (1e+11-min(X4(:,1)))/1e+9
subplot(4,3,10) 
plot(T1,X1(:,1),'color',[1 0 1,1],'LineWidth',4,'LineStyle','-')
hold on
plot(T2,X2(:,1),'color',[1 0 1,0.6],'LineWidth',4,'LineStyle','--')
hold on
plot(T3,X3(:,1),'color',[1 0 1,0.5],'LineWidth',4,'LineStyle',':')
hold on
plot(T4,X4(:,1),'color',[1 0 1,0.4],'LineWidth',4,'LineStyle','-.')
xlim([0 30])
xticks([0 10 20 30])
ylim([9e+10 10e+10])
yticks([9e+10 10e+10])
ylabel('T','rot', 0);
title('(j)','FontWeight','normal');
subplot(4,3,11) 
semilogy(T1,X1(:,4),'color',[1 0 1,1],'LineWidth',4,'LineStyle','-')
hold on
semilogy(T2,X2(:,4),'color',[1 0 1,0.6],'LineWidth',4,'LineStyle','--')
hold on
semilogy(T3,X3(:,4),'color',[1 0 1,0.5],'LineWidth',4,'LineStyle',':')
hold on
semilogy(T4,X4(:,4),'color',[1 0 1,0.4],'LineWidth',4,'LineStyle','-.')
hold on
plot([0 30], [68 68],'color',[0 0.7 0,1],'LineWidth',2)
xlim([0 30])
xticks([0 10 20 30])
ylim([1 1e+6])
yticks([1 1e+3 1e+6])
ylabel('V','rot', 0);
title('(k)','FontWeight','normal');
subplot(4,3,12) 
semilogy(T1,X1(:,5),'color',[1 0 1,1],'LineWidth',4,'LineStyle','-')
hold on
semilogy(T2,X2(:,5),'color',[1 0 1,0.6],'LineWidth',4,'LineStyle','--')
hold on
semilogy(T3,X3(:,5),'color',[1 0 1,0.5],'LineWidth',4,'LineStyle',':')
hold on
semilogy(T4,X4(:,5),'color',[1 0 1,0.4],'LineWidth',4,'LineStyle','-.')
xlim([0 30])
xticks([0 10 20 30])
ylim([1 1e+3])
yticks([1 1e+3])
ylabel('E','rot', 0);
title('(l)','FontWeight','normal');
set(figure(1),'Renderer','painters')
