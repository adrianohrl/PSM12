function y = m(fx, gfx, hfx, delta_x)
	y = fx + gfx' * delta_x + 0.5 * delta_x' * hfx * delta_x;
end