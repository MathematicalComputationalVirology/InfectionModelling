global ST1 m alph rm
tf=30;
T0 = 1e+11;
Idodof=[T0 0 0 0.1 0 0 2.6e+11]; 
err = zeros(1,7);
for i = 1:7
    err(i) = 1e-9;
end
ST1 = 40;
m = 0.057; alph = 7.08e-9; rm = 1.98;
options=odeset('RelTol',1e-9,'AbsTol',err); 
[T1,X1]=ode45(@CPTreatment,[0 tf],Idodof,options); 
ST1 = 7;
[T2,X2]=ode45(@CPTreatment,[0 tf],Idodof,options); 
ST1 = 6;
[T3,X3]=ode45(@CPTreatment,[0 tf],Idodof,options); 
ST1 = 5;
[T4,X4]=ode45(@CPTreatment,[0 tf],Idodof,options); 
AUC1 = trapz(T1, X1(:,4))
AUC2 = trapz(T2, X2(:,4))
AUC3 = trapz(T3, X3(:,4))
AUC4 = trapz(T4, X4(:,4))
% set(gcf, 'Position',  [100, 100, 1200, 250])
figure(1)
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

ST1 = 40;
options=odeset('RelTol',1e-9,'AbsTol',err); 
[T1,X1]=ode45(@CPRemTreatment,[0 tf],Idodof,options); 
ST1 = 7;
[T2,X2]=ode45(@CPRemTreatment,[0 tf],Idodof,options); 
ST1 = 6;
[T3,X3]=ode45(@CPRemTreatment,[0 tf],Idodof,options); 
ST1 = 5;
[T4,X4]=ode45(@CPRemTreatment,[0 tf],Idodof,options);

subplot(4,3,3) 
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
title('(c)','FontWeight','normal');
ST1 = 40;
m = 0.057/160; alph = 7.08e-9; rm = 1.98;
options=odeset('RelTol',1e-9,'AbsTol',err); 
[T1,X1]=ode45(@CPTreatment,[0 tf],Idodof,options); 
ST1 = 7;
[T2,X2]=ode45(@CPTreatment,[0 tf],Idodof,options); 
ST1 = 6;
[T3,X3]=ode45(@CPTreatment,[0 tf],Idodof,options); 
ST1 = 5;
[T4,X4]=ode45(@CPTreatment,[0 tf],Idodof,options); 

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

ST1 = 40;
options=odeset('RelTol',1e-9,'AbsTol',err); 
[T1,X1]=ode45(@CPRemTreatment,[0 tf],Idodof,options); 
ST1 = 7;
[T2,X2]=ode45(@CPRemTreatment,[0 tf],Idodof,options); 
ST1 = 6;
[T3,X3]=ode45(@CPRemTreatment,[0 tf],Idodof,options); 
ST1 = 5;
[T4,X4]=ode45(@CPRemTreatment,[0 tf],Idodof,options);

subplot(4,3,6) 
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
title('(f)','FontWeight','normal');

ST1 = 40;
m = 0.057; alph = 7.08e-9/13; rm = 1.98;
options=odeset('RelTol',1e-9,'AbsTol',err); 
[T1,X1]=ode45(@CPTreatment,[0 tf],Idodof,options); 
ST1 = 7;
[T2,X2]=ode45(@CPTreatment,[0 tf],Idodof,options); 
ST1 = 6;
[T3,X3]=ode45(@CPTreatment,[0 tf],Idodof,options); 
ST1 = 5;
[T4,X4]=ode45(@CPTreatment,[0 tf],Idodof,options); 

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

ST1 = 40;
options=odeset('RelTol',1e-9,'AbsTol',err); 
[T1,X1]=ode45(@CPRemTreatment,[0 tf],Idodof,options); 
ST1 = 7;
[T2,X2]=ode45(@CPRemTreatment,[0 tf],Idodof,options); 
ST1 = 6;
[T3,X3]=ode45(@CPRemTreatment,[0 tf],Idodof,options); 
ST1 = 5;
[T4,X4]=ode45(@CPRemTreatment,[0 tf],Idodof,options);

subplot(4,3,9) 
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
title('(i)','FontWeight','normal');

ST1 = 40;
tf = 40;
m = 0.057; alph = 7.08e-9; rm = 1;
options=odeset('RelTol',1e-9,'AbsTol',err); 
[T1,X1]=ode45(@CPTreatment,[0 tf],Idodof,options); 
ST1 = 7;
[T2,X2]=ode45(@CPTreatment,[0 tf],Idodof,options); 
ST1 = 6;
[T3,X3]=ode45(@CPTreatment,[0 tf],Idodof,options); 
ST1 = 5;
[T4,X4]=ode45(@CPTreatment,[0 tf],Idodof,options); 

subplot(4,3,10) 
plot(T1,X1(:,1),'color',[1 0 1,1],'LineWidth',4,'LineStyle','-')
hold on
plot(T2,X2(:,1),'color',[1 0 1,0.6],'LineWidth',4,'LineStyle','--')
hold on
plot(T3,X3(:,1),'color',[1 0 1,0.5],'LineWidth',4,'LineStyle',':')
hold on
plot(T4,X4(:,1),'color',[1 0 1,0.4],'LineWidth',4,'LineStyle','-.')
xlim([0 40])
xticks([0 10 20 30 40])
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
plot([0 40], [68 68],'color',[0 0.7 0,1],'LineWidth',2)
xlim([0 40])
xticks([0 10 20 30 40])
ylim([1 1e+6])
yticks([1 1e+3 1e+6])
ylabel('V','rot', 0);
title('(k)','FontWeight','normal');

ST1 = 40;
options=odeset('RelTol',1e-9,'AbsTol',err); 
[T1,X1]=ode45(@CPRemTreatment,[0 tf],Idodof,options); 
ST1 = 7;
[T2,X2]=ode45(@CPRemTreatment,[0 tf],Idodof,options); 
ST1 = 6;
[T3,X3]=ode45(@CPRemTreatment,[0 tf],Idodof,options); 
ST1 = 5;
[T4,X4]=ode45(@CPRemTreatment,[0 tf],Idodof,options);

subplot(4,3,12) 
semilogy(T1,X1(:,4),'color',[1 0 1,1],'LineWidth',4,'LineStyle','-')
hold on
semilogy(T2,X2(:,4),'color',[1 0 1,0.6],'LineWidth',4,'LineStyle','--')
hold on
semilogy(T3,X3(:,4),'color',[1 0 1,0.5],'LineWidth',4,'LineStyle',':')
hold on
semilogy(T4,X4(:,4),'color',[1 0 1,0.4],'LineWidth',4,'LineStyle','-.')
hold on
plot([0 40], [68 68],'color',[0 0.7 0,1],'LineWidth',2)
xlim([0 40])
xticks([0 10 20 30 40])
ylim([1 1e+6])
yticks([1 1e+3 1e+6])
ylabel('V','rot', 0);
title('(l)','FontWeight','normal');
set(figure(1),'Renderer','painters')
