function [Z] = pca_transform(Ev, Xs, k)
    [n,~] = size(Ev);
    cov_red = Ev(1:n,1:k);
    Z = Xs * cov_red;
end