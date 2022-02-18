function dydt = odefcn(t, y, L, C, R)
  dydt = zeros(2,1);

  dydt(1) = y(2);
  dydt(2) = (-1 / (L * C)) * y(1) + ((-1 * R) / L) * y(2) + 0 * t;
  
end
