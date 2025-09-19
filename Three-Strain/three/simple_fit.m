function y = simple_fit(x)


global sigma  r N
sigma = x(1:11);
r = x(12:13);
N = x(14:15);

L = zeros(1,14);k = 1;
T0 = 72;
options1 = odeset('RelTol',1e-8,'AbsTol',[ 1e-8 1e-8 1e-8 1e-8 ]);
options2 = odeset('RelTol',1e-8,'AbsTol',[1e-4 1e-4 1e-4 1e-4 1e-4  ]);
options = odeset( 'RelTol',1e-8,'AbsTol',[1e-4 1e-4 1e-4 1e-4 1e-4  ]);

t0 = [0.2,0,50,10^-6,0];
[~,X]=ode45('ode_2',[0:T0],t0,options);
L(k) = X(end,5);k = k+1;

for index = [ 0 2 4 6 8 10]
    if  index == 0
        t0 = [0.2,0.2,50,10^-6,0];
        [~,X1]=ode45('ode_2',[0:T0],t0,options);
        L(k) = X(end,5);k = k+1;
    else
        t0 = [0,0.2,50,10^-6,0];
        [~,X1]=ode45('ode_2',[0:index],t0,options2);
        t0 = X1(end,:);t0(1)=0.2;
        [~,X]=ode45('ode_2',[0:T0],t0,options2);
        L(k) = X(end,5);k = k+1;
    end
end



radio = [0.0,0.2;0.1,0.2;0.2,0.2;0.4,0.2;0.6,0.2;0.8,0.2;1.0,0.2];
for index = 1:7
    t0 = [0,radio(index,1),50,10^-6,0];
    [~,X1]=ode45('ode_2',[0:8],t0,options2);
    
    t0 = X1(end,:); t0(1) = radio(index,2);
    [~,X]=ode45('ode_2',[0:T0],t0,options2);
    L(k) = X(end,5);k = k+1;
end



z =[1310.10682	1563.470164	1607.847364	1703.270932	1720.326964	1996.055764	1614.778948	1310.10682	1814.606164	1996.055764	1842.790228	1614.88642	1599.799972	1343.898388];
y=norm(L-z,inf)/norm(z,inf);
end
