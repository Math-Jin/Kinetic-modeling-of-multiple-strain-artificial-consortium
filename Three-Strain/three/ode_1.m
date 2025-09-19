function dy=ode_1(t,y)

global sigma  r N
sigma1=sigma(1);
sigma2=sigma(2);
sigma3=sigma(3);
sigma4=sigma(4);
sigma5=sigma(5);
sigma6=sigma(6);
sigma7=sigma(7);
sigma8=sigma(8);
sigma9=sigma(9);
sigma10=sigma(10);
r1=r(1);N1=N(1);
r2=r(2);N2=N(2);r3=r(3);r4=r(4);

dy=zeros(4,1);
dy(1) = (r3*y(2)+r4*y(3)).*y(1).*(1-y(1)/N2);
dy(2) = y(2)*(-sigma4*y(1)/N2);
dy(3) = y(3)*(-sigma6*y(1)/N2);
dy(3) = sigma7*y(1)/N2;
end


