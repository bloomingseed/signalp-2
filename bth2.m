filename='studio_male';

[y1,F1] = audioread("TinHieuMau/"+filename+".wav");
tbounds = readmatrix("bound-"+filename+".txt"); % time-based boundaries

flen=10;    % frame length in milliseconds
felms = flen*F1/1000;
eframes = seframes(y1,F1);     % nang luong cua moi khung
ynorm = datanormalize(y1);      % chuan hoa ve [0;1]
ynormstd = stdnormalize(y1);    % chuan hoa pp chuan tac
efnorm = seframes(ynorm,F1);    % nang luong cua moi khung tin hieu da chuan hoa
efnormstd = seframes(ynormstd,F1);

ymax=max(y1);
ymin=min(y1);
fbounds=F1*tbounds;     % convert boundaries to F-based
pbounds=ceil(fbounds/felms);    % convert boundaries to power-based

emax=max(eframes);
emin=min(eframes);

pivot=0.8;  % ng??ng n?ng l??ng chu?n làm m?c
cond=20;    % frame
b = svfilterstd(efnormstd,cond);  % tìm các ?i?m biên kho?ng l?ng-ti?ng nói
% b=b*felms;  % ??i ??n v? thành th?i ?i?m l?y m?u

delta = rmse(b,pbounds);

subplot(4,1,1)
plot(1:length(y1),y1)
for i=1:length(fbounds)
    line([fbounds(i), fbounds(i)],[max(y1),min(y1)],'Color','red','LineStyle','--')
end
line([1,length(y1)],[pivot,pivot]);
title("do thi giong noi "+filename)

subplot(4,1,2)
plot(1:length(eframes),eframes);
title("do thi nang luong")
for i=1:length(pbounds)
    line([pbounds(i), pbounds(i)],[max(eframes),min(eframes)],'Color','red','LineStyle','--')
end
line([1,length(eframes)],[pivot,pivot]);

% subplot(4,1,3)
% plot(1:length(efnorm),efnorm);
% title("do thi nang luong chuan hoa")
% for i=1:length(pbounds)
%     line([pbounds(i), pbounds(i)],[max(efnorm),min(efnorm)],'Color','red','LineStyle','--')
% end
% line([1,length(efnorm)],[pivot,pivot]);

subplot(4,1,3)
plot(1:length(efnormstd),efnormstd);
title("do thi nang luong chuan hoa pp chuan tac")
for i=1:length(pbounds)
    line([pbounds(i), pbounds(i)],[max(efnormstd),min(efnormstd)],'Color','red','LineStyle','--')
end
line([1,length(efnormstd)],[pivot,pivot]);

subplot(4,1,4)
plot(1:length(efnormstd),efnormstd);
title("do thi nang luong chuan hoa pp chuan tac")
for i=1:length(b)
    line([b(i), b(i)],[max(efnormstd),min(efnormstd)],'Color','red','LineStyle','--')
end
line([1,length(efnormstd)],[pivot,pivot]);