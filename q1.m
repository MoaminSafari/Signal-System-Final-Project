clc
[x,FS]=audioread("Sample Inputs/noisy_tlou.wav");%get the signal with frequency of FS and x
fourier=fft(x);
output=removeNoise(fourier);
t=1:1:2252004;
subplot(2,1,1)
plot(t,fourier,LineWidth=2)
title("Noise")
subplot(2,1,2)
plot(t,output,LineWidth=2)
title("clean")
output = ifft(output);
audiowrite('Outputs/clean.wav',real(output),FS);
audiowrite('Outputs/fast.wav',real(output),FS*2);%only multiple frequency by 2 for make voice fast
audiowrite('Outputs/slow.wav',real(output),FS/2);%only divide frequency by 2 for make voice slow

%this function cleans high frequencies in the range as shown in function
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