% 两个频率分别为15HZ 和 20HZ 的正弦信号

x = [0.005 0.005 0.005 0.0012 0 0 0 0];%原始信号
N=length(x)% 
figure(1);
subplot(131);
stem((0:N-1),x);
title('Original Signal');
xlabel('Time'); 
ylabel('Amplitude'); 
axis([0, 7, 0, max(x)*1.3])
%直接使用fft
subplot(132)
y = abs(fft(x)); %快速傅里叶变换的幅值
%将横坐标转化，显示为频率f= n*(fs/N)
f = (0:N-1)
stem(f,y0);
xlabel('Frequency'); 
ylabel('Amplitude');
axis([0, 7, 0, max(y)*1.3])
title('built-in fft');

y0 = abs(DIF_FFT_2(x,8)); %快速傅里叶变换的幅值
%将横坐标转化，显示为频率f= n*(fs/N)
f = (0:N-1)
subplot(133)
stem(f,y);
axis([0, 7, 0, max(y)*1.3])
xlabel('Frequency'); 
ylabel('Amplitude');
title('my fft');
