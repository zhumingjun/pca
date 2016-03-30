function [lowData,reconMat] = PCA(data,K)
[row,col]=size(data);
meanValue=mean(data);
normData=data-repmat(meanValue,[row,1]);
covMat=cov(normData(:,1),normData(:,2));
[eigVect,eigVal]=eig(covMat);
[sortMat,sortIX]=sort(eigVal,'descend');
[B,IX]=sort(sortMat(1,:),'descend');
len=min(K,length(IX));
eigVect(:,IX(1:1:len));
lowData=normData * eigVect(:,IX(1:1:len));
reconMat=(lowData * eigVect(:,IX(1:1:len))')+repmat(meanValue,[row,1]);
end

