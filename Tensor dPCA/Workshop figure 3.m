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
Ite = 1000;
ind = 1 : 9;
sympts_sorted = sympts(ind);
x = categorical(sympts_sorted);
x = reordercats(x,sympts_sorted);

%% alternatives
%cpca
alpha=0.1;
clear temp;
for ite = 1 : Ite
    Us = cpca_alpha(X, Y, alpha,1);
    temp(ite, :) = (Us(:,1))';
end
y = mean(temp);
values(1, :) = y;
figure(1);
subplot(1,2,1);
y_std = std(temp);
x1 = x(1:3);
x2 = x(4:end);
y1 = y(1:3);
y2 = y(4:end);
y_std1 = y_std(1:3);
y_std2 = y_std(4:end);
types=categorical({'Unique COVID-19 symptoms','Shared between COVID-19 and Flu'});
types=reordercats(types,{'Unique COVID-19 symptoms','Shared between COVID-19 and Flu'});
a(1) = bar(x1,y1,'FaceColor',[0 0.8 0]); grid on; title('cPCA (target:2020, background:2019) \alpha=0.1', 'FontSize', 15);
ylabel('Symptom coefficients', 'FontSize', 15);
hold on;    
errorbar(x1,y1,y_std1,'b','LineStyle','none');
hold on;
a(2) = bar(x2,y2,'FaceColor',[0.8 0 0]); grid on; 
ylabel('Symptom coefficients', 'FontSize', 15);
hold on;    
errorbar(x2,y2,y_std2,'b','LineStyle','none');
legend(a, string(types), 'location', 'northwest', 'FontSize', 11);
ax = gca;
ax.FontSize = 12; 


alpha=0.1;
clear temp;
for ite = 1 : Ite
    Us = cpca_alpha(X, Z, alpha,1);
    temp(ite, :) = (Us(:,1))';
end
y = mean(temp);
values(2, :) = y;
subplot(1,2,2);
y_std = std(temp);
x1 = x(1:3);
x2 = x(4:end);
y1 = y(1:3);
y2 = y(4:end);
y_std1 = y_std(1:3);
y_std2 = y_std(4:end);
types=categorical({'Unique COVID-19 symptoms','Shared between COVID-19 and Flu'});
types=reordercats(types,{'Unique COVID-19 symptoms','Shared between COVID-19 and Flu'});
a(1) = bar(x1,y1,'FaceColor',[0 0.8 0]); grid on; title('cPCA (target:2020, background:2018) \alpha=0.1');
ylabel('Symptom coefficients');
hold on;    
errorbar(x1,y1,y_std1,'b','LineStyle','none');
hold on;
a(2) = bar(x2,y2,'FaceColor',[0.8 0 0]); grid on; 
ylabel('Symptom coefficients');
hold on;    
errorbar(x2,y2,y_std2,'b','LineStyle','none');
legend(a, string(types), 'location', 'northwest');

alpha=0.5;
clear temp;
for ite = 1 : Ite
    Us = cpca_alpha(X, Y, alpha,1);
    temp(ite, :) = (Us(:,1))';
end
y = mean(temp);
values(3, :) = y;
figure(2);
subplot(1,2,1);
y_std = std(temp);
x1 = x(1:3);
x2 = x(4:end);
y1 = y(1:3);
y2 = y(4:end);
y_std1 = y_std(1:3);
y_std2 = y_std(4:end);
types=categorical({'Unique COVID-19 symptoms','Shared between COVID-19 and Flu'});
types=reordercats(types,{'Unique COVID-19 symptoms','Shared between COVID-19 and Flu'});
a(1) = bar(x1,y1,'FaceColor',[0 0.8 0]); grid on; title('cPCA (target:2020, background:2019) \alpha=0.5', 'FontSize', 15);
ylabel('Symptom coefficients', 'FontSize', 14);
hold on;    
errorbar(x1,y1,y_std1,'b','LineStyle','none');
hold on;
a(2) = bar(x2,y2,'FaceColor',[0.8 0 0]); grid on; 
ylabel('Symptom coefficients', 'FontSize', 14);
hold on;    
errorbar(x2,y2,y_std2,'b','LineStyle','none');
legend(a, string(types), 'location', 'northwest', 'FontSize', 11)
ax = gca;
ax.FontSize = 12; 



