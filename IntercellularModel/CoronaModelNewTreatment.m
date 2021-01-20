function dx = CoronaModelNewTreatment(t,x)
dx = zeros(6,1);
global bet delt a1 m p3 k c alph pm rm ST ET

rT = 0.1;
Tm = 1e+11;
de = 0.5;
lam = 1;
Mm = 4e+12;
da = 0.033;

p1 = p3/100;
% kk = 0.8*k;

%%%% Treatment %%%%
if (ST < t && t < ET)
    eps = 1;
    eta = 0.1;
else
    eps = 0;
    eta = 1;
end
dx(1) = rT * x(1) * (1 - ((x(1)+x(2)+x(3)) / Tm)) - bet * x(1) * x(4);
dx(2) = bet * x(1) * x(4) - delt * x(2) - a1 * (1 - eps) * x(2) - m * x(2) * x(5);
dx(3) = a1 * (1 - eps) * x(2) - delt * x(3) - m * x(3) * x(5);
dx(4) = p1 * eps * x(2) + p3 * eta * x(3) - c * x(4) - k * x(6) * x(4);
dx(5) = lam + alph * x(2) * x(5) + alph * x(3) * x(5) - de * x(5);
dx(6) = pm * x(4) + rm * x(6) * (1 - x(6)/Mm) - k * x(6) * x(4) - da * x(6);
% dx(7) = heaviside(t - ST) * (-kk * x(4) * x(7) - da * x(7));
end