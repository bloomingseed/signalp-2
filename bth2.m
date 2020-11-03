filename = ["lab-male","lab-female","studio-male","studio-female"];
devi = [];
devistd = [];
for i=1:4
[y1,F1] = audioread("TinHieuMau/"+filename(i)+".wav");
tbounds = readmatrix("bound-"+filename(i)+".txt"); % time-based boundaries
flen=10;                        % frame length in milliseconds
felms = flen*F1/1000;

eframes = seframes(y1,F1, flen);    % calculate short-time energies
efnormstd = stdnormalize(eframes);  % normalize to standard distribution
efnorm = datanormalize(eframes);    % normalize to [0;1] range

fbounds=F1*tbounds;             % convert boundaries to F-based
pbounds=ceil(fbounds/felms);    % convert boundaries to power-based

pivot=0.55;     % threshold for [0;1] normalization
pivotstd = 0.4; % threshold for standard distribution normalization
cond=20;        % minimum length (frames) for a span to be silence span
% b = svfilter(efnormstd,cond, pivotstd);  % calculate boundaries
% c=svfilter(efnorm,cond,pivot);
b=svfilterstd(y1,F1,pivotstd);
c=svfilter(y1,F1,pivot);
fb = b*felms;   % convert boundaries to F-based
fc=c*felms;

delta = rmse(c,pbounds);    % rmse between [0;1] normalization bounds and manual bounds
deltastd = rmse(b,pbounds); % rmse between [0;1] std normalization bounds and manual bounds
devi = [devi delta];
devistd = [devistd deltastd];
% disp(["chuan hoa [0;1]:", delta]);
% disp(["chuan hoa pp chuan:", delta]);

figure
subplot(2,1,1)
g1=plot(y1);
axis([-10*felms length(y1)+10*felms min(y1), max(y1)+max(y1)/2])
xlabel("Time(Sample)")
ylabel("Amplitude")
ax = gca;
ax.FontSize=18;
ax.TitleFontSizeMultiplier = 1.3;
for j=1:length(fbounds)
    l1=line([fbounds(j), fbounds(j)],[max(y1),min(y1)],'Color','red','LineStyle','--');
end
for j=1:length(fb)
    l2=line([fb(j), fb(j)],[max(y1),min(y1)],'Color','blue','LineStyle','--');
end
title("Audio signal " + filename(i))
legend([g1 l1 l2], ["Amplitude","Bound(manual)","Bound(automatic)"]);

subplot(2,1,2)
g2=plot(efnormstd);
axis([-10 length(efnormstd)+10 min(efnormstd), max(efnormstd)+max(efnormstd)/2])
title("Energy Plot (standard distribution)")
xlabel("Time(Frame)")
ylabel("Energy")
ax = gca;
ax.FontSize=18;
ax.TitleFontSizeMultiplier = 1.3;
for j=1:length(pbounds)
    l4=line([pbounds(j), pbounds(j)],[max(efnormstd),min(efnormstd)],'Color','red','LineStyle','--');
end
for j=1:length(b)
    l5=line([b(j), b(j)],[max(efnormstd),min(efnormstd)],'Color','blue','LineStyle','--');
end
legend([g2,l4,l5],["Energy","Bound(manual)","Bound(automatic)"])

end
% figure
% plot(devi)
% xticks(1:length(filename));
% xticklabels(filename);
% title("RMSE between manual bounds and automatic bounds")
% 
% figure
% plot(devistd)
% xticks(1:length(filename));
% xticklabels(filename);
% title("RMSE between manual bounds and automatic bounds")
tdevi = devi*felms/F1;
tdevistd = devistd*felms/F1;

% figure
% plot(devi);
% hold on
% scatter(1:4,devi,"filled", "blue")
% hold off
% xticks(1:length(filename));
% xticklabels(filename);
% title("RMSE between manual bounds and automatic bounds")
% 
% figure
% plot(devistd);
% hold on
% scatter(1:4,devistd,"filled", "blue")
% hold off
% xticks(1:length(filename));
% xticklabels(filename);
% title("RMSE between manual bounds and automatic bounds")
% legend("Standard distribution","[0;1] normalization")

% figure
% plot(1:4, tdevistd, 1:4, tdevi);
% hold on
% scatter(1:4,tdevi,"filled")
% scatter(1:4,tdevistd,"filled")
% hold off
% xticks(1:length(filename));
% xticklabels(filename);
% title("RMSE between manual bounds and automatic bounds")
% legend("Standard distribution","[0;1] normalization")

% figure
% plot(1:4, tdevistd, 1:4, tdevi);
% xticks(1:length(filename));
% xticklabels(filename);
% title("RMSE between manual bounds and automatic bounds")
% legend("Standard distribution","[0;1] normalization")
% ax = gca;
% ax.FontSize=18;
% ax.TitleFontSizeMultiplier = 1.3;