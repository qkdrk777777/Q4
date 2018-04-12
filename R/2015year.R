library(rJava)
library(openxlsx)
library(DUcj)
library(plyr)
setwd('C:\\Users\\qkdrk\\Documents\\카카오톡 받은 파일')
(list<-list.files(pattern=').xlsx'))
data<-read.xlsx(list[1],sheet=2)
newdata<-data
newdata[apply(newdata[,6:14]==0,1,mean)==1,6:ncol(data)]<-NA

for(i in 1:5)  assign(paste0('data',i),data[data[,1]==i, ])
for(i in 1:5)  assign(paste0('newdata',i),newdata[newdata[,1]==i, ])


colnames(newdata)
#i는 지점 j는 변수위치 k는 날짜
del2<-NULL
for(j in c(6:14,16:17)){
  tt=0;del=NULL;dd<-NULL
  d<-NULL
  for( k in c('2015.07.30','2015.08.06','2015.08.13','2015.08.19','2015.08.21','2015.08.27','2015.09.04','2015.09.10')){
    if(k%in%c('2015.07.30','2015.08.06','2015.08.13'))t=c(1,2,4,5) else t=c(1,2,5)
    
    for(i in t){
      dd<-c(dd,i)
      d<-c(d,k)
        tt<-tt+1
      del[tt]<-print( mean(get(paste0('newdata',i))[grep(k,get(paste0('newdata',i))$날짜),j]))
    }
  }
  del2<-cbind(del2,del)
}

del2<-data.frame(d,dd,del2,stringsAsFactors = F)

colnames(del2)<-c('date','지점',colnames(data)[c(6:14,16:17)])

#del2<-NULL
setwd('C:/Users/qkdrk/Desktop')
write.csv(del2,'크래이2015_NA.csv')

