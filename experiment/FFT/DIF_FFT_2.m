function [Xk]=DIF_FFT_2(xn,N);

%蝶形运算开始

M=log2(N);%“级”的数量

for m=0:M-1 %“级”循环开始

Num_of_Group=2^m;%每一级中组的个数

Interval_of_Group=N/2^m;%每一级中组与组之间的间距

Interval_of_Unit=N/2^(m+1);%每一组中相关运算单元之间的间距

Cycle_Count=N/2^(m+1)-1;%每一组内的循环次数

Wn=exp(-j*2*pi/Interval_of_Group);%旋转因子

for g=1:Num_of_Group %“组”循环开始

Interval_1=(g-1)*Interval_of_Group;%第g组中蝶形运算变量1的偏移量

Interval_2=(g-1)*Interval_of_Group+Interval_of_Unit;%第g组中蝶形运算变量2的偏移量

for r=0:Cycle_Count;%“组内”循环开始

k=r+1;%“组内”序列的下标

xn(k+Interval_1)=xn(k+Interval_1)+xn(k+Interval_2);%第m级，第g组的蝶形运算式1

xn(k+Interval_2)=[xn(k+Interval_1)-xn(k+Interval_2)-xn(k+Interval_2)]*Wn^r;%第m级，第g组的蝶形运算式2，注：1和2为同址运算

end

end

end

%序列排序开始

n1=fliplr(dec2bin([0:N-1]));%码位倒置步骤1：将码位转换为二进制，再进行倒序

n2=[bin2dec(n1)];%码位倒置步骤2：将码位转换为十进制后翻转

for i=1:N

Xk(i)=xn(n2(i)+1);%根据码位倒置的结果，将xn重新排序,存入Xk中

end

