filename="lab_female";

[y1,F1] = audioread("TinHieuMau/"+filename+".wav");
tbounds = readmatrix("bound-"+filename+".txt"); % time-based boundaries

flen=10;                        % frame length in milliseconds
felms = flen*F1/1000;
eframes = seframes(y1,F1, flen);     % nang luong cua moi khung
%ynorm = datanormalize(y1);      % chuan hoa ve [0;1]
%ynormstd = stdnormalize(y1);    % chuan hoa pp chuan tac
%efnorm = seframes(ynorm,F1);    % nang luong cua moi khung tin hieu da chuan hoa
efnormstd = stdnormalize(eframes);
efnorm2 = datanormalize(eframes);

fbounds=F1*tbounds;     % convert boundaries to F-based
pbounds=ceil(fbounds/felms);    % convert boundaries to power-based

pivot=0.55;  % ng??ng n?ng l??ng chu?n làm m?c
pivotstd = 0.4;
cond=20;    % minimum length (frames) for a span to be silence span
b = svfilterstd(efnormstd,cond, pivotstd);  % tìm các ?i?m biên kho?ng l?ng-ti?ng nói
% c=svfilterstd(efnorm2,cond,pivot);
fb = b*felms;
% fc=c*felms;

delta = rmse(c,pbounds);
deltastd = rmse(b,pbounds);
disp(["chuan hoa [0;1]:", delta]);
disp(["chuan hoa pp chuan:", deltastd]);

figure
subplot(2,1,1)
g1=plot(y1);
axis([-10*felms length(y1)+10*felms min(y1), max(y1)])
xlabel("Time (Sample)")
ylabel("Amplitude")
% legend(["Amplitude" "Bounds (Manual)" "Bounds (Automatic)" "Bounds (Automatic)"])
for i=1:length(fbounds)
    l1=line([fbounds(i), fbounds(i)],[max(y1),min(y1)],'Color','red','LineStyle','--');
end
for i=1:length(fb)
    l2=line([fb(i), fb(i)],[max(y1),min(y1)],'Color','black','LineStyle','--');
end
% for i=1:length(fc)
%     l3=line([fc(i), fc(i)],[max(y1),min(y1)],'Color','green','LineStyle','--');
% end
title("Audio signal " + filename)
legend([g1 l1 l2], ["Amplitude","Bounds(manual)","Bound(automatic)"]);

% subplot(4,1,2)
% plot(1:length(eframes),eframes);
% title("do thi nang luong")
% for i=1:length(pbounds)
%     line([pbounds(i), pbounds(i)],[max(eframes),min(eframes)],'Color','red','LineStyle','--')
% end

% subplot(2,1,2)
% g2=plot(efnorm2);
% axis([-10 length(efnorm2)+10 min(efnorm2), max(efnorm2)])
% title("Energy Plot (normalized)")
% xlabel("Time (Frame)")
% ylabel("Energy")
% legend(["Energy" "Bounds (Manual)" "Bounds (Automatic)"])
% for i=1:length(pbounds)
%     l1=line([pbounds(i), pbounds(i)],[max(efnorm2),min(efnorm2)],'Color','red','LineStyle','--');
% end
% for i=1:length(c)
%     l2=line([c(i), c(i)],[max(efnorm2),min(efnorm2)],'Color','black','LineStyle','--');
% end
% line([1,length(efnorm2)],[pivot,pivot]);


subplot(2,1,2)
g2=plot(efnormstd);
axis([-10 length(efnormstd)+10 min(efnormstd), max(efnormstd)])
title("Energy Plot (standard distribution)")
xlabel("Time (Frame)")
ylabel("Energy")
legend(["Energy" "Bounds (Manual)" "Bounds (Automatic)"])
for i=1:length(pbounds)
    l4=line([pbounds(i), pbounds(i)],[max(efnormstd),min(efnormstd)],'Color','red','LineStyle','--');
end
for i=1:length(b)
    l5=line([b(i), b(i)],[max(efnormstd),min(efnormstd)],'Color','blue','LineStyle','--');
end
% line([0,length(efnormstd)],[pivotstd,pivotstd]);
legend([g2,l4,l5],["Energy","Bound(manual)","Bound(automatic)"])

% subplot(3,1,3)
% temp = log(efnorm)/log(10);
% plot(1:length(temp),temp);
% title("do thi nang luong chuan hoa [0;1]")
% for i=1:length(c)
%     line([c(i), c(i)],[max(temp),min(temp)],'Color','red','LineStyle','--')
% end
% line([1,length(efnorm)],[pivot,pivot]);