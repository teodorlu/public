% Calculates the center support in a three field beam given the force's location
% All parameters are scalars
function [By] = reaction_b(L, P, x)
if x < 0 || x > L
	By = 0;
else
	b = min(x, L-x);
	By = b * (3*L^2 - 4*b^2) * P / L^3;
end
end
