% coord = csvread("CSV\playerLocation.csv",1,1);
% inp = transpose([coord(:,1) coord(:,2)+coord(:,4)]);
% inp = [inp;ones(1,size(inp,2));ones(1,size(inp,2))];
% 
% 
% cl = csvread("CSV\centreCoordinates.csv");
% po = csvread("CSV\points.csv");
% 
% X = [[cl(1) cl(1)+ cl(3) cl(1)  cl(1)+cl(3) po(1,1) po(2,1)];[cl(2) cl(2) cl(2) + cl(4) cl(2) + cl(4) po(1,2) po(2,2)];[1 1 1 1 1 1];[1 1 1 1 1 1]];
% 
% 
% team = csvread("CSV\teams.csv");
% 
% A = imread('input\input.png');
% % A = padarray(A,[400 400]); 
% % % A = imresize(A,[700 700]);
% dimen = size(A);
% figure;
% imshow(A);
% hp = impixelinfo;
% set(hp,"Position",[5 1 300 20]);
% % 
% B = imread('dataset\trial2.jpg');
% % B = rgb2gray(B);
% B = imresize(B,[3000 6000]);
% % 
% % % saveas(Fig,'zones.png');
% % 
% % % X = [[875 1580 875 1580 1280 1110] [700 700 950 950 605 1440] [1 1 1 1 1 1]] 5.png padded
% % 
% % % X = [[760 1455 760 1455 1200 900] [755 755 940 940 600 1430] [1 1 1 1 1 1]] %6.jpeg padded
% % X = [[760 1455 760 1455 ] [755 755 940 940 ] [1 1 1 1 ]] %6.jpeg padded
% % % X = [[480 1185 480 1185] [347 347 547 547] [1 1 1 1]]; %5.png original
% % X = transpose(reshape(X,[4 3]))
% I = pinv(X);
% 
% Y = [[2285 3700 2300 3700 3000 3000] [1030 1030 2040 2040 35 2970] [1 1 1 1 1 1] [1 1 1 1 1 1]] %Pre defined 3000*6000
% % Y = [[2285 3750 2285 3750] [950 950 2040 2040] [1 1 1 1]] %Pre defined 3000*6000
% Y = transpose(reshape(Y,[6 4]));
% F = Y*I;
% 
% X_N = F*X;
% figure;
% imshow(A);
% 
% hold on;
% plot(inp(1,:), inp(2,:), 'r*', 'LineWidth', 2, 'MarkerSize', 15);
% 
% out = F*inp;
% out = int32(out);
% % figure;
% % imshow(B);
% % hold on;
% 
% Fig =figure;
% imshow(B);
% hp = impixelinfo;
% set(hp,"Position",[5 1 300 20]);
% 
% [r,c,d]=size(B);
% 
% n_r = 3;
% n_c = 6;
% 
% s_r = r/n_r;
% s_c = c/n_c;
% 
% hold on;
% % plot([0,6000],[1000,1000],'Color','r','LineWidth',2);
% y = 0;
% while y < r
%     plot([0,6000],[y,y],'LineStyle','--','Color','y','LineWidth',2);
%     y = y + s_r;
% end
% x = 0;
% while x < c
%     plot([x,x],[0,r],'LineStyle','--','Color','y','LineWidth',2);
%     x = x + s_c;
% end
% 
% 
% for i= 1:size(out,2)
%     if team(i)==1
%         plot(out(1,i), out(2,i), '.', 'MarkerSize', 50,'Color','b');
%     else
%         plot(out(1,i), out(2,i), '.', 'MarkerSize', 50,'Color','r');
%     end
% end
% saveas(Fig,"Output\Topview.png");
% 
% grid = zeros(3,6);
% for i = 1: size(out,2)
%     x_c = out(1,i);
%     y_c = out(2,i);
%     col_num_d = int(floorDiv(x_c,s_c));
%     row_num_d = int(floorDiv(y_c,s_r));
%     col_num = floor(col_num_d) + 1;
%     row_num = floor(row_num_d) + 1 ;
%     if row_num<4 && col_num<7
%         grid(row_num,col_num) = grid(row_num,col_num) + 1;
%     end
% end
% 
% Fig = figure;
% b = bar([1:18],g);
% saveas(Fig,"Output\graph.png")
% 

%===============================================================================

