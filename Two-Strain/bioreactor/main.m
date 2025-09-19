clear
format long
global sigma  r  N J
sigma=zeros(10,1); r=zeros(4,1);N=zeros(2,1);
J=6;


ObjectiveFunction = @simple_fit;
nvars = 16;
LB = zeros(1,nvars);
A=zeros(nvars);
UB = [];
X=zeros(nvars+1,Final)';
tic
    for i = 1: 100
        options = gaoptimset(       'Generations', 5000, ...         % 最大迭代次数
        'PopulationSize', 600, ...       % 种群大小
        'StallGenLimit', 100, ...        % 当种群平均适应度在100代内未发生改变时，终止搜索
        'TolFun', 1e-6, ...              % 适应度函数值变化小于1e-6时，认为已经达到最优解
        'UseParallel', true, ...         % 是否使用并行计算
        'Vectorized', 'off', ...          % 向量化操作
        'CrossoverFraction', 0.85, ...    % 交叉概率
        'EliteCount', 5, ...             % 精英个体数量
        'FitnessLimit', -Inf, ...        % 适应度限制
        'MutationFcn',{@mutationadaptfeasible,0.1}, ... % 变异函数
        'SelectionFcn', @selectiontournament);% 选择函数)
    [x,fval] = ga (ObjectiveFunction, nvars ,[],[],[],[],LB,UB,[],options);
    X(i,:)=[x,fval];
    disp(X(i,:)')
    end 
toc

save([num2str(J) 'X.mat'], 'X')