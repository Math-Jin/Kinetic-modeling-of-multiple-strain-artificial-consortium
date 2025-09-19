function y = fitness(x)
global sigma r N

sigma(1:8) = x(1:8);
r(1:2) = x(9:10); N(1:2) = x(11:12);
L0 = [3140.510368	2683.907152	2560.90984	2211.756112	3253.786	3114.549808	2017.77784	2746.93624	2632.85896	3477.169456	3202.975024	3457.228624	4005.175984	2896.574416];
L = L0*0;
k = 1;
T1 = 72;
options = odeset('RelTol',1e-8,'AbsTol',[ 1e-4 1e-4 1e-4 1e-4 1e-4 ]);
t0=[0.2,0,60,10^-6,0];
[T,X]=ode45('ode_1',[0:T1],t0,options);
L(k) = X(end,end); k = k+1;

for T0 = [ 4 2 ]
    t0=[0,0.2,60,10^-6,0];
    [T,X]=ode45('ode_1',[0:T0],t0,options);
    t0=X(end,:);t0(1) = 0.2;
    [T,X]=ode45('ode_1',[0:T1],t0,options);
    L(k) = X(end,end); k = k+1;
end


t0=[0.2,0.2,60,10^-6,10^-6];
[T,X]=ode45('ode_1',[0:T1],t0,options);
L(k) = X(end,end); k = k+1;

for T0 = [ 	2	4 ]
    t0=[0.2,0,60,10^-6,0];
    [T,X]=ode45('ode_1',[0:T0],t0,options);
    t0=X(end,:);t0(2) = 0.2;
    [T,X]=ode45('ode_1',[0:T1-T0],t0,options);
    L(k) = X(end,end); k = k+1;
end



radio1 = [ 0.2 0.2 0.2 0.4 0.6 0.8; 0.6 0.4 0.2 0.2 0.2 0.2];
T0 = 4;
for index = 1: 6
    t0=[0,radio1(2,index),60,10^-6,0];
    [T,X]=ode45('ode_1',[0:T0],t0,options);
    t0=X(end,:);t0(1) = radio1(1,index);
    [T,X]=ode45('ode_1',[0:T1],t0,options);
    L(k) = X(end,end); k = k+1;
end

radio2 = [ 0.2 0.2; 0.6 0.4];
T0 = 2;
for index = 1: 2
    t0=[radio2(1,index),0,60,10^-6,0];
    [T,X]=ode45('ode_1',[0:T0],t0,options);
    t0=X(end,:);t0(2) = radio2(2,index);
    [T,X]=ode45('ode_1',[0:T1-T0],t0,options);
    L(k) = X(end,end); k = k+1;
end



y = norm(L-L0,inf)/norm(L0,inf);

end


