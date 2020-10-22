[y1,F1] = audioread('TinHieuMau/lab_female.wav');
N = length(y1); % chieu dai y1
pow1=E(y1);    % nang luong cua tung mau trong tin hieu
%ek = seframes(pow1,F1);     % nang luong cua moi khung
y1norm=datanormalize(y1);    % chuan hoa theo phuong phap 1
y1std=stdnormalize(y1);     % chuan hoa theo phuong phap dua ve pp chuan tac
y1normframes=seframes(y1norm,F1);  % tao cac frame cua y1norm
y1stdframes=seframes(y1std,F1);    % tao cac frame cua y1std

%% ve do thi tieng noi
subplot(2,1,1);
plot(1:N,y1);
title('do thi tieng noi');
%% ve bien chuan
b=[-0.5 0.5];
v=[0, 0.695, 1.236, 1.975, 2.498, 3.44, 3.865, 4.67, 5.16, 6.075, 6.505, 7.122, 7.827, 9.5];
v=v*F1;
for i=1:length(v)
    a=[v(i) v(i)];
    line(a,b, 'Color', 'red', 'LineStyle', '--')
end
%% ve do thi nang luong
subplot(2,1,2);
plot(1:N,pow1);
title ('do thi nang luong');
%% ve bien chuan
for i=1:length(v)
    a=[v(i) v(i)];
    line(a,b, 'Color', 'red', 'LineStyle', '--')
end