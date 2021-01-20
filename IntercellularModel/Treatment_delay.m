global ST ET m alph rm
tf=30;
T0 = 1e+11;
Idodof=[T0 0 0 0.1 0 0]; 
err = zeros(1,6);
for i = 1:6
    err(i) = 1e-9;
end
taus = [2];
ST = 40;
ET = 60;
m = 0.057; alph = 7.08e-9; rm = 1.98;
opts=ddeset('RelTol',1e-9,'AbsTol',err); 
sol1 = dde23(@corona_delay_model,taus,Idodof,[0 tf],opts); 
ST = 7;
ET = 60;
sol2 = dde23(@corona_delay_model,taus,Idodof,[0 tf],opts);
ST = 6;
ET = 60;
sol3 = dde23(@corona_delay_model,taus,Idodof,[0 tf],opts);
ST = 5;
ET = 60;
sol4 = dde23(@corona_delay_model,taus,Idodof,[0 tf],opts);
figure(1)
% set(gcf, 'Position',  [100, 100, 1200, 250])
set(gcf, 'Position',  [100, 100, 1200, 800])
set(0,'DefaultAxesFontSize',18)
subplot(4,3,1) 
plot(sol1.x, sol1.y(1,:),'color',[0 0 0,1],'LineWidth',4,'LineStyle','-')
hold on
plot(sol2.x, sol2.y(1,:),'color',[0 0 0,0.6],'LineWidth',4,'LineStyle','--')
hold on
plot(sol3.x, sol3.y(1,:),'color',[0 0 0,0.5],'LineWidth',4,'LineStyle',':')
hold on
plot(sol4.x, sol4.y(1,:),'color',[0 0 0,0.4],'LineWidth',4,'LineStyle','-.')
xlim([0 30])
xticks([0 10 20 30])
ylim([9e+10 10e+10])
yticks([9e+10 10e+10])
ylabel('T','rot', 0);
title('(a)','FontWeight','normal');
subplot(4,3,2) 
semilogy(sol1.x, sol1.y(4,:),'color',[0 0 0,1],'LineWidth',4,'LineStyle','-')
hold on
semilogy(sol2.x, sol2.y(4,:),'color',[0 0 0,0.6],'LineWidth',4,'LineStyle','--')
hold on
semilogy(sol3.x, sol3.y(4,:),'color',[0 0 0,0.5],'LineWidth',4,'LineStyle',':')
hold on
semilogy(sol4.x, sol4.y(4,:),'color',[0 0 0,0.4],'LineWidth',4,'LineStyle','-.')
hold on
plot([0 30], [68 68],'color',[0 0.7 0,1],'LineWidth',2)
xlim([0 30])
xticks([0 10 20 30])
ylim([1 1e+6])
yticks([1 1e+3 1e+6])
ylabel('V','rot', 0);
title('(b)','FontWeight','normal');
subplot(4,3,3) 
semilogy(sol1.x, sol1.y(5,:),'color',[0 0 0,1],'LineWidth',4,'LineStyle','-')
hold on
semilogy(sol2.x, sol2.y(5,:),'color',[0 0 0,0.6],'LineWidth',4,'LineStyle','--')
hold on
semilogy(sol3.x, sol3.y(5,:),'color',[0 0 0,0.5],'LineWidth',4,'LineStyle',':')
hold on
semilogy(sol4.x, sol4.y(5,:),'color',[0 0 0,0.4],'LineWidth',4,'LineStyle','-.')
xlim([0 30])
xticks([0 10 20 30])
ylim([1 1e+3])
yticks([1 1e+3])
ylabel('E','rot', 0);
title('(c)','FontWeight','normal');
ST = 40;
ET = 60;
m = 0.057/160; alph = 7.08e-9; rm = 1.98;
sol1 = dde23(@corona_delay_model,taus,Idodof,[0 tf],opts); 
ST = 7;
ET = 60;
sol2 = dde23(@corona_delay_model,taus,Idodof,[0 tf],opts);
ST = 6;
ET = 60;
sol3 = dde23(@corona_delay_model,taus,Idodof,[0 tf],opts);
ST = 5;
ET = 60;
sol4 = dde23(@corona_delay_model,taus,Idodof,[0 tf],opts);
subplot(4,3,4) 
plot(sol1.x, sol1.y(1,:),'color',[1 0 0,1],'LineWidth',4,'LineStyle','-')
hold on
plot(sol2.x, sol2.y(1,:),'color',[1 0 0,0.6],'LineWidth',4,'LineStyle','--')
hold on
plot(sol3.x, sol3.y(1,:),'color',[1 0 0,0.5],'LineWidth',4,'LineStyle',':')
hold on
plot(sol4.x, sol4.y(1,:),'color',[1 0 0,0.4],'LineWidth',4,'LineStyle','-.')
xlim([0 30])
xticks([0 10 20 30])
ylim([8e+10 10e+10])
yticks([8e+10 9e+10 10e+10])
ylabel('T','rot', 0);
title('(d)','FontWeight','normal');
subplot(4,3,5) 
semilogy(sol1.x, sol1.y(4,:),'color',[1 0 0,1],'LineWidth',4,'LineStyle','-')
hold on
semilogy(sol2.x, sol2.y(4,:),'color',[1 0 0,0.6],'LineWidth',4,'LineStyle','--')
hold on
semilogy(sol3.x, sol3.y(4,:),'color',[1 0 0,0.5],'LineWidth',4,'LineStyle',':')
hold on
semilogy(sol4.x, sol4.y(4,:),'color',[1 0 0,0.4],'LineWidth',4,'LineStyle','-.')
hold on
plot([0 30], [68 68],'color',[0 0.7 0,1],'LineWidth',2)
xlim([0 30])
xticks([0 10 20 30])
ylim([1 3e+6])
yticks([1 1e+3 1e+6])
ylabel('V','rot', 0);
title('(e)','FontWeight','normal');
subplot(4,3,6) 
semilogy(sol1.x, sol1.y(5,:),'color',[1 0 0,1],'LineWidth',4,'LineStyle','-')
hold on
semilogy(sol2.x, sol2.y(5,:),'color',[1 0 0,0.6],'LineWidth',4,'LineStyle','--')
hold on
semilogy(sol3.x, sol3.y(5,:),'color',[1 0 0,0.5],'LineWidth',4,'LineStyle',':')
hold on
semilogy(sol4.x, sol4.y(5,:),'color',[1 0 0,0.4],'LineWidth',4,'LineStyle','-.')
xlim([0 30])
xticks([0 10 20 30])
ylim([1 1e+6])
yticks([1 1e+3 1e+6])
ylabel('E','rot', 0);
title('(f)','FontWeight','normal');

