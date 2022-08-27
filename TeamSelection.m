inPath = 'YOLO_Players/';
imgData = dir([inPath '*.jpeg']);

team = [];
for i=1:numel(imgData)
    A = uint8(imread(strcat(inPath,imgData(i).name)));
    for j=1:size(A,1)
        for k=1:size(A,2)
            if(A(j,k,1) == 0 || A(j,k,2) == 0 || A(j,k,3) == 0)
                A(j,k,1) = 255;
                A(j,k,2) = 255;
                A(j,k,3) = 255;
            end
        end
    end
    redChannel = A(:,:,1);
    greenChannel = A(:,:,2);
    blueChannel = A(:,:,3);
    a = mean(redChannel(redChannel < 255),"all");
    b = mean(greenChannel(greenChannel < 255),"all");
    c = mean(blueChannel(blueChannel < 255),"all");
    temp = [a b c];
    team = [team; temp];
end
[centers,U] = fcm(team,2,[NaN NaN NaN false]);
maxU = max(U);
index1 = find(U(1,:) == maxU);
index2 = find(U(2,:) == maxU);

result = zeros(size(team,1),1);
for i=1:size(index1,2)
    index = index1(1,i);
    result(index,1) = 1;
end
for i=1:size(index2,2)
    index = index2(1,i);
    result(index,1) = 2;
end
finale = [];
for i=1:size(result,1)
    alpha = [string(imgData(i).name) result(i,1)];
    finale = [finale; alpha];
end
f = finale(:,2);
fi = ones(size(f));
for i =1:size(f)
    fi(i) = str2num(f(i));
end
csvwrite("CSV\teams.csv",fi);
% plot(team(index1,1),team(index1,2),'ob')
% hold on
% plot(team(index2,1),team(index2,2),'or')
% plot(centers(1,1),centers(1,2),'xb','MarkerSize',15,'LineWidth',3)
% plot(centers(2,1),centers(2,2),'xr','MarkerSize',15,'LineWidth',3)
% hold off
