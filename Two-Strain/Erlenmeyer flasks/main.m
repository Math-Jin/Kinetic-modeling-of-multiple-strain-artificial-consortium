clear
format long
global sigma  r  N J
sigma=zeros(10,1); r=zeros(4,1);N=zeros(2,1);

J=101;
ObjectiveFunction = @simple_fit;
nvars = 16;
LB = zeros(1,nvars);
A=zeros(nvars);
UB = [];
X=zeros(nvars+1,Final)';
tic
for i = 1: 100
    options = optimoptions('ga','ConstraintTolerance',1e-4,'UseParallel',true);
    [x,fval] = ga (ObjectiveFunction, nvars ,[],[],[],[],LB,UB,[],options);
    X(i,:)=[x,fval];
    disp(X(i,:))
end
toc

save([num2str(J) 'X.mat'], 'X')