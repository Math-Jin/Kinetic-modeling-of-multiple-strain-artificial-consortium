function y = fitness(x)
global sigma r N

sigma(1:8) = x(1:8);
r(1:2) = x(9:10); N(1:2) = x(11:12);
L = zeros(1,16);
k = 1;
T1 = 72;
options = odeset('RelTol',1e-8,'AbsTol',[ 1e-4 1e-4 1e-4 1e-4 1e-4 ]);
t0=[0.2,0,50,10^-6,0];
[T,X]=ode45('ode_1',[0:T1],t0,options);
L(k) = X(end,end); k = k+1;
T0 = 2;
t0=[0.2,0,50,10^-6,0];
[T,X]=ode45('ode_1',[0:T0],t0,options);
t0=X(end,:);t0(2) = 0.2;
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
radio = [0.2 0.8 0.6 0.4 0.2 0.2 0.2 0.2; 0.0 0.2 0.2 0.2 0.2 0.4 0.6 0.8];
for index = 1: 8
    t0=[radio(1,index),radio(2,index),50,10^-6,0];
    [T,X]=ode45('ode_1',[0:T1],t0,options);
    L(k) = X(end,end); k = k+1;
end
L0 = [607.76698	784.5937655	1215.745753	888.0478865	567.0615605	190.5248615	269.4549515	145.2977045,630.971284	786.411172	773.10154	954.351892	1192.892548	1198.032532	1764.228628	1482.399436];
y = norm(L-L0,inf)/norm(L0,inf);
end


