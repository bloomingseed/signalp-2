filename = ["LA025","LA001","2","1"];
devi = [];
devistd = [];
for i=1:4
[y1,F1] = audioread("TinHieuMau/test/"+filename(i)+".wav");
b=svfilter(y1,F1);
flen=10;
fb = b*flen*F1/1000;

figure
g1=plot(y1);
xlabel("Time(Sample)")
ylabel("Amplitude")
for j=1:length(fb)
    l2=line([fb(j), fb(j)],[max(y1),min(y1)],'Color','blue','LineStyle','--');
end
title("Audio signal " + filename(i))
legend([g1 l2], ["Amplitude","Boundary"]);

end