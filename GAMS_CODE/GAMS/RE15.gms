*POWER PROCUREMENT FOR THE STATE OF TAMIL NADU YEAR 2021
*THERMAL
*HYDRO
*SOLAR
*WIND
*POWER EXCHANGES
*DSM
*SOLAR_REC
*NON_SOLAR_REC
*SCHEDULING AT 15 MINUTES INTERVAL
set
Gen Thermal (Coal) Generators
/
APNRL
VALUTHUR_GTPS
TALCHER_1
TALCHER_2
KUTTALAM_GTPS
JINDAL
GMR
DB
RAMAGUNDAM_3
NLC_TPS1
KSK_MAHANADHI
RAMAGUNDAM_1_2
MAPS_KALPAKKAM
NLC_TPS2_1
NLC_TPS2_2
NLC_TPS2_EXPANSION
DHARIWAL
SIMHADRI
ILFS
NCTPS_1
NCTPS_2
BALCO
VALLUR
NTPL
CPP_BIO_COGEN
KOVILKALAPPAL_GTPS
KAIGA_1_2
KAIGA_3_4
TTPS
TAQA
MTPS_3
MTPS_1_2
KKNPP_1
KKNPP_2
COASTAL_ENERGEN
/
MR(Gen) Must Run Thermal (Coal) Generators
/
MAPS_KALPAKKAM
NLC_TPS2_2
NCTPS_2
NTPL
KAIGA_1_2
KAIGA_3_4
TTPS
MTPS_3
KKNPP_1
KKNPP_2
/
H_Gen Hydro Generators
/
KADAMPARAI_1
KADAMPARAI_2
KADAMPARAI_3
KADAMPARAI_4
/
t /t1*t96/
PV/Solar_Gen/
W/Wind_Gen/
PX_no Term Ahead Contracts in Power Exchange
/
RTC_1 ,
RTC_2 ,
RTC_3  ,
mShldr_1  ,
mShldr_2  ,
mpeak_1 ,
mpeak_2 ,
mpeak_3 ,
Shldr_1  ,
Shldr_2  ,
epeak_1  ,
epeak_2  ,
epeak_3   ,
off_peak_1,
off_peak_2
/
counter /1*18/
;
$ONUNDF

Parameter Gen_Data(Gen,*);
$call.checkErrorLevel GDXXRW TN_prelim_data11.xlsx Par=Gen_Data rng=Gdetails1!A1:H43 Rdim=1 Cdim=1
$GDXIN TN_prelim_data11.gdx
$LOAD Gen_Data

