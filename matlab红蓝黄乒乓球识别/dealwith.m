function [num, plot_x, plot_y, r, mask] = dealwith(Image_hsv, redlower, redupper)
    flag_exit = 0;      %���ڼ���Ƿ��ж�Ӧ��ɫ�����ص㣬�����������ͨ��ʱ�ԱȾ���һ��
    redlower = double(redlower)/255;        %��Ҫ��uint8����תΪdouble
    redupper = double(redupper)/255;        %��Ҫ��uint8����תΪdouble
    [m, n, o]=size(Image_hsv);                        %Get the size of the grayscale image 
    mask = zeros(m,n);                              %������Ĥ�վ���
    
    %   ��ͼƬ���б�������ĳ���ص���ϸ����ط�Χ����õ�����Ϊ255����һ��Ϊ1��
    %   ����Ϊ0
    for f_i = 1: m
        for f_j = 1: n
            if ((Image_hsv(f_i, f_j, 1)>=redlower(1)) && (Image_hsv(f_i, f_j, 1)<=redupper(1)) &&....
                (Image_hsv(f_i, f_j, 2)>=redlower(2)) && (Image_hsv(f_i, f_j, 2)<=redupper(2))&&....
                (Image_hsv(f_i, f_j, 3)>=redlower(3)) && (Image_hsv(f_i, f_j, 3)<=redupper(3)))     
                flag_exit = 1;                      %�����ҵ�һ����ͨ��  
                mask(f_i, f_j) = 1;             %�������ط�Χ������Ϊ1
            else
                mask(f_i, f_j) = 0;             %���������ط�Χ������Ϊ0
            end
        end
    end
    [num, plot_x, plot_y, r, mask]= Maximum_area(mask, flag_exit);        %��������
end

