clear,clc,close all
[~,txtData]  = xlsread('Symptonnames.xlsx','A1:PF1');
[temp]  = readmatrix('2018_country_daily_2018_US_daily_symptoms_dataset.csv');
temp2018 = temp(:,8:end);% whole dataset, 1-365 rows for Us, then each 365 rows for 1 state
[temp]  = readmatrix('2019_country_daily_2019_US_daily_symptoms_dataset.csv');
temp2019 = temp(:,8:end);% whole dataset, 1-365 rows for Us, then each 365 rows for 1 state
[temp]  = readmatrix('2020_country_daily_2020_US_daily_symptoms_dataset.csv');
temp2020 = temp(:,8:end);% whole dataset, 1-365 rows for Us, then each 365 rows for 1 state

temp2018(isnan(temp2018))=0;
temp2019(isnan(temp2019))=0;
temp2020(isnan(temp2020))=0;

feature_set =[7,351,20,412,110, 93,142, 139, 169];
sympts = {'Ageusia', 'Shortness of breath', 'Anosmia','Vomiting','Diarrhea','Cough','Fever','Fatigue','Headache'};

X = temp2020(:, feature_set );
Y = temp2019(:, feature_set );
Z = temp2018(:, feature_set );
% remove the rows when Anosmia is 0
X=X(find(X(:,1)~=0),:);
Y=Y(find(Y(:,1)~=0),:);
Z=Z(find(Z(:,1)~=0),:);

%% plot for slides
Ite = 100;
%% dpca
for ite = 1 : Ite
    [Vrr, Xr]=nndpca(X,Y,1);
    [valsort,ind] = sort(((Vrr(:,1))),'descend');
    Ind_dpca(ite,:) = ind';
end
for i = 1 : size(X , 2)
    temp = Ind_dpca(: , 1);
    temp = temp(:);
    Freq1_dpca(i) = length(find(temp == i));
    temp = Ind_dpca(: , 1:2);
    temp = temp(:);
    Freq2_dpca(i) = length(find(temp == i));
    temp = Ind_dpca(: , 1:3);
    temp = temp(:);
    Freq3_dpca(i) = length(find(temp == i));
end


%% alternatives
%cpca
alpha=0.1;
for ite = 1 : Ite
    Us = cpca_alpha(X, Y, alpha,1);
    [valsort,ind] = sort((Us(:,1)),'descend');
    Ind(ite,:) = ind';
end
for i = 1 : size(X , 2)
    temp = Ind(: , 1);
    temp = temp(:);
    Freq1_cpca1(i) = length(find(temp == i));
    temp = Ind(: , 1:2);
    temp = temp(:);
    Freq2_cpca1(i) = length(find(temp == i));
    temp = Ind(: , 1:3);
    temp = temp(:);
    Freq3_cpca1(i) = length(find(temp == i));
end


alpha=0.5;
for ite = 1 : Ite
    Us = cpca_alpha(X, Y, alpha,1);
    [valsort,ind] = sort((Us(:,1)),'descend');
    Ind(ite,:) = ind';
end
for i = 1 : size(X , 2)
    temp = Ind(: , 1);
    temp = temp(:);
    Freq1_cpca5(i) = length(find(temp == i));
    temp = Ind(: , 1:2);
    temp = temp(:);
    Freq2_cpca5(i) = length(find(temp == i));
    temp = Ind(: , 1:3);
    temp = temp(:);
    Freq3_cpca5(i) = length(find(temp == i));
end

alpha=0.9;
for ite = 1 : Ite
    Us = cpca_alpha(X, Y, alpha,1);
    [valsort,ind] = sort((Us(:,1)),'descend');
    Ind(ite,:) = ind';
end
for i = 1 : size(X , 2)
    temp = Ind(: , 1);
    temp = temp(:);
    Freq1_cpca9(i) = length(find(temp == i));
    temp = Ind(: , 1:2);
    temp = temp(:);
    Freq2_cpca9(i) = length(find(temp == i));
    temp = Ind(: , 1:3);
    temp = temp(:);
    Freq3_cpca9(i) = length(find(temp == i));
