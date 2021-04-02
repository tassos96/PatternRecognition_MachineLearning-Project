%Name: Anastasios Antonopoulos
%A.M:  1115201400014

%Clear console
clear; clc; close all;

%Open data file wdbc to read and create x matrix
fh = fopen('wdbc.data','r');

%Load and Normalise data with normalize_data function
x = normalize_data(fh);
x = transpose(x);

%Open data file wdbc to read and create Y matrix
fh = fopen('wdbc.data','r');

%Create targets matrix with return_targets function
t = return_targets(fh);

%Save X and T matrixes to a dataset file
save('datasets.mat', 'x', 't');
