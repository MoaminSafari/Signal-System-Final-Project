clc
[x,FS]=audioread("noisy_tlou.wav");
fourier=fft(x);
output=removeNoise(fourier);
t=1:1:2252004;
subplot(3,1,1)
plot(t,fourier)
subplot(3,1,2)
plot(t,output)
output = ifft(output);
audiowrite('clean.wav',real(output),FS);
audiowrite('fast.wav',real(output),FS*2);
audiowrite('slow.wav',real(output),FS/2);
function [out]=removeNoise(Voice)
start=200493;
End=2055000;
for i=1:length(Voice)
    if i>=start && i<=End
        Voice(i)=0;
    end
end
out=Voice;
end