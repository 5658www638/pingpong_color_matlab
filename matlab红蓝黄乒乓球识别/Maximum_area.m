function [num, plot_x, plot_y, r, mask] = Maximum_area(mask, flag_exit)
    [height, width] = size(mask);
    r_x = 0;r_y = 0;r_flag = 0;
    if(flag_exit == 1)  %���ҵ�����ͨ�򣬼����������ͨ��
        mask = bwareaopen(mask, 2000);
        [L,num]=bwlabel(mask, 8);%bwlabel��ע��ֵͼ��I_bw�е�Ŀ�����壬���ر�ʶ����̺�I_bw��Ŀ�����������num������ʾ��ͨ����
        r = zeros(1, num);
        plot_x=zeros(1,num);%%zeros(m,n)����m��n��ȫ0�������ڼ�¼����λ�õĺ�����
        plot_y=zeros(1,num);%zeros(m,n)����m��n��ȫ0�������ڼ�¼����λ�õ�������
        for k=1:num  %num����������ͳ������λ��    
            sum_x=0;sum_y=0;area=0; %��ʼ��
            for i=1:height  
                for j=1:width
                    if L(i,j)==k
                        if r_flag == 0
                            r_x = i;
                            r_y = j;
                            r_flag = 1;
                        end
                        sum_x=sum_x+i;  %����ڣ�����ĺ������ܺ�
                        sum_y=sum_y+j;  %����ڣ�������������ܺ� 
                        area=area+1;    %����ڣ�������ɶ��ٸ�������ʾ
                    end
                end
            end
            plot_x(k)=fix(sum_x/area);  %����ڣ���������ĺ�����
            plot_y(k)=fix(sum_y/area);%����ڣ����������������
            r(k) = sqrt((r_x-plot_x(k))^2+(r_y-plot_y(k))^2);
            r_flag = 0;
        end
    end
end

