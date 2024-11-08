%% plot matched MODIS parameters for input of the XGBoost_CbPM training
clc
clear
cd 'F:\Arrange\04allmodel_HOTBATS_timeseries\NPP reslut process\����ͼ����ͼ����\'
datapath='F:\Arrange\03XGboost\01build train dataset\01CBPM\result\BGC-ArgoChla_Correct_Xing\berenfeld_zeu\npqmld_HYCOM\';
[data,txt,raw]=xlsread([datapath,'dataset_profile.xlsx'],'case14');
zeu=data(:,7);
kd490=data(:,8);
par=data(:,9);
chl=data(:,10);
bbp443=data(:,11);
sst=data(:,12);
a488=data(:,13);
bb488=data(:,14);
aph443=data(:,15);
para=[zeu,kd490,par,chl,bbp443,sst,a488,bb488,aph443];
paraname={'\itZ_{eu}\rm / m','\itK_{d}\rm(490) / m^{-1}','PAR / Ein m^{-2} d^{-1}','Chl-\ita\rm / mg m^{-3}','\itb_{bp}\rm(443) / m^{-1}','SST / \circ C','\ita\rm(488) / m^{-1}','\itb_{b}\rm(488) / m^{-1}','\ita_{ph}\rm(443) / m^{-1}'};
FigHandle=figure;
set(FigHandle,'units','normalized','position',[0.01 0.06 0.38 0.6],'color','w');
ha=tight_subplot(3,3,[0.09 0.058],[0.098 0.02],[0.095 0.01]);
for i=1:9
    axes(ha(i));
    da=para(:,i);
    x=[];y=[];
    [y,x]=hist(da,60);
    bar(x,y,'FaceColor',[.8 .8 1],'EdgeColor',[.2 .2 .2]);
    set(gca,'Color', 'none','fontsize',13,'fontname','times new roman')
    if i==1|i==4|i==7
        ylabel('Frequency','fontsize',16,'fontname','times new roman')
    end
    xlabel(paraname{i},'fontsize',16,'fontname','times new roman')
%     po=get(gca,'position');
%     axes('position',po,'Visible','off');
%     xlim([0 1])
%     text(0.4,0.9,paraname{i},'fontsize',14,'fontname','Times New Roman') 
%     clear po
end