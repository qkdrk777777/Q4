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

k='2016.09.08'

for(j in 6:14){
  tt=0;del=NULL
  for( k in c('2016.07.21','2016.07.28','2016.08.04','2016.08.11','2016.08.18','2016.08.25','2016.09.01','2016.09.08')){
    if(k%in%c('2016.08.18','2016.08.25'))t=c(1,3,4,5) else if(k%in%c('2016.09.01','2016.09.08'))t=c(1,3,4) else t=1:5
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
write.csv(del2,'토양수분30.csv')

