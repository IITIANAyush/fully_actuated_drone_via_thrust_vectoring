function [F, M] = forces_moments(x, P)

Omega = x(13:16);
eta   = x(17:20);
gamma = x(21:24);

F = zeros(3,1);
M = zeros(3,1);

for i = 1:4
    T = P.rho*pi*P.R^2*(Omega(i)*P.R)^2 * P.CT;

    ez = [sin(gamma(i));
         -sin(eta(i))*cos(gamma(i));
          cos(eta(i))*cos(gamma(i))];

    Fi = T * ez;
    ri = P.L * arm_direction(i);

    Mi = cross(ri, Fi);

    tau_drag = P.CQ * P.rho * pi * P.R^2 * (Omega(i)*P.R)^2 * P.R;
    Mi = Mi + P.spin_dir(i) * tau_drag * ez;

    F = F + Fi;
    M = M + Mi;
end
end
