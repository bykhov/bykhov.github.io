clearvars
close all

%% Prepare image
% peppers.png
% street1.jpg

% load image
im=imread('peppers.png');

% convert to gray-scale and fix size
im2=rgb2gray(im(1:fix(size(im,1)/8)*8,1:fix(size(im,2)/8)*8,:));    

%convert to double and normalize to [0,1]
img = double(im2)/1.;
clear im2

figure(1)
subplot(121)
imagesc(img);colormap gray; axis image
title('Original')

%% PCA for image compression
% convert to 8x8 blocks, each block is converted to 64 column
x = im2col(img,[8 8],'distinct')'; 

[coeff,score,latent,~,explained,mu] = pca(x,"Algorithm","svd");

% compression: drop columns, dr - number of zeroed columns
dr = 50; 
disp(['The number of numerical columns is ' num2str(64-dr) '.'])

% score, the numbers in the new coordinate system
y = score;
y(:,end-dr+1:end) = zeros(size(y,1),dr);

%% Restore
% multiply by rotation matrix (going back to the original coordinate system)
% and add mu back
x2 = y*coeff' + mu;

figure(1)
subplot(122)
imagesc(col2im(x2',[8 8],[fix(size(im,1)/8)*8 fix(size(im,2)/8)*8],'distinct'));colormap gray; axis image
title(['Compressed (explained ' num2str(sum(explained(1:(64-dr)))) '%)'])