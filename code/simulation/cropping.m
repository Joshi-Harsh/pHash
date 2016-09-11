function image = cropping(image, imsize, freqCrop)

%performs cropping operation on the image 

 imsize = uint32((freqCrop*imsize)/100);	%cropping according to the cropping size
 image = imresize(image, [imsize, imsize]);	%resizing
 
 