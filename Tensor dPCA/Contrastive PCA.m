function Us = cpca_alpha(X, Y, alpha,d)
% center data
Xmean = mean(X);
Xn = bsxfun(@minus, X, Xmean);
Ymean = mean(Y);
Yn = bsxfun(@minus, Y, Ymean);

% forming X Y matrices
X_cov = Xn' * Xn;
Y_cov = Yn' * Yn;
%% cPCA
Zc       = X_cov - alpha * Y_cov;
[U, E]   = eig(Zc);
[~, ind] = sort(diag(E), 'descend');
Us       = U(:, ind(1:d));
end
 
% %% RCA
% G = (Y + beta * eye(size(Y))) ^(-0.5);
% Zr = G * X * G';
% 
% [Ur, ~] = eigs(Zr, 2);
