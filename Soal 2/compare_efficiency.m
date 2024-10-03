function compare_efficiency
    % Function to compare the efficiency of three algorithms using tic-toc
    [Ev, Xs, b] = eigen_qr_cov_matrix("pokindex_data.csv",1000);
    Z = pca_transform(Ev, Xs, 5)

    % Measure time for regres_lin_normal
    tic;
    [X, res] = regres_lin_normal(Z, b);
    time_regres_lin_normal = toc;
    fprintf('Time taken by regres_lin_normal: %.6f seconds\n', time_regres_lin_normal);

    % Measure time for qr_householder_optimized
    tic;
    [Q, R] = qr_householder_optimized(Z);
    time_qr_householder_optimized = toc;
    fprintf('Time taken by qr_householder_optimized: %.6f seconds\n', time_qr_householder_optimized);

    % Measure time for qr_householder_woQ_optimized
    tic;
    [R, bt] = qr_householder_woQ_optimized(Z, b);
    time_qr_householder_woQ_optimized = toc;
    fprintf('Time taken by qr_householder_woQ_optimized: %.6f seconds\n', time_qr_householder_woQ_optimized);

    % Compare the times
    fprintf('Comparison of computation times:\n');
    fprintf('regres_lin_normal: %.6f seconds\n', time_regres_lin_normal);
    fprintf('qr_householder_optimized: %.6f seconds\n', time_qr_householder_optimized);
    fprintf('qr_householder_woQ_optimized: %.6f seconds\n', time_qr_householder_woQ_optimized);
end
