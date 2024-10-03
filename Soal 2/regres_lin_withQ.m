function [x,res] = regres_lin_withQ(Q,R,b)
  [m, n] = size(R);
  bt = Q' * b;
  x = R\bt;
  res = norm(bt(n+1:m));
end

