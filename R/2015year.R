library(rJava)
library(openxlsx)
library(DUcj)
library(plyr)
setwd('C:\\Users\\qkdrk\\Documents\\카카오톡 받은 파일')
(list<-list.files(pattern=').xlsx'))
data<-read.xlsx(list[1],sheet=2)
for(i in 1:5)  assign(paste0('data',i),data[data[,1]==i, ])

colnames(data)
#i는 지점 j는 변수위치 k는 날짜



del2<-NULL
for(j in 6:14){
  tt=0;del=NULL
  for( k in c('2015.07.30','2015.08.06','2015.08.13','2015.08.19','2015.08.21','2015.08.27','2015.09.04','2015.09.10')){
    if(k%in%c('2015.07.30','2015.08.06','2015.08.13'))t=c(1,2,4,5) else t=c(1,2,5)
    for(i in t){
      tt<-tt+1
      del[tt]<-print( mean(get(paste0('data',i))[grep(k,get(paste0('data',i))$날짜),j]))
    }
  }
  del2<-cbind(del2,del)
}
colnames(del2)<-colnames(data)[6:14]

del2<-NULL
setwd('C:/Users/qkdrk/Desktop')
write.csv(del2,'크래이2015.csv')

