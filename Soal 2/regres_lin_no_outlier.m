function regres_lin_no_outlier(iteration)
    % Function to compare the algorithms with data outlier and no outlier
    [Ev_out, Xs_out, b_out] = eigen_qr_cov_matrix("pokindex_data.csv",iteration);
    Z_out = pca_transform(Ev_out, Xs_out, 5);

    [R_out, bt_out] = qr_householder_woQ_optimized(Z_out, b_out);
    [x_out, res_out] = regres_lin_woQ(R_out, bt_out);
    disp('Hasil HHWOQ (Householder without Q)for outlier data');
    x_out
    res_out
    disp("")

    % processing for no outlier data
    [Ev_no_out, Xs_no_out, b_no_out] = eigen_qr_cov_matrix("pokindex_data_nooutlier.csv",iteration);
    Z_no_out = pca_transform(Ev_no_out, Xs_no_out, 5);

    [R_no_out, bt_no_out] = qr_householder_woQ_optimized(Z_no_out, b_no_out);
    [x_no_out, res_no_out] = regres_lin_woQ(R_no_out, bt_no_out);
    disp('Hasil HHWOQ (Householder without Q)for NO OUTLIER data');
    x_no_out
    res_no_out
    disp("")
end
