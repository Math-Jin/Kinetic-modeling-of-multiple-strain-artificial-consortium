function y = simple_fit(x)

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
N(1)=x(15);
N(2)=x(16);

options = odeset('RelTol',1e-8,'AbsTol',[ 1e-8 1e-8 1e-8 1e-8 ]);
t0=[0.2,10,10^-6,40];
[T,X]=ode45('ode_1',[0:4],t0,options);

options = odeset('RelTol',1e-8,'AbsTol',[1e-4 1e-4 1e-4 1e-4 1e-4 1e-4  ]);
t1=[0.4,X(end,1),X(end,2),X(end,4),X(end,3),0];
[T,Y]=ode45('ode_2',[0:12:120],t1,options);

L(1:8)=Y([2 3 5 7 8 9 10 11],6);
Index = [ 0.2 , 0.2 ; 0.2, 0.6; 0.2,1.0;0.4, 0.2;0.3, 0.2];
for idx = 1 : 5
t0=[Index(idx,1),10,10^-6,40];
options = odeset('RelTol',1e-8,'AbsTol',[ 1e-8 1e-8 1e-8 1e-8 ]);
[T,X]=ode45('ode_1',[0:4],t0,options);
options = odeset('RelTol',1e-8,'AbsTol',[1e-4 1e-4 1e-4 1e-4 1e-4 1e-4  ]);
t1=[Index(idx,2),X(end,1),X(end,2),X(end,4),X(end,3),0];
[T,Y0]=ode45('ode_2',[0:24:72],t1,options);
L(idx+8)=Y0(4,6);
end


z=[ 15.5995085	96.2023865 1199.893789	1536.538501	1536 1536 1536.884596	1522.661839 ];
z=[z , 1318.385242	1479.908971	1294.534129	1225.371031	835.3308485];
y=norm(L-z,2)/norm(z,2);

end