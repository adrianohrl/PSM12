function y = hf8(x)
	x1 = x(1);
	x2 = x(2);
	x3_2 = 1 - x1.^2 - x2.^2;
	d2f_dx1x1 = 8*x1.*x2.*(3 - 2*x1.^2 - 3*x2.^2)./sqrt(x3_2).^3;
	d2f_dx1dx2 = 8*(x1.^2.*x2.^2 + (x1.^2 + x2.^2).*x3_2 - x3_2.^2)./sqrt(x3_2).^3;
	d2f_dx2dx1 = 8*(x1.^2.*x2.^2 + (x1.^2 + x2.^2).*x3_2 - x3_2.^2)./sqrt(x3_2).^3;
	d2f_dx2x2 = 8*x1.*x2.*(3 - 3*x1.^2 - 2*x2.^2)./sqrt(x3_2).^3;
	y = [d2f_dx1x1 d2f_dx1dx2; d2f_dx2dx1 d2f_dx2x2]; % Matriz Hessiana da Função da questão 8
end