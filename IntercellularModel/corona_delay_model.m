function v = corona_delay_model(t,y,Z)
global ST ET m alph rm
ylag1 = Z(:,1);
v = zeros(6,1);

rT = 0.1;
Tm = 1e+11;
de = 0.5;
lam = 1;
Mm = 4e+12;
da = 0.033;
bet = 11.4e-8; delt = 0.239; a1 = 0.9; p3 = 5.89e-3; k = 3.15e-10; c = 1.46; pm = 3.77e-5;

p1 = p3/100;

if (ST < t && t < ET)
    eps = 1;
    eta = 0.1;
else
    eps = 0;
    eta = 1;
end
v(1) = rT * y(1) * (1 - ((y(1)+y(2)+y(3)) / Tm)) - bet * y(1) * y(4);
v(2) = bet * y(1) * y(4) - delt * y(2) - a1 * (1 - eps) * y(2) - m * y(2) * y(5);
v(3) = a1 * (1 - eps) * y(2) - delt * y(3) - m * y(3) * y(5);
v(4) = p1 * eps * ylag1(2) + p3 * eta * y(3) - c * y(4) - k * y(6) * y(4);
v(5) = lam + alph * y(2) * y(5) + alph * y(3) * y(5) - de * y(5);
v(6) = pm * y(4) + rm * y(6) * (1 - y(6)/Mm) - k * y(6) * y(4) - da * y(6);