end

% nnmf on 2020 data

for ite = 1 : Ite
    k=1;
    [U,W] = nnmf(X' , k);
    s = zeros(k,1);
    for i = 1:size(U,2)
        s(i) = norm(U(:,i))* norm(W(i,:));
        U(:,i) = U(:,i)/norm(U(:,i));
    end
    [~, ind0] = sort(s, 'descend');
    Vrr = U(:, ind0(1:k));
    [valsort,ind] = sort(((Vrr(:,1))),'descend');
    Ind(ite,:) = ind';
end
for i = 1 : size(X , 2)
    temp = Ind(: , 1);
    temp = temp(:);
    Freq1_nnmf20(i) = length(find(temp == i));
    temp = Ind(: , 1:2);
    temp = temp(:);
    Freq2_nnmf20(i) = length(find(temp == i));
    temp = Ind(: , 1:3);
    temp = temp(:);
    Freq3_nnmf20(i) = length(find(temp == i));
end

% nnmf on 2019 data
for ite = 1 : Ite
    k=1;
    [U,W] = nnmf(Y' , k);
    s = zeros(k,1);
    for i = 1:size(U,2)
        s(i) = norm(U(:,i))* norm(W(i,:));
        U(:,i) = U(:,i)/norm(U(:,i));
    end
    [~, ind0] = sort(s, 'descend');
    Vrr = U(:, ind0(1:k));
    [valsort,ind] = sort(((Vrr(:,1))),'descend');
    Ind(ite,:) = ind';
end
for i = 1 : size(X , 2)
    temp = Ind(: , 1);
    temp = temp(:);
    Freq1_nnmf19(i) = length(find(temp == i));
    temp = Ind(: , 1:2);
    temp = temp(:);
    Freq2_nnmf19(i) = length(find(temp == i));
    temp = Ind(: , 1:3);
    temp = temp(:);
    Freq3_nnmf19(i) = length(find(temp == i));
end

% pca on 2020 data
alpha=0;

for ite = 1 : Ite
    Us = cpca_alpha(X, Y, alpha,1);
    [valsort,ind] = sort((Us(:,1)),'descend');
    Ind(ite,:) = ind';
end
for i = 1 : size(X , 2)
    temp = Ind(: , 1);
    temp = temp(:);
    Freq1_pac20(i) = length(find(temp == i));
    temp = Ind(: , 1:2);
    temp = temp(:);
    Freq2_pac20(i) = length(find(temp == i));
    temp = Ind(: , 1:3);
    temp = temp(:);
    Freq3_pac20(i) = length(find(temp == i));
end

% pca on 2019 data
alpha=0;
for ite = 1 : Ite
    Us = cpca_alpha(Y, X, alpha,1);
    [valsort,ind] = sort((Us(:,1)),'descend');
    Ind(ite,:) = ind';
end
for i = 1 : size(X , 2)
    temp = Ind(: , 1);
    temp = temp(:);
    Freq1_pac19(i) = length(find(temp == i));
    temp = Ind(: , 1:2);
    temp = temp(:);
    Freq2_pac19(i) = length(find(temp == i));
    temp = Ind(: , 1:3);
    temp = temp(:);
    Freq3_pac19(i) = length(find(temp == i));
end

[Freq1_dpca;Freq1_cpca1;Freq1_cpca5;Freq1_cpca9;Freq1_nnmf20;Freq1_nnmf19;Freq1_pac20;Freq1_pac19]

[Freq2_dpca;Freq2_cpca1;Freq2_cpca5;Freq2_cpca9;Freq2_nnmf20;Freq2_nnmf19;Freq2_pac20;Freq2_pac19]

[Freq3_dpca;Freq3_cpca1;Freq3_cpca5;Freq3_cpca9;Freq3_nnmf20;Freq3_nnmf19;Freq3_pac20;Freq3_pac19]


