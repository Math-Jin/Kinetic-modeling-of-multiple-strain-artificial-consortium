function dy = ode_1(t,y)

global sigma r N
sigma1=sigma(1);sigma2=sigma(2);sigma3=sigma(3);sigma4=sigma(4);
sigma5=sigma(5);sigma6=sigma(6);sigma7=sigma(7);sigma8=sigma(8);
r1 = r(1);r2 = r(2);
N1=N(1);N2=N(2);

dy = zeros(5,1);
dy(1) = (r1*y(3))*y(1)*(1-y(1)/N(1)-sigma1*y(2)/N2);
dy(2) = (r2*y(3))*y(2)*(1-y(2)/N(2)-sigma2*y(1)/N1);
dy(3) = -y(3)*(sigma3*y(1)+sigma4*y(2));
dy(4) = sigma5*y(2)-sigma6*y(1)*y(4);
dy(5) = sigma7*y(1)*(1+sigma8*y(4))*y(3);
end
