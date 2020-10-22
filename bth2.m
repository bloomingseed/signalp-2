[y1,F1] = audioread('TinHieuMau/lab_female.wav');

eframes = seframes(y1,F1);     % nang luong cua moi khung

ymax=max(y1);
ymin=min(y1);
tbounds=F1*[0, 0.694, 1.224, 1.955, 2.475, 3.434, 3.845, 4.634, 5.144, 6.085, 6.454, 7.115, 7.815, 9.521];

emax=max(eframes);
emin=min(eframes);

subplot(2,1,1)
plot(1:length(y1),y1)
for i=1:length(tbounds)
    line([tbounds(i), tbounds(i)],[ymax,ymin])
end
title("do thi giong noi")

subplot(2,1,2)
plot(1:length(eframes),eframes);
title("do thi nang luong")