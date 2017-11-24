%We use caring datas here as an example
load carbig
X = [Acceleration,Displacement,Weight,Horsepower];
varNames = { 'Acceleration'; 'Displacement'; 'Weight'; 'Horsepower'};


%We are only using the data from cars with cylinder number:4, 6 and 8
Cyl468 = ismember(Cylinders,[4 6 8]);

%Original data grouped according their number of cylinders
parallelcoords(X(Cyl468,:),  'group', Cylinders(Cyl468), ...
               'standardize','on', 'labels',varNames)

Y= X(Cyl468,:);  

%Perform K means clustering, with K=3
K = 3;
[G,C] = kmeans(Y, K, 'distance','sqEuclidean', 'start','sample');

% Plot the clustered data.
figure;
parallelcoords(X(Cyl468,:), 'group', G, ...
               'standardize','on', 'labels',varNames)
           
% andrewsplot(X(Cyl468,:), 'group',G, 'standardize','on')
%andrewsplot can also be used if you like
