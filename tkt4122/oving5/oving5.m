% Solving a single problem: using a script is just fine
% Using M for length and N for force

L = 40;
b = 10;
P1 = 200E3;
P2 = 300E3;

x1s = [-b:.1:L];			% Mesh using a step of 0.1 m
Bys = zeros(size(x1s));		% Creating the entire vector up front is faster

for i = 1:length(x1s)
	x1 = x1s(i);
	By1 = reaction_b(L, P1, x1);
	x2 = x1 + b;
	By2 = reaction_b(L, P2, x2);
	By = By1 + By2;
	Bys(i) = By;
end

plot(x1s, Bys);
[By_max, pos] = max(Bys);
fprintf('Maximum reaction is at x1 = %f, where By = %f\n', x1s(pos), By_max);
