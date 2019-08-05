################################################################################

library("readxl")
library("XLConnect")

################################################################################

setwd("D://alf")

con=read.csv("Consumption_data.csv",sep=";")
mat=con
attach(con)

res=data.frame(country,COUNTRY_cons_average_adolescent=Adolescent_mean/Adolescent_weight,
               COUNTRY_cons_p95_adolescent=Adolescent_95/Adolescent_weight,
               COUNTRY_cons_average_adult=Adult_mean/Adult_weight,
               COUNTRY_cons_p95_adult=Adult_95/Adult_weight,
               COUNTRY_cons_average_elderly=Elderly_mean/Elderly_weight,
               COUNTRY_cons_p95_elderly=Elderly_95/Elderly_weight)


################################################################################

ALL_cons_average_adolescent=mean(Adolescent_mean,na.rm=T)/mean(Adolescent_weight,na.rm=T)
ALL_cons_p95_adolescent=mean(Adolescent_95,na.rm=T)/mean(Adolescent_weight,na.rm=T)
ALL_cons_average_adult=mean(Adult_mean,na.rm=T)/mean(Adult_weight,na.rm=T)
ALL_cons_p95_adult=mean(Adult_95,na.rm=T)/mean(Adult_weight,na.rm=T)
ALL_cons_average_elderly=mean(Elderly_mean,na.rm=T)/mean(Elderly_weight,na.rm=T)
ALL_cons_p95_elderly=mean(Elderly_95,na.rm=T)/mean(Elderly_weight,na.rm=T)

################################################################################

#  read occurrence&co_final_RP 

open all_cereals_FINALE_RP_29_07.xls

for sample_country = 1:n

if co_occurrence == 0 && sampMatType == food && sampMatbased == wheat | oat | barley | triticale | spelt | sorghum | rye | cereals | rice | buckwheat | maize

if paramType == AcDONs | 15AcDON | 3AcDON | 15AcDON+3AcDON | aZEL | aZEL4G | DON | DON3G | FB1 | FB1+FB2 | FB2 | FB3 | FBs | NIV | OTA | ßZEL | ßZEL4G | T2+HT2 | ZEN | ZEN4G | ZEN4S | ZEN16G

%% WRITE ALL DATA MEDIUM LOW AND UPPER BOUND (MB, LB, UB)

if meanTot>0 |meanPos>0 | Concentration>0 save value

else  %%%% (if LOD==NAN => LOD=5; if LOQ==NAN => LOQ=10)

meanTot==-1 |meanPos==-1 | Concentration==-1 save value=0 for LB
meanTot==-2 |meanPos==-2 | Concentration==-2 save value=resLOD for LB

meanTot==-1 |meanPos==-1 | Concentration==-1 save value=0.5*resLOD for MB
meanTot==-2 |meanPos==-2 | Concentration==-2 save value=0.5*resLOQ for MB

meanTot==-1 |meanPos==-1 | Concentration==-1 save value=resLOD for UB
meanTot==-2 |meanPos==-2 | Concentration==-2 save value=resLOQ for UB

for n records write

sample_country; MB; LB; UB 

end
end
end
end
end