function dy=ode_2(t,y)


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
sigma11=sigma(11);
r1=r(1);N1=N(1);
r2=r(2);N2=N(2);

dy=zeros(5,1);
dy(1) = r1.*y(1).*(1-y(1)/N1-sigma1*y(2)/N2);
dy(2) = r2.*y(2).*(1-y(2)/N2-sigma2*y(1)/N1);
dy(3) = -sigma3*dy(1)-sigma4*dy(2)-sigma5*dy(5);
dy(4) = sigma6*dy(2)+sigma7*y(2)-sigma8*dy(5);
dy(5) = (sigma9*dy(1)+sigma10*y(1)).*(1+sigma11*y(4));
end


