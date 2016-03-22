Filelist={'03-21-2016_20_22_22';'03-21-2016_20_17_39';'03-21-2016_20_16_35';'03-21-2016_20_15_30';'03-21-2016_20_11_53';'03-21-2016_20_10_48';'03-21-2016_20_09_44';'03-21-2016_20_05_51';'03-21-2016_20_04_46';'03-21-2016_20_03_41';'03-21-2016_20_02_37';'03-21-2016_20_01_32';'03-21-2016_20_00_28';'03-21-2016_19_59_23';'03-21-2016_19_58_04';'03-21-2016_19_53_09';'03-21-2016_19_52_05';'03-21-2016_19_51_00';'03-21-2016_19_49_56';'03-21-2016_19_27_25';'03-21-2016_19_23_07';'03-21-2016_19_22_03';'03-21-2016_19_18_38';'03-21-2016_19_17_18';'03-21-2016_19_16_14';'03-21-2016_19_15_09';'03-21-2016_19_14_04';'03-21-2016_19_13_00';'03-21-2016_19_11_55';'03-21-2016_19_10_51';'03-21-2016_19_07_10';'03-21-2016_19_06_05';'03-21-2016_19_05_01';'03-21-2016_19_03_56';'03-21-2016_19_02_52';'03-21-2016_19_01_47';'03-21-2016_19_00_42'};
GreenEvap=[0.500000000000000;1;1.50000000000000;2;2.50000000000000;3;3.50000000000000;0.500000000000000;1;1.50000000000000;2;2.50000000000000;3;3.50000000000000;0.500000000000000;2;2.50000000000000;3;3.50000000000000;0.500000000000000;2;3;3.50000000000000;0.500000000000000;1;1.50000000000000;2;2.50000000000000;3;3.50000000000000;0.500000000000000;1;1.50000000000000;2;2.50000000000000;3;3.50000000000000];
%%
AveragedImgList={};
GreenEvapBin=[];
while length(GreenEvap)>0
    currentGEbin=GreenEvap(1);
    currentmark=(GreenEvap==currentGEbin);
    CurrentList=Filelist(currentmark);
    N=length(CurrentList);
    AveragedImg=0;
    for i=1:N
        tempimg=imagedata(CurrentList{i});
        tempod=tempimg.od;
        AveragedImg=AveragedImg+tempod;
    end
    AveragedImg=AveragedImg/N;
    AveragedImgList=[AveragedImgList;AveragedImg];
    GreenEvapBin=[GreenEvapBin;currentGEbin];
    Filelist(currentmark)=[];
    GreenEvap(currentmark)=[];
end
%%
%%Plot it side by side
[GreenEvapBin,B]=sort(GreenEvapBin,'descend');
AveragedImgList=AveragedImgList(B);

N=length(AveragedImgList);
imageshow=[];

Cuts=cell(N,1);

for i=1:N
    tempod=AveragedImgList{i};
    Cuts{i}=sum(tempod(315:329,60:160))/15;
    imgcrop=tempod(260:390,60:160);
    imageshow=[imageshow,imgcrop];
end

h=figure;
imagesc(imageshow);
axis image
caxis([0,0.4]);
hold on;
for i = 1:N
    text((i-1)*100+40,30,[num2str(GreenEvapBin(i))],'color','red','FontSize',12);
    text(0,10,'GreenEvap:','color','red','FontSize',12);
end
hold off;
%%
%%Water fall plot
[X,Y]=meshgrid(60:160,GreenEvapBin(1:end-1));
Z=zeros(N-1,101);
for i=1:N-1
    Z(i,:)=Cuts{i};
end
waterfall(X,Y,Z)
%%
Xgrid=60:160;
plot(Xgrid,Cuts{6},'r.',Xgrid,Cuts{7},'b.');

