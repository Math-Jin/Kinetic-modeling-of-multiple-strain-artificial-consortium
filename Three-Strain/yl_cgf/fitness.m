function y = fitness(x)
global sigma r N 

sigma(1:8) = x(1:8);
r(1:2) = x(9:10); N(1:2) = x(11:12);

L = zeros(1,14);
k = 1; 
T1 = 72;
options = odeset('RelTol',1e-8,'AbsTol',[ 1e-4 1e-4 1e-4 1e-4 1e-4 ]);
t0=[0.2,0,50,10^-6,0];
[T,X]=ode45('ode_1',[0:T1],t0,options);
L(k) = X(end,end); k = k+1;
t0=[0.2,0.2,50,10^-6,0];
[T,X]=ode45('ode_1',[0:T1],t0,options);
L(k) = X(end,end); k = k+1;
for T0 = [ 	2	4	6	8	10 ]
    t0=[0,0.2,50,10^-6,0];
    [T,X]=ode45('ode_1',[0:T0],t0,options);
    t0=X(end,:);t0(1) = 0.2;
    [T,X]=ode45('ode_1',[0:T1],t0,options);
    L(k) = X(end,end); k = k+1;
end
radio = [ 0.2 0.2 0.2 0.2 0.2 0.2 0.2; 0.0 0.1 0.2 0.4 0.6 0.8 1.0];
T0 = 8;
for index = 1: 7
    t0=[0,radio(2,index),50,10^-6,0];
    [T,X]=ode45('ode_1',[0:T0],t0,options);
    t0=X(end,:);t0(1) = radio(1,index);
    [T,X]=ode45('ode_1',[0:T1],t0,options);
    L(k) = X(end,end); k = k+1;
end


L0 = [1310.10682	1563.470164	1607.847364	1703.270932	1720.326964	1996.055764	1614.778948	1310.10682	1814.606164	1996.055764	1842.790228	1614.88642	1599.799972	1343.898388];

y = norm(L-L0,inf)/norm(L0,inf);    


end


