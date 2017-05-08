function delta_x = passoNewton(gfx, hfx, delta)
	theta = hfx \ gfx;
	delta_x = -theta * delta / norm(gfx);
end