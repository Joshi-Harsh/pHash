function [HammingDistance, CosineSimilarity] = writeData(col, freqCrop, filterSize, noise, skewness, rotation, HammingDistance ,CosineSimilarity, flag)
%labelling the data according to the loop
HammingDistance(1, col) = freqCrop; 
HammingDistance(2, col) = filterSize;
HammingDistance(3, col) = noise;
CosineSimilarity(1, col) = freqCrop;
CosineSimilarity(2, col) = filterSize;
CosineSimilarity(3, col) = noise;

if (flag == 0)
    HammingDistance(4, col) = skewness;
    CosineSimilarity(4, col) = skewness;
else
    HammingDistance(4, col) = rotation;
    CosineSimilarity(4, col) = rotation;
end