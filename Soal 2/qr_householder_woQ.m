function [R, bt] = qr_householder_woQ(A,b)
  [m,n] = size(A);
  A = [A,b];
  for j = 1:n
    v = sign(A(j,j)) * norm(A(j:m,j)) * [1;zeros(m-j,1)] - A(j:m,j) ;
    alp = 2/(v'*v);
    for k = j:n+1
      A(j:m,k) = A(j:m,k) - (alp * v' * A(j:m,k) * v);
    endfor
  endfor
  R = A(:,1:n);
  bt = A(:,n+1);
endfunction

