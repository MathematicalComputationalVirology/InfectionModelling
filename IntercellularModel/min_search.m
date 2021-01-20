
%initial guesses for parameters
% param0 = [bet delt a1 m p3 k c alph pm rm];

param0 = [2.07e-7 0.248 0.9 0.047 2.18e-3 2.37e-10 1.24 1.72e-8 1.33e-5 1.98];
%minimization algorithm
param=fminsearch(@ssq_paper,param0,[]);

hold on

function ssq = ssq_paper(param)
global bet delt a1 m p3 k c alph pm rm rT Tm de lam Mm da eps eta
 
%parameters
bet = param(1);
delt = param(2);
a1 = param(3);
m = param(4);
p3 = param(5);
k = param(6);
c = param(7);
alph = param(8);
pm = param(9);
rm = param(10);
rT = 0.1;
Tm = 1e+11;
de = 0.5;
lam = 1;
Mm = 4e+12;
da = 0.033;
eps = 0;
eta = 1;
 
 
%patient 1's data
%time in days
xdata = [2, 8, 10, 12, 13, 14, 15, 16]+4;
%virus DNA per ml
ydata = [18007, 506, 3253, 68, 68, 1332, 68, 68];
%initial conditions
y0=[1e+11 0 0 0.1 0 0]; 
%ODE solver
err = zeros(1,6);
for i = 1:6
    err(i) = 1e-10;
end
options=odeset('RelTol',1e-10,'AbsTol',err); 
[t, y] = ode45(@Abone_de,[0 30],y0,options);
%variable to be fitted
% V0=y(:,4);
V0 = [0, 0, 0, 0, 0, 0, 0, 0];
%residual sum of squares

for i = 1:length(xdata)
     for j = 1:length(t)
        if ( t(j) >= xdata(i) )
           V0(i) = y(j,4);
           break
        end
     end
end

ssq = norm(log(ydata)-log(V0));

end

function dx = Abone_de(t,x)
dx = zeros(6,1);
global bet delt a1 m p3 k c alph pm rm rT Tm de lam Mm da eps eta

rT = 0.1;
Tm = 1e+11;
de = 0.5;
lam = 1;
Mm = 4e+12;
da = 0.033;
eps = 0;
eta = 1;

p1 = p3/100;
dx(1) = rT * x(1) * (1 - ((x(1)+x(2)+x(3)) / Tm)) - bet * x(1) * x(4);
dx(2) = bet * x(1) * x(4) - delt * x(2) - a1 * (1 - eps) * x(2) - m * x(2) * x(5);
dx(3) = a1 * (1 - eps) * x(2) - delt * x(3) - m * x(3) * x(5);
dx(4) = p1 * eps * x(2) + p3 * eta * x(3) - c * x(4) - k * x(6) * x(4);
dx(5) = lam + alph * x(2) * x(5) + alph * x(3) * x(5) - de * x(5);
dx(6) = pm * x(4) + rm * x(6) * (1 - x(6)/Mm) - k * x(6) * x(4) - da * x(6);
end  