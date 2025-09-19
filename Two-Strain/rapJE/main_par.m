
clear
format long
global sigma  r  N
sigma=zeros(8,1); r=zeros(2,1);N=zeros(2,1);
J = 1;
ObjectiveFunction = @fitness;

nvars = 12 ;
LB = zeros(1,nvars);
UB = [];
X=zeros(nvars+1,100)';
tic

for i = 1: 100
    options = optimoptions('ga','ConstraintTolerance',1e-4,'UseParallel',true);
    [x,fval] = ga (ObjectiveFunction, nvars ,[],[],[],[],LB,UB,[],options);
    X(i,:)=[x,fval];
    disp(X(i,:))
end
toc

save([num2str(J) 'X.mat'], 'X')