display Gen_Data ;
Parameter demand1(t,*);
$CALL GDXXRW TN_prelim_data11.xlsx  Par=demand1 rng=Demand_Data!A1:B97 Rdim=1 Cdim=1
$GDXIN TN_prelim_data11.gdx
$LOAD demand1
display demand1;
Parameter PV_Act(t,*);
$CALL GDXXRW TN_prelim_data11.xlsx  Par=PV_Act rng=PV_Data!A1:B97 Rdim=1 Cdim=1
$GDXIN TN_prelim_data11.gdx
$LOAD PV_Act
display PV_Act;
Parameter Wind_Act(t,*);
$CALL GDXXRW TN_prelim_data11.xlsx  Par=Wind_Act rng=Wind_Data!A1:B97 Rdim=1 Cdim=1
$GDXIN TN_prelim_data11.gdx
$LOAD Wind_Act
display Wind_Act;
Parameter Hydro_Data(H_Gen,*);
$CALL GDXXRW TN_prelim_data11.xlsx  Par=Hydro_Data rng=Hydro_Data!A1:Q5 Rdim=1 Cdim=1
$GDXIN TN_prelim_data11.gdx
$LOAD Hydro_Data
display Hydro_Data;
Parameter Hydro_flow(t,*);
$CALL GDXXRW TN_prelim_data11.xlsx  Par=Hydro_flow rng=Hydro_flow!A1:E97 Rdim=1 Cdim=1
$GDXIN TN_prelim_data11.gdx
$LOAD Hydro_flow
display Hydro_flow;
Parameter PX_Data(PX_no,*);
$CALL GDXXRW TN_prelim_data11.xlsx  Par=PX_Data rng=PX_Data!A1:E16 Rdim=1 Cdim=1
$GDXIN TN_prelim_data11.gdx
$LOAD PX_Data
display PX_Data ;
Parameter PX_Cost(PX_no,*);
$CALL GDXXRW TN_prelim_data11.xlsx  Par=PX_Cost rng=PX_Cost!A1:B16  Rdim=1 Cdim=1
$GDXIN TN_prelim_data11.gdx
$LOAD PX_Cost
display PX_Cost;
parameter PX_Avail(PX_no,*);
$CALL GDXXRW TN_prelim_data11.xlsx  Par=PX_Avail rng=PX_CA!A1:CS16 Rdim=1 Cdim=1
$GDXIN TN_prelim_data11.gdx
$LOAD PX_Avail
display PX_Avail;
parameter DSM_cost(t,*);
$CALL GDXXRW TN_prelim_data11.xlsx  Par=DSM_cost rng=DSM_Data!C1:D97 Rdim=1 Cdim=1
$GDXIN TN_prelim_data11.gdx
$LOAD DSM_cost
display DSM_cost;
parameter REC_Data(t,*);
$CALL GDXXRW TN_prelim_data11.xlsx  Par=REC_Data rng=REC_Data!A1:C97 Rdim=1 Cdim=1
$GDXIN TN_prelim_data11.gdx
$LOAD REC_Data
display REC_Data;
parameter DAM_Data(t,*);
$CALL GDXXRW TN_prelim_data11.xlsx  Par=DAM_Data rng=DAM_Data!A1:B97 Rdim=1 Cdim=1
$GDXIN TN_prelim_data11.gdx
$LOAD DAM_Data
display DAM_Data;
parameter RTM_Data(t,*);
$CALL GDXXRW TN_prelim_data11.xlsx  Par=RTM_Data rng=RTM_Data!A1:B97 Rdim=1 Cdim=1
$GDXIN TN_prelim_data11.gdx
$LOAD RTM_Data
display RTM_Data;
parameter Risk_Data(t,*);
$CALL GDXXRW TN_prelim_data11.xlsx  Par=Risk_Data rng=Risk_Data!A2:P97 Rdim=1 Cdim=1
$GDXIN TN_prelim_data11.gdx
$LOAD Risk_Data
display Risk_Data;
parameter alpha;
*parameter value(counter1);

$OFFUNDF

Alias (t,tt);

Positive Variable
Gen_cost
LS_cost
PXX_cost
DSM_costt
HGen_cost
S_REC_cost
NS_REC_cost
PXXDAM_cost
PXXRTM_cost
PV_Ct_cost
Wind_Ct_cost
*PXXG_DAM_cost
G(Gen,t) Generator output under time period t
E(t) Energy not served in period t (Load Shedding)
PV_Sch(t) Scheduled PV Generation
Wind_Sch(t) Scheduled Wind Generation
PV_Ct(t) Solar spillage variable
Wind_Ct(t) Wind spillage variable
Vh(H_Gen,t)  Head of water
Rh(H_Gen,t)  Water released
*Gh(H_Gen,t) Hydro Generator output under time period t
PX_G(PX_no,t) PX USED quantity
PX_Uc(PX_no,t) PX Uncontracted quantity
DSM(t)
S_REC(t)
NS_REC(t)
DAM(t)
RTM(t)
*G_DAM(t)
Total_solar
Total_demand
Total_wind
*Total_G_DAM
Total_S_REC
Total_NS_REC
;

Binary Variable
u(Gen,t) Generator commitment status for time t
p(PX_no,t)  PX contract status for Candidate Contract
uh(H_Gen,t) Hydro Generator commitment status for time t
;

