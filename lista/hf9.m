function y = hf9(x)
	x1 = x(1, :);
	x2 = x(2, :);
	x3 = x(3, :);
	x5 = x(4, :);
	y = zeros(4);
	y(1, 1) = y(1, 2) = y(2, 1) = y(2, 2) = -sin(x1 + x2); %df_dx1x1 = df_dx1x2 = df_dx2x1 = df_dx2x2
	y(3, 3) = 2; %df_dx2x1
	y(4, 4) = 4*x5.^2; %df_dx1x1
end