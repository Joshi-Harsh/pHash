function Timage = skew(Timage, skewness) 
tform = maketform('affine',[1 0 0; double(skewness/100) 1 0; 0 0 1]);
%skewing the image according to the skewness variable
Timage = imtransform(Timage,tform);
Timage = preprocess(Timage);
%preprocessing the image to get back the symmetric image
