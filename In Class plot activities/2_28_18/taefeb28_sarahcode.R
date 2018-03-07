
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

###Combining datasets
names<-c("X1","Age..ybp","Year","BSI.Mar..mgSi02.cm2y.")
names2<-c("X1","Year","BSi","Charcoal","TEX86")
names(TidyTang)<-names2
names(Tidydatamalawi)<-names
newlakedata<-full_join(TidyChalla,Tidydatamalawi) 
newlakedata<-full_join(newlakedata, TidyTang)
newlakedata<-full_join(newlakedata,VOItidy)
#newlakedata<-full_join(newlakedata,lakedata4)

newlakedata1<-select(newlakedata, -X1,-Age..ybp,-Month)

#ggplot(data=newlakedata1)+geom_smooth(aes(x=Year, y=n),se=FALSE,color="red")+geom_smooth(aes(x=Year,y=BSI.Mar..mgSi02.cm2y.),se=FALSE,color="pink")+geom_smooth(aes(x=Year,y=rainfall),se=FALSE,color="blue")+geom_smooth(aes(x=Year,y=TEX86),se=FALSE,color="green")

#ggplot(data=newlakedata1)+geom_smooth(aes(x=Year, y=n),se=FALSE,color="red")+geom_smooth(aes(x=Year,y=BSI.Mar..mgSi02.cm2y.),se=FALSE,color="pink")+geom_smooth(aes(x=Year,y=TEX86),se=FALSE,color="green")+geom_smooth(aes(x=Year,y=BSi),se=FALSE,color="orange")+geom_smooth(aes(x=Year,y=Charcoal),se=FALSE,color="black")
newdata2<-filter(newlakedata1, Year>-1000)
ggplot(data=newdata2)+geom_smooth(aes(x=Year, y=n),se=FALSE,color="red")+geom_smooth(aes(x=Year,y=BSI.Mar..mgSi02.cm2y.),se=FALSE,color="pink")+geom_smooth(aes(x=Year,y=TEX86),se=FALSE,color="green")+geom_smooth(aes(x=Year,y=BSi),se=FALSE,color="orange")+geom_smooth(aes(x=Year,y=Charcoal),se=FALSE,color="black")

                                                                                                                                                                                                                                                                               