% cl = csvread("CSV/centreCoordinates.csv");
% po = csvread("CSV/points.csv");
% 
% coord = csvread("CSV/playerLocation.csv",1,1);
% temp = [];
% for i=1:size(coord,1)
%     if(coord(i,2) + coord(i,4) > po(1,2) && coord(i,2) + coord(i,4) < po(2,2))
%         temp = [temp; coord(i,:)];
%     end
% end
% 
% coord = temp;
% 
% inp = transpose([coord(:,1) coord(:,2)+coord(:,4)]);
% inp = [inp;ones(1,size(inp,2));ones(1,size(inp,2))];
% 
% 
% 
% 
% X = [[cl(1) cl(1)+ cl(3) cl(1)  cl(1)+cl(3) po(1,1) po(2,1)];[cl(2) cl(2) cl(2) + cl(4) cl(2) + cl(4) po(1,2) po(2,2)];[1 1 1 1 1 1];[1 1 1 1 1 1]];
% 
% 
% team = csvread("CSV/teams.csv");
% 
% A = imread('Input/input.png');
% % A = padarray(A,[400 400]); 
% % % A = imresize(A,[700 700]);
% dimen = size(A);
% figure;
% imshow(A);
% hp = impixelinfo;
% set(hp,"Position",[5 1 300 20]);
% % 
% B = imread('dataset/trial2.jpg');
% % B = rgb2gray(B);
% B = imresize(B,[3000 6000]);
% % 
% % % saveas(Fig,'zones.png');
% % 
% % % X = [[875 1580 875 1580 1280 1110] [700 700 950 950 605 1440] [1 1 1 1 1 1]] 5.png padded
% % 
% % % X = [[760 1455 760 1455 1200 900] [755 755 940 940 600 1430] [1 1 1 1 1 1]] %6.jpeg padded
% % X = [[760 1455 760 1455 ] [755 755 940 940 ] [1 1 1 1 ]] %6.jpeg padded
% % % X = [[480 1185 480 1185] [347 347 547 547] [1 1 1 1]]; %5.png original
% % X = transpose(reshape(X,[4 3]))
% I = pinv(X);
% 
% Y = [[2285 3700 2300 3700 3000 3000] [1030 1030 2040 2040 35 2970] [1 1 1 1 1 1] [1 1 1 1 1 1]] %Pre defined 3000*6000
% % Y = [[2285 3750 2285 3750] [950 950 2040 2040] [1 1 1 1]] %Pre defined 3000*6000
% Y = transpose(reshape(Y,[6 4]));
% F = Y*I;
% 
% X_N = F*X;
% figure;
% imshow(A);
% 
% hold on;
% plot(inp(1,:), inp(2,:), 'r*', 'LineWidth', 2, 'MarkerSize', 15);
% 
% out = F*inp;
% out = int32(out);
% % figure;
% % imshow(B);
% % hold on;
% 
% Fig =figure;
% imshow(B);
% hp = impixelinfo;
% set(hp,"Position",[5 1 300 20]);
% 
% [r,c,d]=size(B);
% 
% n_r = 3;
% n_c = 6;
% 
% s_r = r/n_r;
% s_c = c/n_c;
% 
% hold on;
% % plot([0,6000],[1000,1000],'Color','r','LineWidth',2);
% y = 0;
% while y < r
%     plot([0,6000],[y,y],'LineStyle','--','Color','y','LineWidth',2);
%     y = y + s_r;
% end
% x = 0;
% while x < c
%     plot([x,x],[0,r],'LineStyle','--','Color','y','LineWidth',2);
%     x = x + s_c;
% end
% 
% 
% for i= 1:size(out,2)
%     if team(i)==1
%         plot(out(1,i), out(2,i), '.', 'MarkerSize', 50,'Color','b');
%     else
%         plot(out(1,i), out(2,i), '.', 'MarkerSize', 50,'Color','r');
%     end
% end
% 
% 
% grid = zeros(3,6);
% for i = 1: size(out,2)
%     x_c = out(1,i);
%     y_c = out(2,i);
%     col_num_d = int(floorDiv(x_c,s_c));
%     row_num_d = int(floorDiv(y_c,s_r));
%     col_num = floor(col_num_d) + 1;
%     row_num = floor(row_num_d) + 1 ;
%     if 0<row_num<4 && 0<col_num<7
%         grid(row_num,col_num) = grid(row_num,col_num) + 1;
%     end
% end

