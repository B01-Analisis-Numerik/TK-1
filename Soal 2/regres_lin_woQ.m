function [x,res] = regres_lin_woQ(R,bt)
  [m,n] = size(R);
  x = R\bt;
  res = norm(bt(n+1:m));
end
