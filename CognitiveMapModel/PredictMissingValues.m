function X_pred = PredictMissingValues(X, nil)

[num_users, num_items] = size(X);

% ===================== replacing 0 with means ======================
items_means = zeros(1,num_items);
users_means = zeros(num_users,1);

for i=1:num_items
   items_means(i) = mean(X(X(:,i) ~= nil,i)); 
end
items_means(isnan(items_means)) = 4; % just in case an item has no ratings

for u=1:num_users
   users_means(u) = mean(X(u,X(u,:) ~= nil)); 
end
users_means(isnan(users_means)) = 4; % just in case a user has no ratings

%calculate initial imputed values
avg_of_means = (repmat(items_means,num_users,1) + repmat(users_means,1, num_items))/2; % calculate for each entry the the average of the means by user and by item

missing_values_indices = find(X == nil);
X_pred = X;
X_pred(missing_values_indices) = avg_of_means(missing_values_indices); 

%======================= simple normalized svd =============================
%perform normalized svd
column_means = mean(X_pred);
column_std = std(X_pred);
Z = (X_pred - repmat(column_means,size(X_pred,1),1))./repmat(column_std,size(X_pred,1),1);

[U,S,V] = svd(Z);

% compute the k-rank estimation of X
k = 14;
U_k = U(:,1:k);
S_k = S(1:k,1:k);
V_k = V(:,1:k);
X_pred = U_k *S_k * (V_k)';
X_pred = X_pred .* repmat(column_std,size(X_pred,1),1) + repmat(column_means,size(X_pred,1),1);


% %========================= regularized svd ================================
% % calculate base value of U and V using normalized svd
% column_means = mean(X_pred);
% column_std = std(X_pred);
% Z = (X_pred - repmat(column_means,size(X_pred,1),1))./repmat(column_std,size(X_pred,1),1);
% 
% [U,S,V] = svd(Z);
% 
% % compute the k-rank estimation of X
% K = 14;
% S = sqrt(S(1:K,1:K));
% U = U(:,1:K) * S;
% V = V(:,1:K) * S;
% 
% maxItr = 20; % maximum iteration time
% minimprov = 0.001;
% 
% 
% for k = 1:K
% 	olderr = inf;
%    for itr = 1:maxItr 
% 	   [U,V,trainerr] = train(X_pred, U,V,k,num_users,num_items);
%        % check if the error is still reducing
%        if abs(olderr - trainerr) < minimprov
% % 	   if trainerr >= olderr
%            break;
%        else
%            olderr = trainerr;
%        end
%    end
% end
% 
% X_pred = U*V';
% X_pred = X_pred .* repmat(column_std,size(X_pred,1),1) + repmat(column_means,size(X_pred,1),1);