%===========================================================================

cl = csvread("CSV/centreCoordinates.csv");
po = csvread("CSV/points.csv");
team = csvread("CSV/teams.csv");

coord = csvread("CSV/playerLocation.csv",1,1);
temp = [];
teamFinal = [];
for i=1:size(coord,1)
    if(coord(i,2) + coord(i,4) > po(1,2) && coord(i,2) + coord(i,4) < po(2,2))
        temp = [temp; coord(i,:)];
        teamFinal = [teamFinal; team(i,:)];
    end
end

coord = temp;
team = teamFinal;

inp = transpose([coord(:,1) coord(:,2)+coord(:,4)]);
inp = [inp;ones(1,size(inp,2));ones(1,size(inp,2))];




X = [[cl(1) cl(1)+ cl(3) cl(1)  cl(1)+cl(3) po(1,1) po(2,1)];[cl(2) cl(2) cl(2) + cl(4) cl(2) + cl(4) po(1,2) po(2,2)];[1 1 1 1 1 1];[1 1 1 1 1 1]];

A = imread('Input/input.png');
% A = padarray(A,[400 400]); 
% % A = imresize(A,[700 700]);
dimen = size(A);
figure;
imshow(A);
hp = impixelinfo;
set(hp,"Position",[5 1 300 20]);
% 
B = imread('dataset/trial2.jpg');
% B = rgb2gray(B);
B = imresize(B,[3000 6000]);
% 
% % saveas(Fig,'zones.png');
% 
% % X = [[875 1580 875 1580 1280 1110] [700 700 950 950 605 1440] [1 1 1 1 1 1]] 5.png padded
% 
% % X = [[760 1455 760 1455 1200 900] [755 755 940 940 600 1430] [1 1 1 1 1 1]] %6.jpeg padded
% X = [[760 1455 760 1455 ] [755 755 940 940 ] [1 1 1 1 ]] %6.jpeg padded
% % X = [[480 1185 480 1185] [347 347 547 547] [1 1 1 1]]; %5.png original
% X = transpose(reshape(X,[4 3]))
I = pinv(X);

Y = [[2285 3700 2300 3700 3000 3000] [1030 1030 2040 2040 35 2970] [1 1 1 1 1 1] [1 1 1 1 1 1]]; %Pre defined 3000*6000
% Y = [[2285 3750 2285 3750] [950 950 2040 2040] [1 1 1 1]] %Pre defined 3000*6000
Y = transpose(reshape(Y,[6 4]));
F = Y*I;

X_N = F*X;
figure;
imshow(A);

hold on;
plot(inp(1,:), inp(2,:), 'r*', 'LineWidth', 2, 'MarkerSize', 15);

out = F*inp;
out = int32(out);
% figure;
% imshow(B);
% hold on;

Fig =figure;
imshow(B);
hp = impixelinfo;
set(hp,"Position",[5 1 300 20]);

[r,c,d]=size(B);

n_r = 3;
n_c = 6;

s_r = r/n_r;
s_c = c/n_c;

hold on;
% plot([0,6000],[1000,1000],'Color','r','LineWidth',2);
y = 0;
while y < r
    plot([0,6000],[y,y],'LineStyle','--','Color','y','LineWidth',2);
    y = y + s_r;
end
x = 0;
while x < c
    plot([x,x],[0,r],'LineStyle','--','Color','y','LineWidth',2);
    x = x + s_c;
end


for i= 1:size(out,2)
    if team(i)==1
        plot(out(1,i), out(2,i), '.', 'MarkerSize', 50,'Color','b');
    else
        plot(out(1,i), out(2,i), '.', 'MarkerSize', 50,'Color','r');
    end
end
saveas(Fig,"Output\Topview.png");

grid = zeros(3,6);
for i = 1: size(out,2)
    x_c = out(1,i);
    y_c = out(2,i);
    col_num_d = int(floorDiv(x_c,s_c));
    row_num_d = int(floorDiv(y_c,s_r));
    col_num = floor(col_num_d) + 1;
    row_num = floor(row_num_d) + 1 ;
    if row_num<4 && col_num<7
        grid(row_num,col_num) = grid(row_num,col_num) + 1;
    end
end

Fig = figure;
g = reshape(grid,[1,18]);
b = bar([1:18],g);
saveas(Fig,"Output\graph.png")