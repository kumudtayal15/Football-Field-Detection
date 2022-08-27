folder='White_mask';
files=dir(fullfile(folder));
images_points=[];

filename = 'White_mask\L_input.png';
I=imread(filename);
BW = edge(rgb2gray(I));
binary=rgb2gray(I);
binary=imbinarize(binary);
se=strel("rectangle",[10 10]);
J=imdilate(binary,se);
BW=binary;
start_angle = -60;
end_angle = 25;
theta_resolution = 0.01;
[hou,theta,rho] = hough(BW, 'Theta', start_angle:theta_resolution:end_angle);
peaks = houghpeaks(hou,3,'threshold',ceil(0.3*max(hou(:))));
lines = houghlines(BW,theta,rho,peaks,'FillGap',5,'MinLength',100);
min_row = lines(1).point1(2);
xy_long = [lines(1).point1; lines(1).point2];
% figure, imshow(I), hold on
max_len = 0;
lines_table=struct2table(lines);
points=lines_table.point1;
points=[points;lines_table.point2];
sorted_dec=sortrows(points,2,'descend');
sorted_inc=sortrows(points,2,'ascend');
% plot(sorted_dec(1,1),sorted_dec(1,2),'x','LineWidth',2,'Color','yellow');
% plot(sorted_inc(1,1),sorted_inc(1,2),'x','LineWidth',2,'Color','red');
images_points = [images_points;sorted_inc(1,1) sorted_inc(1,2)];
images_points =[images_points;sorted_dec(1,1) sorted_dec(1,2)];

%     for k = 1:1
%         xy = [lines(k).point1; lines(k).point2];
% %         plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');
% 
%         % Plot beginnings and ends of lines
%         plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
%         plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');
% 
%         % Determine the endpoints of the longest line segment
%         len = norm(lines(k).point1 - lines(k).point2);
%         if ( len > max_len)
%             max_len = len;
%             xy_long = xy;
%         end
%     end
%     hold off
% ax=gcf;
%     exportgraphics(ax,strcat("Lines/",files(yo).name));
writematrix(images_points,"CSV\points.csv")



