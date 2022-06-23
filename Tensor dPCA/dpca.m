function [Vrr, Xr]=dpca(X,Y,d)
% center data
Xmean = mean(X);
Xn = bsxfun(@minus, X, Xmean);
Ymean = mean(Y);
Yn = bsxfun(@minus, Y, Ymean);

% forming X Y matrices
X_cov = Xn' * Xn;
Y_cov = Yn' * Yn;
beta = 0.01;
[~, S, Dt] = svd((Y_cov + beta * eye(size(Y_cov))) \ X_cov);
[~, ind] = sort(diag(S), 'descend');
Vrr = Dt(:, ind(1:d));

Xr = Xn * Vrr;
end