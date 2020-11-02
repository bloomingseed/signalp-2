filename = ["lab-male","lab-female","studio-male","studio-female"];
for i=1:4
[y1,F1] = audioread("TinHieuMau/"+filename(i)+".wav");
tbounds = readmatrix("bound-"+filename(i)+".txt"); % time-based boundaries
flen=10;                        % frame length in milliseconds
felms = flen*F1/1000;

subplot(4,1,i)
plot(y1);
ax = gca;
ax.FontSize=18;
ax.TitleFontSizeMultiplier = 1.3;
axis([-10*felms,length(y1)+10*felms min(y1), max(y1)])
xlabel("Time(Sample)")
ylabel("Amplitude")
title("Audio signal " + filename(i))
end