Free variable
Total_cost
Gh(H_Gen,t) Hydro Generator output under time period t
Risk
Risk1
Risk2
Risk3
Risk4
Final_cost
Total_PPC1
Total_PPC2
;

scalar
Cp /50000/
PV_CTcost /50000/
Wind_CTcost /50000/
S_RPO /0.105/
NS_RPO /0.105/
*H_RPO /0.0018/
Conv_FC /11473.11/
Hyd_FC /511.6/
;

PV_Sch.lo(t) = 0;
PV_Sch.up(t) = PV_Act(t,'Sm');
Wind_Sch.lo(t) = 0;
Wind_Sch.up(t) = Wind_Act(t,'Wm');
DSM.up(t) = [0.12*demand1(t,'1')];
DSM.lo(t) = 0;
*G_DAM.lo(t)=0;
*G_DAM.up(t)=500;
Vh.fx(H_Gen,'t24') = Hydro_Data(H_Gen,'Vfin') ;
Gh.lo(H_Gen,t)=[-1*Hydro_Data(H_Gen,'Phmax')];
Gh.up(H_Gen,t)=Hydro_Data(H_Gen,'Phmax');

equations
OF
Final_OF
GC
LSC
PXC
DSMC
HGC
S_RECC
NS_RECC
DAMC
RTMC
PVCtC
WindCtC
*G_DAMC
powerbal1(t)
S_RPO_bal
NS_RPO_bal
*hydGen(H_Gen,t)
powerlim1(Gen,t)
powerlim2(Gen,t)
hydpowerlim1(H_Gen,t)
hydpowerlim2(H_Gen,t)
G_Rampup(Gen,t) Generator Ramp up constraints
G_Rampdown(Gen,t) Generator Ramp down constraints
Gh_Rampup(H_Gen,t) Hydro Generator Ramp up constraints
Gh_Rampdown(H_Gen,t) Hydro Generator Ramp down constraints
*hydreleaselim1(H_Gen,t)
*hydreleaselim2(H_Gen,t)
*hydheadlim1(H_Gen,t)
*hydheadlim2(H_Gen,t)
G_minuptime(Gen,t,tt) Generator min uptime constraint
G_mindowntime(Gen,t,tt) Generator min downtime constraint
PXlim(PX_no,t)
MUST_RUN
MUST_RUN_lim
Eq_Risk
Eq1_Risk
Eq2_Risk
Eq3_Risk
Eq4_Risk
TS
TD
TW
*TGD
TSREC
TNSREC
PV_bal(t)
Wind_bal(t)
TPPC1
TPPC2
;

