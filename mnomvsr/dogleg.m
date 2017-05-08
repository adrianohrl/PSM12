function delta_x = dogleg(gfx, hfx, delta, fminname)
	delta_x_u = -gfx' * gfx / (gfx' * hfx * gfx) * gfx;
	if norm(delta_x_u) > delta
		delta_x = delta * delta_x_u / norm(delta_x_u);
	else 
		delta_x_n = hfx \ gfx;
		tfname = @(tau) norm(delta_x_u + (tau - 1) * (delta_x_n - delta_x_u));
		tau = feval(fminname, tfname, 1, 2);
		delta_x = delta_x_u + (tau - 1) * (delta_x_n - delta_x_u);
	end;
end