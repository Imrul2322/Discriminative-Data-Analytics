function [Vrr, Xr]=nndpca(X,Y,d)
% center data
Xmean = mean(X);
Xn = bsxfun(@minus, X, Xmean);
Ymean = mean(Y);
Yn = bsxfun(@minus, Y, Ymean);

% forming X Y matrices
X_cov = Xn' * Xn;
Y_cov = Yn' * Yn;
beta = 0.01;
k = 5;
[U,W] = nnmf((Y_cov + beta * eye(size(Y_cov))) \ X_cov , k);
s = zeros(k,1);
for i = 1:size(U,2)
    s(i) = norm(U(:,i))* norm(W(i,:));
    U(:,i) = U(:,i)/norm(U(:,i));
end
[~, ind] = sort(s, 'descend');
Vrr = U(:, ind(1:d));

Xr = Xn * Vrr;
end