OF.. Total_Cost =e=  Gen_cost + LS_cost + DSM_costt + PXX_cost + HGen_cost + S_REC_cost + NS_REC_cost + PXXDAM_cost + PXXRTM_cost + PV_Ct_cost + Wind_Ct_cost;
GC.. Gen_cost =e= (10**(-7))*[sum((t,Gen),Gen_Data(Gen,'VC')*G(Gen,t))];
LSC.. LS_cost =e= (10**(-7))*[sum(t,(E(t)*Cp))];
PXC..  PXX_cost =e= (10**(-7))*[sum((t,PX_no),PX_Cost(PX_no,'1')*PX_G(PX_no,t))];
DSMC.. DSM_costt =e= (10**(-7))*[sum(t,(DSM(t)*DSM_cost(t,'1')))];
HGC.. HGen_cost =e= (10**(-7))*[sum((t,H_Gen),Hydro_Data(H_Gen,'hydGcost')*Gh(H_Gen,t))];
S_RECC.. S_REC_cost =e= (10**(-7))*[sum(t,(S_REC(t)*REC_Data(t,'1')))];
NS_RECC.. NS_REC_cost =e= (10**(-7))*[sum(t,(NS_REC(t)*REC_Data(t,'2')))];
DAMC.. PXXDAM_cost =e= (10**(-7))*[sum(t,(DAM(t)*DAM_Data(t,'1')))];
RTMC.. PXXRTM_cost =e= (10**(-7))*[sum(t,(RTM(t)*RTM_Data(t,'1')))];
PVCtC.. PV_Ct_cost =e= (10**(-7))*[sum(t,(PV_Ct(t)*PV_CTcost))];
WindCtC.. Wind_Ct_cost =e= (10**(-7))*[sum(t,(Wind_Ct(t)*Wind_CTcost))];
*G_DAMC.. PXXG_DAM_cost =e= (10**(-7))*[sum(t,(G_DAM(t)*DAM_Data(t,'2')))];
powerbal1(t).. sum(Gen,G(Gen,t))+ E(t) + DSM(t) + DAM(t) + RTM(t) + sum(H_Gen,Gh(H_Gen,t)) + PV_sch(t) + Wind_sch(t) =g= demand1(t,'1');
TS.. Total_solar =e= sum(t,PV_sch(t));
TD.. Total_demand =e= sum(t,demand1(t,'1'));
TW.. Total_wind =e= sum(t,Wind_sch(t));
*TGD.. Total_G_DAM =e= sum(t,G_DAM(t));
TSREC.. Total_S_REC =e= sum(t,S_REC(t));
TNSREC.. Total_NS_REC =e= sum(t,NS_REC(t));
S_RPO_bal..  Total_solar + Total_S_REC =g= S_RPO*Total_demand;
NS_RPO_bal.. Total_wind + Total_NS_REC =g= NS_RPO*Total_demand;
*hydGen(H_Gen,t).. Gh(H_Gen,t) =e= Hydro_Data(H_Gen,'c1')*Vh(H_Gen,t)*Vh(H_Gen,t) + Hydro_Data(H_Gen,'c2')*Rh(H_Gen,t)*Rh(H_Gen,t) + Hydro_Data(H_Gen,'c3')*Vh(H_Gen,t)*Rh(H_Gen,t) + Hydro_Data(H_Gen,'c4')*Vh(H_Gen,t) + Hydro_Data(H_Gen,'c5')*Rh(H_Gen,t) + Hydro_Data(H_Gen,'c6');
powerlim1(Gen,t).. Gen_Data(Gen,'Pmin')*u(Gen,t)=l= G(Gen,t) ;
powerlim2(Gen,t).. G(Gen,t)=l= Gen_Data(Gen,'Pmax')*u(Gen,t);
hydpowerlim1(H_Gen,t).. Hydro_Data(H_Gen,'Phmin')*uh(H_Gen,t)=l= Gh(H_Gen,t) ;
hydpowerlim2(H_Gen,t).. Gh(H_Gen,t)=l= Hydro_Data(H_Gen,'Phmax')*uh(H_Gen,t);
*hydreleaselim1(H_Gen,t).. Hydro_Data(H_Gen,'Qmin')*uh(H_Gen,t)=l= Rh(H_Gen,t) ;
*hydreleaselim2(H_Gen,t).. Rh(H_Gen,t)=l= Hydro_Data(H_Gen,'Qmax')*uh(H_Gen,t);
*hydheadlim1(H_Gen,t).. Hydro_Data(H_Gen,'Vmin')*uh(H_Gen,t)=l= Vh(H_Gen,t) ;
*hydheadlim2(H_Gen,t).. Vh(H_Gen,t)=l= Hydro_Data(H_Gen,'Vmax')*uh(H_Gen,t);
G_Rampup(Gen,t)$(ord(t)>1)..    G(Gen,t) - G(Gen,t-1) =l= Gen_Data(Gen,'R') * u(Gen,t);
G_Rampdown(Gen,t)$(ord(t)>1)..  G(Gen,t-1) - G(Gen,t) =l= Gen_Data(Gen,'R')*u(Gen,t-1);
Gh_Rampup(H_Gen,t)$(ord(t)>1)..    Gh(H_Gen,t) - Gh(H_Gen,t-1) =l= Hydro_Data(H_Gen,'R') * uh(H_Gen,t);
Gh_Rampdown(H_Gen,t)$(ord(t)>1)..  Gh(H_Gen,t-1) - Gh(H_Gen,t) =l= Hydro_Data(H_Gen,'R')*uh(H_Gen,t-1);
G_minuptime(Gen,t,tt)$((ord(tt)> ord(t)- Gen_Data(Gen,'UT')) $(ord(tt) < ord(t)))..  u(Gen,t) =g= u(Gen,tt)-u(Gen,tt-1);
G_mindowntime(Gen,t,tt)$((ord(tt)> ord(t)- Gen_Data(Gen,'DT'))$(ord(tt) < ord(t))).. 1-u(Gen,t) =g= u(Gen,tt-1)- u(Gen,tt);
PXlim(PX_no,t).. PX_G(PX_no,t)+ PX_Uc(PX_no,t) =e= PX_Data(PX_no,'Pmaxx')*PX_Avail(PX_no,t)*p(PX_no,t);
MUST_RUN(MR,t)..  u(MR,t) =e= 1;
MUST_RUN_lim(MR,t).. G(MR,t)=e= Gen_Data(MR,'Pmax');
PV_bal(t).. PV_Ct(t) =e= PV_Act(t,'Sm') - PV_sch(t);
Wind_bal(t).. Wind_Ct(t) =e= Wind_Act(t,'Wm') - Wind_sch(t);
Eq1_Risk.. Risk1 =e= (10**(-7))*[sum(t,(DSM(t)*DSM(t)*Risk_Data(t,'3')))];
Eq2_Risk.. Risk2 =e= (10**(-7))*[sum(t,(DAM(t)*DAM(t)*Risk_Data(t,'6')))];
Eq3_Risk.. Risk3 =e= (10**(-7))*[sum(t,(RTM(t)*RTM(t)*Risk_Data(t,'9')))];
Eq4_Risk.. Risk4 =e= (10**(-7))*(2*{[sum(t,(DSM(t)*DAM(t)*Risk_Data(t,'10')))] + [sum(t,(DAM(t)*RTM(t)*Risk_Data(t,'14')))] + [sum(t,(DSM(t)*RTM(t)*Risk_Data(t,'12')))]});
Eq_Risk..  Risk =e= Risk1 + Risk2 + Risk3 + Risk4;
Final_OF.. Final_cost =e= Total_cost + [alpha*Risk];
TPPC1.. Total_PPC1 =e= [365*Total_cost] + Conv_FC + Hyd_FC;
TPPC2.. Total_PPC2 =e= [365*Final_cost] + Conv_FC + Hyd_FC;

