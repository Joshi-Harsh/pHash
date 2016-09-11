function [hashMatrix, hashSize] =hashing(image, filterSize)

%Required Variables image and filter size for Hashing

    imDCT=dct2(image);
    [imrow,imcolumn]=size(imDCT);					% size of the DCT matrix
    hashSize=uint32((imcolumn)*(filterSize/100));
    imfiltered=imDCT(1:hashSize,1:hashSize,1);		%Resizing the DCT matrix according to the Filtersize
    imMedian=median(imfiltered(:));					%Finding the median of the filtered matrix
    hashMatrix=imfiltered>=imMedian;				%hash Matrix formed
    