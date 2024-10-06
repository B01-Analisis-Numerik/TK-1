function rel_err = run_accuracy(b, A, X)
   rel_err = norm(b - A * X, 2) / norm(b, 2);
 end
