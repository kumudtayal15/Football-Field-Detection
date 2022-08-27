I = imread("White_mask\input.png");
gray = rgb2gray(I);
edges=edge(gray,'canny');
check = edge(gray,"sobel","vertical");
check = bwareaopen(check,50); % 
se = strel("disk",4);
check = imdilate(check,se);
bw = bwareaopen(edges,250);

binary2 = check;
CC = bwconncomp(binary2);
numPixels = cellfun(@numel,CC.PixelIdxList);
[biggest,idx] = max(numPixels);
binary2(CC.PixelIdxList{idx}) = 0;
final_img=zeros(size(binary2));
final_img(CC.PixelIdxList{idx}) = 255;
final_img=logical(final_img);

alpha = bw - final_img;
alpha(alpha==-1) = 0;
alpha = logical(alpha);

se_final = strel("disk",60);
check = imclose(alpha,se_final);

stats = regionprops('table',check,'BoundingBox');
[~,index] = max(stats.BoundingBox(:,4));
% imshow(check)
% hold on 
%  rectangle('Position',[stats.BoundingBox(index,1),stats.BoundingBox(index,2),stats.BoundingBox(index,3),stats.BoundingBox(index,4)],...
% 'EdgeColor','r','LineWidth',2 )
% hold off
coordinates = stats.BoundingBox(index,:);
writematrix(coordinates, "CSV\centreCoordinates.csv");