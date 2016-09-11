function path = ImagPath(randomNum)
    a='/media/akshit/New Volume/work/phash/ILSVRC2015_DET_test_new/ILSVRC2015/Data/DET/test/';
    % path of the data set
    b='ILSVRC2015_test_';
    % image name
    c='.jpeg';  
    % format
    path =strcat(a, b, sprintf('%08d',randomNum),c); 
    % str of the complete path