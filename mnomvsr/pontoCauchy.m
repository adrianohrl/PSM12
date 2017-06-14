function delta_x = pontoCauchy(gfx, hfx, delta)
	theta = 1; % theta tem q ser um vetor e não um escalar
	aux = gfx' * hfx * gfx;
	if aux > 0
		alpha = gfx' * gfx / aux;
		theta = alpha * gfx;
		if theta > 1
			theta = 1;
		end;
	end;
	delta_x = -theta * delta / norm(gfx);
end