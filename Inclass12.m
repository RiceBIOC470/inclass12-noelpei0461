%Inclass 12. 

% Continue with the set of images you used for inclass 11, the same time 
% point (t = 30)

% 1. Use the channel that marks the cell nuclei. Produce an appropriately
% smoothed image with the background subtracted. 
rad=10;
sigma=3;
fgauss=fspecial('gaussian',rad,sigma);

imgsmooth=imfilter(img1,fgauss);
imshow(imgsmooth,[500,5000]);

imgbg=imopen(imgsmooth,strel('disk',100));
imgsm_bg=imsubtract(imgsmooth,imgbg);

imshow(imgsm_bg,[0,4500])
% 2. threshold this image to get a mask that marks the cell nuclei. 
img_m=img1 > 800;
img_m=img1 > 900;
img_m=img1 > 1000;
img_m=img1 > 1100;
% 3. Use any morphological operations you like to improve this mask (i.e.
% no holes in nuclei, no tiny fragments etc.)
img_close=imclose(imgsm_bg,strel('disk',5));


% 4. Use the mask together with the images to find the mean intensity for
% each cell nucleus in each of the two channels. Make a plot where each data point 
% represents one nucleus and these two values are plotted against each other