model RE15 /all/;
*RE14.nodlim = 1000;
*option optcr = 0.01;
option MINLP=SBB;

parameter report(counter,*);
loop(counter,
*alpha=(ord(counter))/((10**(6))*(card(counter)));
alpha$(ord(counter)=1)=0.000000001;
alpha$(ord(counter)=2)=0.0000000025;
alpha$(ord(counter)=3)=0.0000000050;
alpha$(ord(counter)=4)=0.0000000075;
alpha$(ord(counter)=5)=0.0000000100;
alpha$(ord(counter)=6)=0.0000000150;
alpha$(ord(counter)=7)=0.0000000200;
alpha$(ord(counter)=8)=0.0000000250;
alpha$(ord(counter)=9)=0.0000000300;
alpha$(ord(counter)=10)=0.0000000350;
alpha$(ord(counter)=11)=0.0000000400;
alpha$(ord(counter)=12)=0.00000011;
alpha$(ord(counter)=13)=0.000000115;
alpha$(ord(counter)=14)=0.00000012;
alpha$(ord(counter)=15)=0.00000044;
alpha$(ord(counter)=16)=0.00000046;
alpha$(ord(counter)=17)=0.00000048;
alpha$(ord(counter)=18)=0.00000050;
solve RE15 using MINLP minimizing Final_cost;
report(counter,'Final_cost')=Final_cost.l;
report(counter,'alpha')=alpha;
report(counter,'Risk')=Risk.l;
);
display report;

execute_unload "RE15.gdx";