alpha=0.5;
clear temp;
for ite = 1 : Ite
    Us = cpca_alpha(X, Z, alpha,1);
    temp(ite, :) = (Us(:,1))';
end
y = mean(temp);
values(4, :) = y;
subplot(1,2,2);
y_std = std(temp);
x1 = x(1:3);
x2 = x(4:end);
y1 = y(1:3);
y2 = y(4:end);
y_std1 = y_std(1:3);
y_std2 = y_std(4:end);
types=categorical({'Unique COVID-19 symptoms','Shared between COVID-19 and Flu'});
types=reordercats(types,{'Unique COVID-19 symptoms','Shared between COVID-19 and Flu'});
a(1) = bar(x1,y1,'FaceColor',[0 0.8 0]); grid on; title('cPCA (target:2020, background:2018) \alpha=0.5', 'FontSize', 15);
ylabel('Symptom coefficients', 'FontSize', 14);
hold on;    
errorbar(x1,y1,y_std1,'b','LineStyle','none');
hold on;
a(2) = bar(x2,y2,'FaceColor',[0.8 0 0]); grid on; 
ylabel('Symptom coefficients', 'FontSize', 14);
hold on;    
errorbar(x2,y2,y_std2,'b','LineStyle','none');
legend(a, string(types), 'location', 'northwest', 'FontSize', 11)
ax = gca;
ax.FontSize = 12; 



alpha=0.9;
clear temp;
for ite = 1 : Ite
    Us = cpca_alpha(X, Y, alpha,1);
    temp(ite, :) = (Us(:,1))';
end
y = mean(temp);
values(5, :) = y;
figure(3);
subplot(1,2,1);
y_std = std(temp);
x1 = x(1:3);
x2 = x(4:end);
y1 = y(1:3);
y2 = y(4:end);
y_std1 = y_std(1:3);
y_std2 = y_std(4:end);
types=categorical({'Unique COVID-19 symptoms','Shared between COVID-19 and Flu'});
types=reordercats(types,{'Unique COVID-19 symptoms','Shared between COVID-19 and Flu'});
a(1) = bar(x1,y1,'FaceColor',[0 0.8 0]); grid on; title('cPCA (target:2020, background:2019) \alpha=0.9');
ylabel('Symptom coefficients');
hold on;    
errorbar(x1,y1,y_std1,'b','LineStyle','none');
hold on;
a(2) = bar(x2,y2,'FaceColor',[0.8 0 0]); grid on; 
ylabel('Symptom coefficients');
hold on;    
errorbar(x2,y2,y_std2,'b','LineStyle','none');
legend(a, string(types), 'location', 'northwest')


alpha=0.9;
clear temp;
for ite = 1 : Ite
    Us = cpca_alpha(X, Z, alpha,1);
    temp(ite, :) = (Us(:,1))';
end
y = mean(temp);
values(6, :) = y;
subplot(1,2,2);
y_std = std(temp);
x1 = x(1:3);
x2 = x(4:end);
y1 = y(1:3);
y2 = y(4:end);
y_std1 = y_std(1:3);
y_std2 = y_std(4:end);
types=categorical({'Unique COVID-19 symptoms','Shared between COVID-19 and Flu'});
types=reordercats(types,{'Unique COVID-19 symptoms','Shared between COVID-19 and Flu'});
a(1) = bar(x1,y1,'FaceColor',[0 0.8 0]); grid on; title('cPCA (target:2020, background:2018) \alpha=0.9');
ylabel('Symptom coefficients');
hold on;    
errorbar(x1,y1,y_std1,'b','LineStyle','none');
hold on;
a(2) = bar(x2,y2,'FaceColor',[0.8 0 0]); grid on; 
ylabel('Symptom coefficients');
hold on;    
errorbar(x2,y2,y_std2,'b','LineStyle','none');
legend(a, string(types), 'location', 'northwest')









