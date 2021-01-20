global ST m alph rm rT Tm de lam Mm da bet delt a1 p3 k c pm ef tf T0
% fid = fopen('mAb_red_50.dat','w');
rT = 0.1;
Tm = 1e+11;
de = 0.5;
lam = 1;
Mm = 4e+12;
da = 0.033;
bet = 11.4e-8; delt = 0.239; a1 = 0.9; p3 = 5.89e-3; k = 3.15e-10; c = 1.46; pm = 3.77e-5;
m = 0.057;
alph = 7.08e-9;
rm = 1;%1.98;
% m = 0.057;
% alph = 7.08e-9;
% rm = 1.98;
tf=45;
T0 = 1e+11;
Idodof=[T0 0 0 0.1 0 0 0]; 
err = zeros(1,7);
for i = 1:7
    err(i) = 1e-9;
end
ef = 0;
ST = 100;
options=odeset('RelTol',1e-9,'AbsTol',err); 
[T,X]=ode45(@CPequation,[0 tf],Idodof,options); 
AUC0 = trapz(T, X(:,4));
nn = 12; %3;
mm = 5; %5;
AUC = zeros(nn,mm);
% TD = zeros(nn,mm);
tim = linspace(4,17,nn);
ee = linspace(0.1,0.9,mm);
Ab = [0.5 0.7 0.9 1 5 10 50 100 500 1000];
for i = 1:nn
    i
    ST = tim(i);
    for j = 1:mm
        ef = ee(j);
        for ii = 1:length(Ab)
            mAb = Ab(ii)*(10^10);
            Idodof1=[T0 0 0 0.1 0 0 mAb];
            [T,X]=ode45(@CPequation,[0 tf],Idodof1,options); 
            AUC1 = trapz(T, X(:,4));
            if ((1 - AUC1/AUC0) >= 0.5)
                AUC(i,j) = log10(mAb);
%                 TD(i,j) = round((1e+11-min(X(:,1)))/1e+9,1);
%                 fprintf(fid,'%g %g %g %g \n',ST,ef,AUC(i,j),TD(i,j));
                break
            else
                AUC(i,j) = NaN;
%                 TD(i,j) = NaN;
            end
        end
    end
%     fprintf(fid,'\n');
end
% fclose(fid);
figure(2)
% subplot(1,2,1)
surf(tim,ee,AUC.','EdgeColor', 'none')
xlabel('ST')
ylabel('ef')
% subplot(1,2,2)
% surf(tim,ee,TD.','EdgeColor', 'none')
% xlabel('ST')
% ylabel('ef')
    