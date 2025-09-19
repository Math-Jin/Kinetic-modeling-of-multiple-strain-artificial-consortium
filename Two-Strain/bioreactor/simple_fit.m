function y = simple_fit(x)
% 优化目标 ： 丰原素动力学曲线

global sigma  r N
sigma(1)=x(1);
sigma(2)=x(2);
sigma(3)=x(3);
sigma(4)=x(4);
sigma(5)=x(5);
sigma(6)=x(6);
sigma(7)=x(7);
sigma(8)=x(8);
sigma(9)=x(9);
sigma(10)=x(10);
r(1)=x(11);
r(2)=x(12);
r(3)=x(13);
r(4)=x(14);
N(1)=x(15);N(2)=x(16);

L = zeros(1,15);
options = odeset('RelTol',1e-8,'AbsTol',[ 1e-8 1e-8 1e-8 1e-8 ]);
t0=[0.2,10,10^-6,40];
[T,X]=ode45('ode_1',[0:4],t0,options);



Add_C = [35 105]./3;
options = odeset('RelTol',1e-8,'AbsTol',[1e-4 1e-4 1e-4 1e-4 1e-4 1e-4  ]);
t1=[0.4,X(end,1),X(end,2),X(end,4),X(end,3),0];
[T,Y]=ode45('ode_2',[0,24,32],t1,options);
L(1:2) = Y(2:3,6);

options = odeset('RelTol',1e-8,'AbsTol',[1e-4 1e-4 1e-4 1e-4 1e-4 1e-4  ]);
t1=Y(end,:);
t1(3:4) = (t1(3:4).*3.5 + Add_C)./(3.5+0.5/3);
[T,Y]=ode45('ode_2',[32,40,48,56],t1,options);
L(3:5)=Y(2:4,6);

options = odeset('RelTol',1e-8,'AbsTol',[1e-4 1e-4 1e-4 1e-4 1e-4 1e-4  ]);
t1=Y(end,:);
t1(3:4) = (t1(3:4).*(3.5+0.5/3) + Add_C)./(3.5+0.5/3*2);
[T,Y]=ode45('ode_2',[56,64,72],t1,options);
L(6:7)=Y(2:3,6);


options = odeset('RelTol',1e-8,'AbsTol',[1e-4 1e-4 1e-4 1e-4 1e-4 1e-4  ]);
t1=Y(end,:);
t1(3:4) = (t1(3:4).*(3.5+0.5/3*2) + Add_C)./(3.5+0.5);
[T,Y]=ode45('ode_2',[72,80,88,96,112,120,128,136,144],t1,options);
L(8:15)=Y(2:9,6);



z = [60.176452	123.45394	167.658772	341.892724	871.897256	1317.799304	1626.952904	1781.24372	2091.794696	2332.055816	2258.991656	2227.006664	2247.228008	2181.351176	2212.6346];
y=norm(L-z,inf)/norm(z,inf);
end