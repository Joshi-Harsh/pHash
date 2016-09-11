function hammingDist=hamming(hashMatrix,hashMatrixM,hashSize)   

%Required Variables 2 hash matrices and hash size

    hammingDist= num2str(hashMatrix(:)'); 
    %Converting the 2D matrix to 1D vector for hash
    hammingDistM = num2str(hashMatrixM(:)');
    hammingDist =double(sum(hammingDist~=hammingDistM))/(double(hashSize*hashSize)); 
    %finding the Hamming Distance

