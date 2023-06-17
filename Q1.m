clc
[x,FS]=audioread("noisy_tlou.wav");%get the signal with frequency of FS and x
fourier=fft(x);
output=removeNoise(fourier);
t=1:1:2252004;
subplot(6,1,1)
plot(x)
title("noisy tlou")
subplot(6,1,2)
spectrogram(x);
title("spectogram of noisy tlou")
subplot(6,1,3)
plot(t,fourier,LineWidth=2)
title("frequency domain with Noise")
grid on;
subplot(6,1,4)
plot(t,output,LineWidth=2)
title("frequency domain without Noise")
subplot(6,1,5)
output = ifft(output);
plot(t,output);
title("noisy tlou without Noise")
subplot(6,1,6)
spectrogram(output);
title("clean voice Spectogram")
audiowrite('clean.wav',real(output),FS);
audiowrite('fast.wav',real(output),FS*2);%only multiple frequency by 2 for make voice fast
audiowrite('slow.wav',real(output),FS/2);%only divide frequency by 2 for make voice slow

%this function cleans high frequencies in the range as shown in function
function [out]=removeNoise(Voice)
% start=200105;
% End=2055000;
for i=1:length(Voice)
     if (i>202931 && i<204969) ||(i>509757&&i<511476) ||(i>816144 && i<817882) ||(i>1434140&&i<1435660) ||(i>1740670&&i<1742030) ||(i>2046960&&i<2048530)
        Voice(i)=0;
    end
end
out=Voice;
end