function CosS=cosSimilarity(hashMatrix,hashMatrixM)

%Takes 2 hash matrices and returns cosine similarity between the two

            hashMatrix=double(hashMatrix(:));			% Type Casting the hashMatrix
            hashMatrixM=double(hashMatrixM(:));
            DP=dot(hashMatrix,hashMatrixM);				% Dot Product of the two matrix  
            hashMatrixNorm=norm(hashMatrix);
            hashMatrixMNorm=norm(hashMatrixM);			% Euclidean norm of hashMatrix
            MAG=hashMatrixNorm*hashMatrixMNorm;
            CosS=(DP/MAG);								%Calculating the Cosine Similarity