ST = 40;
ET = 60;
m = 0.057; alph = 7.08e-9/13; rm = 1.98;
sol1 = dde23(@corona_delay_model,taus,Idodof,[0 tf],opts); 
ST = 7;
ET = 60;
sol2 = dde23(@corona_delay_model,taus,Idodof,[0 tf],opts);
ST = 6;
ET = 60;
sol3 = dde23(@corona_delay_model,taus,Idodof,[0 tf],opts);
ST = 5;
ET = 60;
sol4 = dde23(@corona_delay_model,taus,Idodof,[0 tf],opts);
subplot(4,3,7) 
plot(sol1.x, sol1.y(1,:),'color',[0 0 1,1],'LineWidth',4,'LineStyle','-')
hold on
plot(sol2.x, sol2.y(1,:),'color',[0 0 1,0.6],'LineWidth',4,'LineStyle','--')
hold on
plot(sol3.x, sol3.y(1,:),'color',[0 0 1,0.5],'LineWidth',4,'LineStyle',':')
hold on
plot(sol4.x, sol4.y(1,:),'color',[0 0 1,0.4],'LineWidth',4,'LineStyle','-.')
xlim([0 30])
xticks([0 10 20 30])
ylim([4e+10 10e+10])
yticks([4e+10 7e+10 10e+10])
ylabel('T','rot', 0);
title('(g)','FontWeight','normal');
subplot(4,3,8) 
semilogy(sol1.x, sol1.y(4,:),'color',[0 0 1,1],'LineWidth',4,'LineStyle','-')
hold on
semilogy(sol2.x, sol2.y(4,:),'color',[0 0 1,0.6],'LineWidth',4,'LineStyle','--')
hold on
semilogy(sol3.x, sol3.y(4,:),'color',[0 0 1,0.5],'LineWidth',4,'LineStyle',':')
hold on
semilogy(sol4.x, sol4.y(4,:),'color',[0 0 1,0.4],'LineWidth',4,'LineStyle','-.')
hold on
plot([0 30], [68 68],'color',[0 0.7 0,1],'LineWidth',2)
xlim([0 30])
xticks([0 10 20 30])
ylim([1 1e+8])
yticks([1 1e+4 1e+8])
ylabel('V','rot', 0);
title('(h)','FontWeight','normal');
subplot(4,3,9) 
semilogy(sol1.x, sol1.y(5,:),'color',[0 0 1,1],'LineWidth',4,'LineStyle','-')
hold on
semilogy(sol2.x, sol2.y(5,:),'color',[0 0 1,0.6],'LineWidth',4,'LineStyle','--')
hold on
semilogy(sol3.x, sol3.y(5,:),'color',[0 0 1,0.5],'LineWidth',4,'LineStyle',':')
hold on
semilogy(sol4.x, sol4.y(5,:),'color',[0 0 1,0.4],'LineWidth',4,'LineStyle','-.')
xlim([0 30])
xticks([0 10 20 30])
ylim([1 1e+3])
yticks([1 1e+3])
ylabel('E','rot', 0);
title('(i)','FontWeight','normal');

