function [image,imsize]= preprocess(image)	
%preprocessing
[imrow,imcolumn]=size(image);		%finding the size of matrix
if(imrow>=imcolumn)
            imsize=uint32(imcolumn);
else
            imsize=uint32(imrow);
end
image = imresize(image, [imsize, imsize]);
%Resizing according to the smaller side to avoid interpolation and getting a Symmetric image
dim = ndims(image);
%finding the Dimenstion of the image
if(dim>2)
    image=rgb2gray(image);			%Converting image into grayscale if RGB
end