function y = h(x, coeficients)
	a = coeficients(1);
	b = coeficients(2);
	c = coeficients(3);
	y = a + b * x + c * x .^ 2;
end