ST = 40;
ET = 60;
m = 0.057; alph = 7.08e-9; rm = 1;
sol1 = dde23(@corona_delay_model,taus,Idodof,[0 tf],opts); 
ST = 7;
ET = 60;
sol2 = dde23(@corona_delay_model,taus,Idodof,[0 tf],opts);
ST = 6;
ET = 60;
sol3 = dde23(@corona_delay_model,taus,Idodof,[0 tf],opts);
ST = 5.2;
ET = 60;
sol4 = dde23(@corona_delay_model,taus,Idodof,[0 tf],opts);
subplot(4,3,10) 
plot(sol1.x, sol1.y(1,:),'color',[1 0 1,1],'LineWidth',4,'LineStyle','-')
hold on
plot(sol2.x, sol2.y(1,:),'color',[1 0 1,0.6],'LineWidth',4,'LineStyle','--')
hold on
plot(sol3.x, sol3.y(1,:),'color',[1 0 1,0.5],'LineWidth',4,'LineStyle',':')
hold on
plot(sol4.x, sol4.y(1,:),'color',[1 0 1,0.4],'LineWidth',4,'LineStyle','-.')
xlim([0 30])
xticks([0 10 20 30])
ylim([9e+10 10e+10])
yticks([9e+10 10e+10])
ylabel('T','rot', 0);
title('(i)','FontWeight','normal');
subplot(4,3,11) 
semilogy(sol1.x, sol1.y(4,:),'color',[1 0 1,1],'LineWidth',4,'LineStyle','-')
hold on
semilogy(sol2.x, sol2.y(4,:),'color',[1 0 1,0.6],'LineWidth',4,'LineStyle','--')
hold on
semilogy(sol3.x, sol3.y(4,:),'color',[1 0 1,0.5],'LineWidth',4,'LineStyle',':')
hold on
semilogy(sol4.x, sol4.y(4,:),'color',[1 0 1,0.4],'LineWidth',4,'LineStyle','-.')
hold on
plot([0 30], [68 68],'color',[0 0.7 0,1],'LineWidth',2)
xlim([0 30])
xticks([0 10 20 30])
ylim([1 1e+6])
yticks([1 1e+3 1e+6])
ylabel('V','rot', 0);
title('(j)','FontWeight','normal');
subplot(4,3,12) 
semilogy(sol1.x, sol1.y(5,:),'color',[1 0 1,1],'LineWidth',4,'LineStyle','-')
hold on
semilogy(sol2.x, sol2.y(5,:),'color',[1 0 1,0.6],'LineWidth',4,'LineStyle','--')
hold on
semilogy(sol3.x, sol3.y(5,:),'color',[1 0 1,0.5],'LineWidth',4,'LineStyle',':')
hold on
semilogy(sol4.x, sol4.y(5,:),'color',[1 0 1,0.4],'LineWidth',4,'LineStyle','-.')
xlim([0 30])
xticks([0 10 20 30])
ylim([1 1e+3])
yticks([1 1e+3])
ylabel('E','rot', 0);
title('(k)','FontWeight','normal');
set(figure(1),'Renderer','painters')
