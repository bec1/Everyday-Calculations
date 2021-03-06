%tempimg=imagedata('03-11-2016_14_33_56_top','plot',{1});
% filenames={'03-11-2016_14_53_03_top';'03-11-2016_14_52_11_top';'03-11-2016_14_51_19_top';'03-11-2016_14_50_28_top';'03-11-2016_14_49_36_top';'03-11-2016_14_48_45_top';'03-11-2016_14_47_54_top';'03-11-2016_14_47_02_top';'03-11-2016_14_44_40_top';'03-11-2016_14_43_49_top';'03-11-2016_14_42_57_top';'03-11-2016_14_42_06_top';'03-11-2016_14_41_14_top';'03-11-2016_14_40_22_top';'03-11-2016_14_39_31_top';'03-11-2016_14_38_11_top';'03-11-2016_14_37_19_top';'03-11-2016_14_36_28_top';'03-11-2016_14_34_48_top'};
% time=[18;17;16;15;14;13;12;11;10;9;8;7;6;5;4;3;2;1;0];
% filenames={'03-11-2016_15_41_22_top';'03-11-2016_15_40_31_top';'03-11-2016_15_39_39_top';'03-11-2016_15_38_47_top';'03-11-2016_15_37_55_top';'03-11-2016_15_36_37_top';'03-11-2016_15_35_45_top';'03-11-2016_15_34_07_top';'03-11-2016_15_32_04_top';'03-11-2016_15_29_59_top';'03-11-2016_15_29_07_top';'03-11-2016_15_27_24_top';'03-11-2016_15_26_13_top';'03-11-2016_15_25_21_top';'03-11-2016_15_23_44_top';'03-11-2016_15_22_37_top';'03-11-2016_15_21_45_top';'03-11-2016_15_20_54_top';'03-11-2016_15_20_02_top';'03-11-2016_15_19_11_top';'03-11-2016_15_18_19_top';'03-11-2016_15_16_42_top';'03-11-2016_15_15_50_top';'03-11-2016_15_14_59_top';'03-11-2016_15_14_07_top';'03-11-2016_15_11_43_top';'03-11-2016_15_10_52_top';'03-11-2016_15_10_00_top';'03-11-2016_15_09_09_top';'03-11-2016_15_04_03_top';'03-11-2016_15_03_12_top';'03-11-2016_15_00_03_top';'03-11-2016_14_59_12_top';'03-11-2016_14_58_20_top';'03-11-2016_14_57_29_top'};
% time=[45;44;43;42;35;30;25;28;6;27;26;24;23;22;21;20;19;18;17;16;15;14;13;12;11;10;9;8;7;5;4;3;2;1;0.00100000000000000];
filenames={'03-21-2016_19_07_10';'03-21-2016_19_06_05';'03-21-2016_19_05_01';'03-21-2016_19_03_56';'03-21-2016_19_02_52';'03-21-2016_19_01_47';'03-21-2016_19_00_42'};
GreenEvap=[0.500000000000000;1;1.50000000000000;2;2.50000000000000;3;3.50000000000000];
%%
[GreenEvap,B]=sort(GreenEvap,'descend');
filenames=filenames(B);
%%
N=length(filenames);
imageshow=[];

for i=1:N
    tempimg=imagedata(filenames{i});
    tempod=tempimg.od;
    imgcrop=tempod(260:390,60:160);
    imageshow=[imageshow,imgcrop];
end
%%
h=figure;
imagesc(imageshow);
axis image
caxis([0,0.4]);
hold on;
for i = 1:N
    text((i-1)*100+40,30,[num2str(GreenEvap(i))],'color','red','FontSize',12);
    text(0,10,'GreenEvap:','color','red','FontSize',12);
end
hold off;

%%
% temp=imrotate(tempimg.od,7);
% imagesc(temp);
% caxis([0,2])
