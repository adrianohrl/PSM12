function y = quad(x, b)

	x1 = x(1);
	x2 = x(2);
	b0 = b(1);
	b1 = b(2);
	b2 = b(3);
	b11 = b(4);
	b22 = b(5);
	b12 = b(6);
	y = b0 + b1*x1 + b2*x2 + b11*x1^2 + b22*x2^2 + b12*x1*x2;
	
end