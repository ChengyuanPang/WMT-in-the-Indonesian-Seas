%% Figure 1 ==============================
load ND_section.mat

figure(1)
[c,h] = contourf(YC(1,:),RC,ND',[20:0.2:27],'LineStyle','none');
shading interp;
colorbar
hold on
[c,h] = contour(YC(1,:),RC,ND',[22:1:26],'k','Showtext','on');
hold on
[c,h] = contour(YC(1,:),RC,ND',[26.5 26.5],'k','Showtext','on');

%% Figure 2 ==============================
% Topography
load SST.mat
load bathymetry.mat
load vertical_velocity.mat

D(D==0)=NaN;
figure(2)
subplot(3,1,1)
pcolor(XC,YC,-D);shading flat
hold on
[c,h] = contourf(XC(:,1),YC(1,:),-D',[1 1]*0,'k');
set(h,'Facecolor',[1 1 1]*0.5);
caxis([-6000 0])
colorbar
axis equal;
fa = [108 138 -14 8.5];
axis(fa);
set(gca,'fontsize',10,'Layer','top');
set(gca,'XTick',[110:5:135],'XTickLabel',['110^oE';'115^oE';'120^oE';'125^oE';'130^oE';'135^oE']);
set(gca,'YTick',[-12:4:8],'YTickLabel',['12^oS';'8^oS ';'4^oS ';'0^o  ';'4^oN ';'8^oN ']);

% SST
figure(2)
subplot(3,1,2)
pcolor(XC,YC,SST);shading flat
hold on
[c,h] = contourf(XC(:,1),YC(1,:),-D',[1 1]*0,'k');
set(h,'Facecolor',[1 1 1]*0.5);
caxis([26.5 29.5])
colorbar
axis equal;
fa = [108 138 -14 8.5];
axis(fa);
set(gca,'fontsize',10,'Layer','top');
set(gca,'XTick',[110:5:135],'XTickLabel',['110^oE';'115^oE';'120^oE';'125^oE';'130^oE';'135^oE']);
set(gca,'YTick',[-12:4:8],'YTickLabel',['12^oS';'8^oS ';'4^oS ';'0^o  ';'4^oN ';'8^oN ']);

% Vertical velocity at 140m
figure(2)
subplot(3,1,3)
pcolor(XC,YC,w*100);shading flat
caxis([-1 1])
colorbar
load blue_red_saturated.mat
colormap(map)
axis equal;
fa = [108 138 -14 8.5];
axis(fa);
set(gca,'fontsize',10,'Layer','top');
set(gca,'XTick',[110:5:135],'XTickLabel',['110^oE';'115^oE';'120^oE';'125^oE';'130^oE';'135^oE']);
set(gca,'YTick',[-12:4:8],'YTickLabel',['12^oS';'8^oS ';'4^oS ';'0^o  ';'4^oN ';'8^oN ']);

%% Figure 3 ==============================
load TS_diagram.mat

% plot the T/S diagram of the 9 sites.
ii = [1,6,11,5,10,15,17,18,19];
for i = 1:9
figure(3)
subplot(4,5,ii(i))
hold on
plot(S_10km(i,:),T_10km(i,:),'color',[0.93,0.69,0.13],'LineWidth', 1.5)
hold on
plot(S_4km(i,:),T_4km(i,:),'color',[0.47,0.67,0.19],'LineWidth', 1.5)
hold on
plot(S_2km(i,:),T_2km(i,:),'color','r','LineWidth', 1.5)
hold on
plot(S_2km_nt(i,:),T_2km_nt(i,:),'color',[0.30,0.75,0.93],'LineWidth', 1.5,'LineStyle','--')
hold on
plot(S_ACCESS(i,:),T_ACCESS(i,:),'color','b','LineWidth', 1)
hold on
plot(S_CARS(i,:),T_CARS(i,:),'color','k','LineWidth', 1.5)
set(gca,'fontsize',13);
axis([33.5 36 0 30]);
hold on
[C,h] = contour(SP,TP,DP,[18:1:26],'--','color',[1 1 1]*0.8,'ShowText','on');
clabel(C,h,'color',[1 1 1]*0.8)
hold on
[C,h] = contour(SP,TP,DP,[26:0.5:30],'--','color',[1 1 1]*0.8,'ShowText','on');
clabel(C,h,'color',[1 1 1]*0.8)
end

% plot the map and the position of the sites
% figure(3)
po = [0.35 0.35 0.36 0.57]
subplot('Position',po)
[c,h] = contourf(XC(:,1),YC(1,:),-D',[1 1]*0,'k');
set(h,'Facecolor',[1 1 1]*0.7);
for i =1:9
hold on
scatter (Position(i,1),Position(i,2),80,'ro','filled')
end
hold off
axis equal;
fa = [108 138 -14 8.5];
axis(fa);
set(gca,'fontsize',16,'Layer','top');
set(gca,'XTick',[110:5:135],'XTickLabel',['110^oE';'115^oE';'120^oE';'125^oE';'130^oE';'135^oE']);
set(gca,'YTick',[-12:4:8],'YTickLabel',['12^oS';'8^oS ';'4^oS ';'0^o  ';'4^oN ';'8^oN ']);

%% Figure 4 ==============================
load Mixing.mat

figure(4)
subplot(2,2,1)
plot(profile_10km,RC,'r','LineWidth',2)
hold on
plot(profile_4km,RC,'b','LineWidth',2)
hold on
plot(profile_2km,RC,'color',[0.9290 0.6940 0.1250],'LineWidth',2)
hold on
plot(profile_2km_nt,RC,'k','LineWidth',2)
hold on
plot([-5 0],[-140 -140],'k:')
axis([-5 -1 -1000 0])
grid on

subplot(2,2,2)
pcolor(XC,YC,log10(KPP_100)); 
colorbar;shading flat;
colormap('jet')
hold on
[c,h] = contourf(XC(:,1),YC(1,:),-D',[1 1]*RC(29),'k');
set(h,'Facecolor',[1 1 1]*0.7);
hold on
[c,h] = contourf(XC(:,1),YC(1,:),-D',[1 1]*0,'k');
set(h,'Facecolor',[1 1 1]*0.5);
caxis([-2.5 -1.5]);
set(gca,'XTick',[110:5:135],'XTickLabel',['110^oE';'115^oE';'120^oE';'125^oE';'130^oE';'135^oE']);
set(gca,'YTick',[-12:4:8],'YTickLabel',['12^oS';'8^oS ';'4^oS ';'0^o  ';'4^oN ';'8^oN ']);
axis equal
fa = [108 138 -14 8.5];axis(fa);
set(gca,'fontsize',10);

subplot(2,2,3)
pcolor(XC,YC,log10(KPP_1000_t)); 
colorbar;shading flat;
colormap(mix_map)
hold on
[c,h] = contourf(XC(:,1),YC(1,:),-D',[1 1]*RC(29),'k');
set(h,'Facecolor',[1 1 1]*0.7);
hold on
[c,h] = contourf(XC(:,1),YC(1,:),-D',[1 1]*0,'k');
set(h,'Facecolor',[1 1 1]*0.5);
caxis([-5 -1]);
set(gca,'XTick',[110:5:135],'XTickLabel',['110^oE';'115^oE';'120^oE';'125^oE';'130^oE';'135^oE']);
set(gca,'YTick',[-12:4:8],'YTickLabel',['12^oS';'8^oS ';'4^oS ';'0^o  ';'4^oN ';'8^oN ']);
axis equal
fa = [108 138 -14 8.5];axis(fa);
set(gca,'fontsize',10);

subplot(2,2,4)
pcolor(XC,YC,log10(map_1000_nt)); 
colorbar;shading flat;
colormap(mix_map)
hold on
[c,h] = contourf(XC(:,1),YC(1,:),-D',[1 1]*RC(29),'k');
set(h,'Facecolor',[1 1 1]*0.7);
hold on
[c,h] = contourf(XC(:,1),YC(1,:),-D',[1 1]*0,'k');
set(h,'Facecolor',[1 1 1]*0.5);
caxis([-5 -1]);
set(gca,'XTick',[110:5:135],'XTickLabel',['110^oE';'115^oE';'120^oE';'125^oE';'130^oE';'135^oE']);
set(gca,'YTick',[-12:4:8],'YTickLabel',['12^oS';'8^oS ';'4^oS ';'0^o  ';'4^oN ';'8^oN ']);
axis equal
fa = [108 138 -14 8.5];axis(fa);
set(gca,'fontsize',10);

%% Figure 5 ==============================
load WMT.mat

figure(5)
subplot(1,2,1)
barh(Draw_density,OUT,1,'b','LineStyle','none','FaceAlpha',0.5)
hold on
hp = barh(Draw_density,IN,1);
hp.FaceColor = 'none';
hatchfill2(hp,'single','HatchAngle',-45,'hatchcolor','k');%hatched bars
yticks([17.25:0.5:30])
yticklabels({'17.5','18','18.5','19','19.5','20','20.5','21','21.5','22','22.5','23', ...
    '23.5','24','24.5','25','25.5','26','26.5','27','27.5','28','28.5','29'})
hold on
plot([18,29],[0,0],'k--','LineWidth',2)
hold on
plot([-5,5],[21.75,21.75],'k--','LineWidth',2)
hold on
plot([-5,5],[25.75,25.75],'k--','LineWidth',2)
hold on
axis([-1 3 18.25 28.75 ])
grid on
xlabel('Volume Transport (Sv)');
ylabel('Neutral Density (\gamma_n)');
set(gca,'fontsize',14);
set(gca, 'YDir','reverse')

subplot(1,2,2)
barh(Draw_density,WMT_S_t,1,'LineStyle','none','FaceColor',[0.49,0.18,0.56],'FaceAlpha',0.8)
hold on
hp = barh(Draw_density, WMT_S_nt,1);
hp.FaceColor = 'none';
hatchfill2(hp,'cross','HatchDensity',100,'HatchLineWidth',1,'hatchcolor',[0.3010 0.7450 0.9330]);%seasonal
hold on
hp = barh(Draw_density,WMT_C_t,1)
hp.FaceColor = 'none';
hatchfill2(hp,'single','HatchAngle',45,'HatchDensity',50,'hatchcolor','k');%climatology

yticks([17.25:0.5:30])
yticklabels({'17.5','18','18.5','19','19.5','20','20.5','21','21.5','22','22.5','23', ...
    '23.5','24','24.5','25','25.5','26','26.5','27','27.5','28','28.5','29'})
hold on
plot([18,29],[0,0],'k--','LineWidth',2)
hold on
plot([-5,5],[21.75,21.75],'k--','LineWidth',2)
hold on
plot([-5,5],[25.75,25.75],'k--','LineWidth',2)
hold on
axis([-1.5 2 18.25 28.75 ])
grid on
xlabel('Transformation rate (Sv)');
ylabel('Neutral Density (\gamma_n)');
set(gca,'fontsize',14);
set(gca, 'YDir','reverse')

%% Figure 6 ==============================
load velocity.mat

figure(6)
subplot(6,1,1:5)
plot(-v*1e-6,'LineWidth',2)
ylim([0 16])
yticks([0:2:16])
ylabel('Volume transport (10^6 m^3/s)');
grid on
yyaxis right
plot(h*1e-8,'LineWidth',2)
ylim([1.5 5.5])
yticks([1.5:0.5:5.5])
ylabel('Section area (10^8 m^3)');
xticks([1:1:12])
xticklabels({'Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'})
set(gca,'fontsize',15);

subplot(6,1,6)
quiver([1:1:12],[1:1:12]*0,squeeze(w_u)',squeeze(w_v)',0.2)
axis equal
axis([0.5 12.5 -0.45 0.55])
hold on
quiver([1],[0.4],1,0,0.2)
