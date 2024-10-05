function regres_lin_full(iteration)
    % Function to compare the efficiency of three algorithms without runtime measurement
    [Ev, Xs, b] = eigen_qr_cov_matrix("pokindex_data.csv",iteration);
    Z = pca_transform(Ev, Xs, 5);

    % Calculate regres_lin_normal
    [X_pers_normal, res_pers_normal] = regres_lin_normal(Z, b);
    disp('Hasil Pers Normal');
    X_pers_normal
    res_pers_normal
    disp("")

    % Calculate qr_householder_optimized
    [Q, R] = qr_householder_optimized(Z);
    [x_HHQ, res_HHQ] = regres_lin_withQ(Q, R, b);
    disp('Hasil HHQ (Householder with Q)');
    x_HHQ
    res_HHQ
    disp("")

    % Calculate qr_householder_woQ_optimized
    [R, bt] = qr_householder_woQ_optimized(Z, b);
    [x_HHWOQ, res_HHWOQ] = regres_lin_woQ(R, bt);
    disp('Hasil HHWOQ (Householder without Q)');
    x_HHWOQ
    res_HHWOQ
    disp("")
end

