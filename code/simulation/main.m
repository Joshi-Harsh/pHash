%main
HammingDistance = zeros(406, 13168);    %Declaration of hamming Distance Matrix
CosineSimilarity = zeros(406, 13168);   %Declaration of Cosine Similarity Matrix
randomNum=randperm(11142,410);          % 1D matrix of Random Number ranging from 1 to 11142

for imageNumber = 6:406                   % Loop for 400 images
    columnNumber=2;                     %Column
    path=ImagPath(randomNum(imageNumber));
    % imagPath function to get the path of the image

    HammingDistance(imageNumber, 1) = randomNum(imageNumber);   %Labelling the Hamming Distance Matrix
    CosineSimilarity(imageNumber, 1) = randomNum(imageNumber);  %Labelling the Cosine Similarity Matrix
    image=imread(path);                                         %Reading the image
    [image,imsize]=preprocess(image);                           % preprocessing on the image before any Computation
    disp(imageNumber-5);
    
    for freqCrop = 10:5:50                                      %frequency Cropping Loop
        image = cropping(image, imsize, freqCrop);
        
        for filterSize = 10:5:100                               %filter Size Loop
            [hashMatrix, hashSize] = hashing(image, filterSize);
            
            for noise = 0.0:0.1:1                                       %Noise Variation Loop
                imageM = imnoise(image, 'gaussian', noise);             %adding Noise
                [hashMatrixM, hashSize] = hashing(imageM, filterSize);  %finding the hash
                skewness = 0;                                           %declaring the Skew
                rotation = 0;                                           %declaring the rotation
                [HammingDistance, CosineSimilarity] = writeData(columnNumber, freqCrop, filterSize, noise, skewness, rotation, HammingDistance ,CosineSimilarity,flag);
                %Labelling the Matrix
                HammingDistance(imageNumber, columnNumber) = hamming(hashMatrix, hashMatrixM, hashSize);
                %Finding Hamming Distance
                CosineSimilarity(imageNumber, columnNumber) = cosSimilarity(hashMatrix, hashMatrixM);
                %Finding Cosine Similarity
                columnNumber= columnNumber+1;
                %incrementing the Column by 1

                for skewness = 20:20:80                                         
                % Skewness Loop
                    flag = 0;
                    imageSkew = skew(imageM, skewness);                         
                    %Adding skewness to the noisy image
                    [hashMatrixM, hashSize]= hashing(imageSkew, filterSize);   
                    %Hashing thr skew + noisy image
                    HammingDistance(imageNumber, columnNumber) = hamming(hashMatrix, hashMatrixM, hashSize);
                    %finding the Hamming Distance
                    CosineSimilarity(imageNumber, columnNumber) = cosSimilarity(hashMatrix, hashMatrixM);
                    %finding the Cosine Similarity
                    [HammingDistance, CosineSimilarity] = writeData(columnNumber, freqCrop, filterSize, noise, skewness, rotation, HammingDistance ,CosineSimilarity, flag);
                    columnNumber = columnNumber+1;
                    %incrementing the Column by 1
                    disp(imageNumber-5);
                    debugVariable = (columnNumber)/13168
                    
                end
                for rotation = 90:90:180 
                %Loop for vertical and Horizontal flip
                    flag = 1;
                    imageRotate = imrotate(imageM, rotation);
                    %Rotating
                    [hashMatrixM, hashSize] = hashing(imageRotate, filterSize);
                    %Finding the hash
                    [HammingDistance, CosineSimilarity] = writeData(columnNumber, freqCrop, filterSize, noise, skewness, rotation, HammingDistance ,CosineSimilarity, flag);
                    HammingDistance(imageNumber, columnNumber) = hamming(hashMatrix, hashMatrixM, hashSize);
                    %finding the hamming Distance
                    CosineSimilarity(imageNumber, columnNumber) = cosSimilarity(hashMatrix, hashMatrixM);
                    %finding hr cosine Similarity
                    columnNumber = columnNumber+1;
                    %incrementing Column by 1
                    disp(imageNumber-5);
                    debugVariable = (columnNumber)/13168
                    
                end
            end
        end
    end
end
xlswrite('data.xlsx',HammingDistance,'Hamming_Distance');   %Writing HammingDistance to the Excel Sheet
xlswrite('data.xlsx',CosineSimilarity,'Cosine_Similarity'); %Writing CosineSimilarity to the Excel Sheet
