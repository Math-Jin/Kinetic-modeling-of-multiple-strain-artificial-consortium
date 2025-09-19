function dy=ode_2(t,y)

%  �����ϵ  �ڶ��ν��� 120h
% Sigma is the parameters of the equation
% r N m  is the parameters of the Bacterial population
% k : decay function 
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

    dy=zeros(6,1);
    dy(1) = (r1*y(3)+r2*y(4)).*y(1).*(1-y(1)/N1-sigma1*y(2)/N2);
    dy(2) = (r3*y(3)+r4*y(4)).*y(2).*(1-y(2)/N2-sigma2*y(1)/N1);
    dy(3) = y(3)*(-sigma3*y(1)/N1-sigma4*y(2)/N2);
    dy(4) = -sigma5*y(4)*y(1)/N1-sigma10*y(4)*y(2)/N2;
    dy(5) = sigma6*y(2)/N2-sigma7*(y(5))*y(1)/N1;
    dy(6) = y(1)/N1*sigma8*(1+sigma9*y(5))*(y(3)+y(4));
     
end


