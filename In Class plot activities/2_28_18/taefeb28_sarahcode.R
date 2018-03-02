
####
lakedata <- read_csv("Data Science with R/lakedata.csv")
lakedata1<-lakedata[,1:5]
names<-c("Year","GPCC_MAM_Normalized", "CRU_MAM_Normalized", "GPCC_OND_Normalized", "CRU_OND_Normalized")
names(lakedata1)<-names
lakedata2<-as.tibble(lakedata1)
lakedata2<-lakedata2 %>% gather(`GPCC_MAM_Normalized`,`CRU_MAM_Normalized`,`GPCC_OND_Normalized`,`CRU_OND_Normalized`, key='Type',value=`Rainfall`)                                                                                                                                                                                                                                                                                                      
lakedata4<-lakedata2 %>%separate(Type, into=c("Dataset","Season"),sep="_",extra="drop")
ggplot(data=lakedata4)+geom_smooth(aes(x=Year,y=rainfall,color=Dataset),se=FALSE)+facet_wrap(~Season)
write.csv(lakedata4, file="CRU_MAM_Rainfall.csv")