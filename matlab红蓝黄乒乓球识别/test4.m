obj = VideoReader('pingpong3.mp4');     % ��Ӷ�Ӧ����Ƶ�ļ���Ҳ���Ը�Ϊ����ͷ

num = obj.NumberOfFrames;   % ��ȡ��Ƶ֡
color_flag = 1;
lower = zeros(1, 3);
upper = zeros(1, 3);

redlower = [185, 50, 0];    % ������ɫ��ֵ
redupper = [255, 255, 255];
bluelower = [130, 100, 20];
blueupper = [150, 255, 255];
yellolower = [5, 190, 80];
yelloupper = [50, 255, 255];

position_x = [];    % ���ڴ洢ʶ���������������X��Ŀ�����
position_y = [];    % ���ڴ洢ʶ���������������Y��Ŀ�����
pr = 1;

for i = 1: num
    frame = read(obj, i);   %��ȡ�ڼ�֡
    mask = rgb2hsv(frame);  % ͼ���RGB�ռ�תHSV
    [number_r, plot_x_r, plot_y_r, r_r, mask_r] = dealwith(mask, redlower, redupper);   %   ��ͼ��ֱ�ȡ������ֵ��Ĥ�Ի�����ֲ�ͬ��ɫ��ʶ��Ч��
    [number_b, plot_x_b, plot_y_b, r_b, mask_b] = dealwith(mask, bluelower, blueupper);
    [number_y, plot_x_y, plot_y_y, r_y, mask_y] = dealwith(mask, yellolower, yelloupper);
    figure(2);
    imshow(frame);% ��ʾ֡
    for j=1:number_r  % ��ɫ����              
        hold  on
        plot(plot_y_r(j) ,plot_x_r(j), '*')
        num_color = ['red', num2str(j)];
        text(plot_y_r(j),plot_x_r(j),num_color,'horiz','center','color','k','FontSize',20); % д��С���λ��
        
        theta = 0:2*pi/3600:2*pi;                   % �ɰ뾶������������㲢����Բ������
        Circle1 = plot_y_r(j) + r_r(j)*cos(theta);  % �ɰ뾶������������㲢����Բ������
        Circle2 = plot_x_r(j) + r_r(j)*sin(theta);  % �ɰ뾶������������㲢����Բ������
        plot(Circle1,Circle2,'--k')
%         if rem(i, 1) == 0
%             position_x(pr) = plot_x_r(1);
%             position_y(pr) = plot_y_r(1);
%             pr = pr+1;
%         end
    end
    for j=1:number_b
        hold  on
        plot(plot_y_b(j) ,plot_x_b(j), '*')
        num_color = ['blue', num2str(j)];
        text(plot_y_b(j),plot_x_b(j),num_color,'horiz','center','color','k','FontSize',20);
        theta = 0:2*pi/3600:2*pi;
        Circle1 = plot_y_b(j) + r_b(j)*cos(theta);
        Circle2 = plot_x_b(j) + r_b(j)*sin(theta);
        plot(Circle1,Circle2,'--k')
%         if rem(i, 1) == 0
%             position_x(pr) = plot_x_r(1);
%             position_y(pr) = plot_y_r(1);
%             pr = pr+1;
%         end
    end
    for j=1:number_y
        hold  on
        plot(plot_y_y(j) ,plot_x_y(j), '*')
        num_color = ['yellow', num2str(j)];
        text(plot_y_y(j),plot_x_y(j),num_color,'horiz','center','color','k','FontSize',20);
        theta = 0:2*pi/3600:2*pi;
        Circle1 = plot_y_y(j) + r_y(j)*cos(theta);
        Circle2 = plot_x_y(j) + r_y(j)*sin(theta);
        plot(Circle1,Circle2,'--k')
        if rem(i, 1) == 0
            position_x(pr) = plot_x_y(1);
            position_y(pr) = plot_y_y(1);
            pr = pr+1;
        end
    end
    
    for pp = 2: pr
        plot(position_y(pp-1) ,position_x(pp-1), '*')
    end
    
    text(1100, 20, 'Positions: ','horiz','center','color','k','FontSize',15);
    text(1105, 40, ['Red:R1:(',num2str(plot_x_r(1)),', ',num2str(plot_y_r(1)),')'] ,'horiz','center','color','k','FontSize',15);
    text(1105, 60, ['Red:R2:(',num2str(plot_x_r(2)),', ',num2str(plot_y_r(2)),')'],'horiz','center','color','k','FontSize',15);
    text(1105, 80, ['Blue:B1:(',num2str(plot_x_b(1)),', ',num2str(plot_y_b(1)),')'],'horiz','center','color','k','FontSize',15);
    text(1105, 100,['Blue:B2:(',num2str(plot_x_b(2)),', ',num2str(plot_y_b(2)),')'],'horiz','center','color','k','FontSize',15);
    text(1105, 120,['Yellow:Y1:(',num2str(plot_x_y(1)),', ',num2str(plot_y_y(1)),')'],'horiz','center','color','k','FontSize',15);
    text(1105, 140,['Yellow:Y2:(',num2str(plot_x_y(2)),', ',num2str(plot_y_y(2)),')'],'horiz','center','color','k','FontSize',15);
    text(1105, 160,['Total: ',num2str(number_r+number_b+number_y)],'horiz','center','color','k','FontSize',15);
end

