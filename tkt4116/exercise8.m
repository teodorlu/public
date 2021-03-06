close all;

% a)
data = load('leirehaug.txt');
x = data(:, 1);
q = data(:, 2);
R = trapz(x, q);
Mr = trapz(x, q.*x);
L = x(end);

By * L = Mr --> By = Mr/L
By = Mr/L
Ay = R - By

% b)cd 
n = length(x);
V = zeros(1,n);
M = zeros(1,n);

V(1) = Ay;
M(1) = 0;

for i = 1 : n-1	% Regner ut verdier for i+1. Maks: i_max + 1 = n --> i_max = n-1
	dx = x(i+1) - x(i);
	q_avg = (q(i) + q(i))/2;
	V(i + 1) = V(i) - q_avg * dx;
	M(i + 1) = M(i) + V(i) * dx - q_avg * dx^2/2;
end

fprintf('The maximum value of M is %.2f kNm\n', max(M));

figure('name', 'V-diagram');
plot(x, V)
figure('name', 'M-diagram');
plot(x, M)