% nnmf on 2020 data
k=1;
clear temp;
for ite = 1 : Ite
    [U,W] = nnmf(X' , k);
    s = zeros(k,1);
    for i = 1:size(U,2)
        s(i) = norm(U(:,i))* norm(W(i,:));
        U(:,i) = U(:,i)/norm(U(:,i));
    end
    [~, ind0] = sort(s, 'descend');
    Vrr = U(:, ind0(1:k));
    temp(ite, :) = (Vrr(:,1))';
end
y = mean(temp);
values(7, :) = y;
figure(4);
subplot(1,2,1);
y_std = std(temp);
x1 = x(1:3);
x2 = x(4:end);
y1 = y(1:3);
y2 = y(4:end);
y_std1 = y_std(1:3);
y_std2 = y_std(4:end);
types=categorical({'Unique COVID-19 symptoms','Shared between COVID-19 and Flu'});
types=reordercats(types,{'Unique COVID-19 symptoms','Shared between COVID-19 and Flu'});
a(1) = bar(x1,y1,'FaceColor',[0 0.8 0]); grid on; title('NNMF using 2020 data', 'FontSize', 15);
ylabel('Symptom coefficients', 'FontSize', 14);
hold on;    
errorbar(x1,y1,y_std1,'b','LineStyle','none');
hold on;
a(2) = bar(x2,y2,'FaceColor',[0.8 0 0]); grid on; 
ylabel('Symptom coefficients', 'FontSize', 14);
hold on;    
errorbar(x2,y2,y_std2,'b','LineStyle','none');
legend(a, string(types), 'location', 'northwest', 'FontSize', 11)
ax = gca;
ax.FontSize = 12; 



% pca on 2020 data
alpha=0;
clear temp;
for ite = 1 : Ite
    Us = cpca_alpha(X, Y, alpha,1);
    temp(ite, :) = (Us(:,1))';
end
y = mean(temp);
values(8, :) = y;
subplot(1,2,2);
y_std = std(temp);
x1 = x(1:3);
x2 = x(4:end);
y1 = y(1:3);
y2 = y(4:end);
y_std1 = y_std(1:3);
y_std2 = y_std(4:end);
types=categorical({'Unique COVID-19 symptoms','Shared between COVID-19 and Flu'});
types=reordercats(types,{'Unique COVID-19 symptoms','Shared between COVID-19 and Flu'});
a(1) = bar(x1,y1,'FaceColor',[0 0.8 0]); grid on; title('PCA using 2020 data', 'FontSize', 15);
ylabel('Symptom coefficients', 'FontSize', 14);
hold on;    
errorbar(x1,y1,y_std1,'b','LineStyle','none');
hold on;
a(2) = bar(x2,y2,'FaceColor',[0.8 0 0]); grid on; 
ylabel('Symptom coefficients', 'FontSize', 14);
hold on;    
errorbar(x2,y2,y_std2,'b','LineStyle','none');
legend(a, string(types), 'location', 'northwest', 'FontSize', 11)
ax = gca;
ax.FontSize = 12; 


% nnmf on 2019 data
k=1;
clear temp;
for ite = 1 : Ite
    [U,W] = nnmf(Y' , k);
    s = zeros(k,1);
    for i = 1:size(U,2)
        s(i) = norm(U(:,i))* norm(W(i,:));
        U(:,i) = U(:,i)/norm(U(:,i));
    end
    [~, ind0] = sort(s, 'descend');
    Vrr = U(:, ind0(1:k));
    temp(ite, :) = (Vrr(:,1))';
end
y = mean(temp);
values(9, :) = y;
figure(5);
subplot(1,2,1);
y_std = std(temp);
x1 = x(1:3);
x2 = x(4:end);
y1 = y(1:3);
y2 = y(4:end);
y_std1 = y_std(1:3);
y_std2 = y_std(4:end);
types=categorical({'Unique COVID-19 symptoms','Shared between COVID-19 and Flu'});
types=reordercats(types,{'Unique COVID-19 symptoms','Shared between COVID-19 and Flu'});
a(1) = bar(x1,y1,'FaceColor',[0 0.8 0]); grid on; title('NNMF using 2019 data', 'FontSize', 15);
ylabel('Symptom coefficients', 'FontSize', 14);
hold on;    
errorbar(x1,y1,y_std1,'b','LineStyle','none');
hold on;
a(2) = bar(x2,y2,'FaceColor',[0.8 0 0]); grid on; 
ylabel('Symptom coefficients', 'FontSize', 14);
hold on;    
errorbar(x2,y2,y_std2,'b','LineStyle','none');
legend(a, string(types), 'location', 'northwest', 'FontSize', 11)
ax = gca;
ax.FontSize = 12; 


% pca on 2019 data
alpha=0;
clear temp;
for ite = 1 : Ite
    Us = cpca_alpha(Y, X, alpha,1);
    temp(ite, :) = (Us(:,1))';
end
y = mean(temp);
values(10, :) = y;
subplot(1,2,2);
y_std = std(temp);
x1 = x(1:3);
x2 = x(4:end);
y1 = y(1:3);
y2 = y(4:end);
y_std1 = y_std(1:3);
y_std2 = y_std(4:end);
types=categorical({'Unique COVID-19 symptoms','Shared between COVID-19 and Flu'});
types=reordercats(types,{'Unique COVID-19 symptoms','Shared between COVID-19 and Flu'});
a(1) = bar(x1,y1,'FaceColor',[0 0.8 0]); grid on; title('PCA using 2019 data', 'FontSize', 15);
ylabel('Symptom coefficients', 'FontSize', 14);
hold on;    
errorbar(x1,y1,y_std1,'b','LineStyle','none');
hold on;
a(2) = bar(x2,y2,'FaceColor',[0.8 0 0]); grid on; 
ylabel('Symptom coefficients', 'FontSize', 14);
hold on;    
errorbar(x2,y2,y_std2,'b','LineStyle','none');
legend(a, string(types), 'location', 'northwest', 'FontSize', 11)
ax = gca;
ax.FontSize = 12; 



% nnmf on 2018 data
k=1;
clear temp;
for ite = 1 : Ite
    [U,W] = nnmf(Z' , k);
    s = zeros(k,1);
    for i = 1:size(U,2)
        s(i) = norm(U(:,i))* norm(W(i,:));
        U(:,i) = U(:,i)/norm(U(:,i));
    end
    [~, ind0] = sort(s, 'descend');
    Vrr = U(:, ind0(1:k));
    temp(ite, :) = (Vrr(:,1))';
end
y = mean(temp);
values(11, :) = y;
figure(6);
subplot(1,2,1);
y_std = std(temp);
x1 = x(1:3);
x2 = x(4:end);
y1 = y(1:3);
y2 = y(4:end);
y_std1 = y_std(1:3);
y_std2 = y_std(4:end);
types=categorical({'Unique COVID-19 symptoms','Shared between COVID-19 and Flu'});
types=reordercats(types,{'Unique COVID-19 symptoms','Shared between COVID-19 and Flu'});
a(1) = bar(x1,y1,'FaceColor',[0 0.8 0]); grid on; title('NNMF using 2018 data', 'FontSize', 15);
ylabel('Symptom coefficients', 'FontSize', 14);
hold on;    
errorbar(x1,y1,y_std1,'b','LineStyle','none');
hold on;
a(2) = bar(x2,y2,'FaceColor',[0.8 0 0]); grid on; 
ylabel('Symptom coefficients', 'FontSize', 14);
hold on;    
errorbar(x2,y2,y_std2,'b','LineStyle','none');
legend(a, string(types), 'location', 'northwest', 'FontSize', 11)
ax = gca;
ax.FontSize = 12; 





% pca on 2018 data
alpha=0;
clear temp;
for ite = 1 : Ite
    Us = cpca_alpha(Z, Y, alpha,1);
    temp(ite, :) = (Us(:,1))';
end
y = mean(temp);
values(12, :) = y;
subplot(1,2,2);
y_std = std(temp);
x1 = x(1:3);
x2 = x(4:end);
y1 = y(1:3);
y2 = y(4:end);
y_std1 = y_std(1:3);
y_std2 = y_std(4:end);
types=categorical({'Unique COVID-19 symptoms','Shared between COVID-19 and Flu'});
types=reordercats(types,{'Unique COVID-19 symptoms','Shared between COVID-19 and Flu'});
a(1) = bar(x1,y1,'FaceColor',[0 0.8 0]); grid on; title('PCA using 2018 data', 'FontSize', 15);
ylabel('Symptom coefficients', 'FontSize', 14);
hold on;    
errorbar(x1,y1,y_std1,'b','LineStyle','none');
hold on;
a(2) = bar(x2,y2,'FaceColor',[0.8 0 0]); grid on; 
ylabel('Symptom coefficients', 'FontSize', 14);
hold on;    
errorbar(x2,y2,y_std2,'b','LineStyle','none');
legend(a, string(types), 'location', 'northwest', 'FontSize', 11)
ax = gca;
ax.FontSize = 12; 







%% dpca
clear temp;
for ite = 1 : Ite
    [Vrr, Xr]=nndpca(X,Y,1);
    temp(ite, :) = (Vrr(:,1))';
end
y = mean(temp);
values(13, :) = y;
figure(7);

subplot(1,2,1);
y_std = std(temp);
x1 = x(1:3);
x2 = x(4:end);
y1 = y(1:3);
y2 = y(4:end);
y_std1 = y_std(1:3);
y_std2 = y_std(4:end);

types=categorical({'Unique COVID-19 symptoms','Shared between COVID-19 and Flu'});
types=reordercats(types,{'Unique COVID-19 symptoms','Shared between COVID-19 and Flu'});
a(1) = bar(x1,y1,'FaceColor',[0 0.8 0]); grid on; title('DNA (target:2020, background:2019)', 'FontSize', 15);
ylabel('Symptom coefficients', 'FontSize', 14);
hold on;    
errorbar(x1,y1,y_std1,'b','LineStyle','none');
hold on;
a(2) = bar(x2,y2,'FaceColor',[0.8 0 0]); grid on; 
ylabel('Symptom coefficients', 'FontSize', 14);
hold on;    
errorbar(x2,y2,y_std2,'b','LineStyle','none');
legend(a, string(types), 'location', 'northeast', 'FontSize', 11)
ax = gca;
ax.FontSize = 12; 




clear temp;
for ite = 1 : Ite
    [Vrr, Xr]=nndpca(X,Z,1);
    temp(ite, :) = (Vrr(:,1))';
end
y = mean(temp);
values(14, :) = y;
subplot(1,2,2);

y_std = std(temp);
x1 = x(1:3);
x2 = x(4:end);
y1 = y(1:3);
y2 = y(4:end);
y_std17 = y_std(1:3);
y_std27 = y_std(4:end);

types=categorical({'Unique COVID-19 symptoms','Shared between COVID-19 and Flu'});
types=reordercats(types,{'Unique COVID-19 symptoms','Shared between COVID-19 and Flu'});
a(1) = bar(x1,y1,'FaceColor',[0 0.8 0]); grid on; title('DNA (target:2020, background:2018)', 'FontSize', 15);
ylabel('Symptom coefficients', 'FontSize', 14);
hold on;    
errorbar(x1,y1,y_std17,'b','LineStyle','none');
hold on;
a(2) = bar(x2,y2,'FaceColor',[0.8 0 0]); grid on; 
ylabel('Symptom coefficients', 'FontSize', 14);
hold on;    
errorbar(x2,y2,y_std27,'b','LineStyle','none');
legend(a, string(types), 'location', 'northeast', 'FontSize', 11)
ax = gca;
ax.FontSize = 12; 



clear temp;
for ite = 1 : Ite
    [Vrr, Xr]=nndpca(Y,X,1);
    temp(ite, :) = (Vrr(:,1))';
end
y = mean(temp);
values(15, :) = y;
figure(8);
subplot(1,2,1);
y_std = std(temp);
x1 = x(1:3);
x2 = x(4:end);
y1 = y(1:3);
y2 = y(4:end);
y_std171 = y_std(1:3);
y_std271 = y_std(4:end);
types=categorical({'Unique COVID-19 symptoms','Shared between COVID-19 and Flu'});
types=reordercats(types,{'Unique COVID-19 symptoms','Shared between COVID-19 and Flu'});
a(1) = bar(x1,y1,'FaceColor',[0 0.8 0]); grid on; title('DNA (target:2019, background:2020)', 'FontSize', 15);
ylabel('Symptom coefficients', 'FontSize', 14);
hold on;    
errorbar(x1,y1,y_std171,'b','LineStyle','none');
hold on;
a(2) = bar(x2,y2,'FaceColor',[0.8 0 0]); grid on; 
ylabel('Symptom coefficients', 'FontSize', 14);
hold on;    
errorbar(x2,y2,y_std271,'b','LineStyle','none');
legend(a, string(types), 'location', 'northeast', 'FontSize', 11)
ax = gca;
ax.FontSize = 12; 





clear temp;
for ite = 1 : Ite
    [Vrr, Xr]=nndpca(Y,Z,1);
    temp(ite, :) = (Vrr(:,1))';
end
y = mean(temp);
values(16, :) = y;
subplot(1,2,2);
y_std = std(temp);
x1 = x(1:3);
x2 = x(4:end);
y1 = y(1:3);
y2 = y(4:end);
y_std1 = y_std(1:3);
y_std2 = y_std(4:end);
types=categorical({'Unique COVID-19 symptoms','Shared between COVID-19 and Flu'});
types=reordercats(types,{'Unique COVID-19 symptoms','Shared between COVID-19 and Flu'});
a(1) = bar(x1,y1,'FaceColor',[0 0.8 0]); grid on; title('DNA (target:2019, background:2018)', 'FontSize', 15);
ylabel('Symptom coefficients', 'FontSize', 14);
hold on;    
errorbar(x1,y1,y_std1,'b','LineStyle','none');
hold on;
a(2) = bar(x2,y2,'FaceColor',[0.8 0 0]); grid on; 
ylabel('Symptom coefficients', 'FontSize', 14);
hold on;    
errorbar(x2,y2,y_std2,'b','LineStyle','none');
legend(a, string(types), 'location', 'northwest', 'FontSize', 11)
ax = gca;
ax.FontSize = 12; 






clear temp;
for ite = 1 : Ite
    [Vrr, Xr]=nndpca(Z,X,1);
    temp(ite, :) = (Vrr(:,1))';
end
y = mean(temp);
values(17, :) = y;
figure(9);
subplot(1,2,1);
y_std = std(temp);
x1 = x(1:3);
x2 = x(4:end);
y1 = y(1:3);
y2 = y(4:end);
y_std1 = y_std(1:3);
y_std2 = y_std(4:end);
types=categorical({'Unique COVID-19 symptoms','Shared between COVID-19 and Flu'});
types=reordercats(types,{'Unique COVID-19 symptoms','Shared between COVID-19 and Flu'});
a(1) = bar(x1,y1,'FaceColor',[0 0.8 0]); grid on; title('DNA (target:2018, background:2020)', 'FontSize', 15);
ylabel('Symptom coefficients', 'FontSize', 14);
hold on;    
errorbar(x1,y1,y_std1,'b','LineStyle','none');
hold on;
a(2) = bar(x2,y2,'FaceColor',[0.8 0 0]); grid on; 
ylabel('Symptom coefficients', 'FontSize', 14);
hold on;    
errorbar(x2,y2,y_std2,'b','LineStyle','none');
legend(a, string(types), 'location', 'northeast', 'FontSize', 11)
ax = gca;
ax.FontSize = 12; 






clear temp;
for ite = 1 : Ite
    [Vrr, Xr]=nndpca(Z,Y,1);
    temp(ite, :) = (Vrr(:,1))';
end
y = mean(temp);
values(18, :) = y;
subplot(1,2,2);
y_std = std(temp);
x1 = x(1:3);
x2 = x(4:end);
y1 = y(1:3);
y2 = y(4:end);
y_std1 = y_std(1:3);
y_std2 = y_std(4:end);
types=categorical({'Unique COVID-19 symptoms','Shared between COVID-19 and Flu'});
types=reordercats(types,{'Unique COVID-19 symptoms','Shared between COVID-19 and Flu'});
a(1) = bar(x1,y1,'FaceColor',[0 0.8 0]); grid on; title('DNA (target:2018, background:2019)', 'FontSize', 15);
ylabel('Symptom coefficients', 'FontSize', 14);
hold on;    
errorbar(x1,y1,y_std1,'b','LineStyle','none');
hold on;
a(2) = bar(x2,y2,'FaceColor',[0.8 0 0]); grid on; 
ylabel('Symptom coefficients', 'FontSize', 14);
hold on;    
errorbar(x2,y2,y_std2,'b','LineStyle','none');
legend(a, string(types), 'location', 'northwest', 'FontSize', 11)
ax = gca;
ax.FontSize = 12; 




