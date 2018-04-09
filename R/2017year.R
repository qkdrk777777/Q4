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
  for( k in c('2017.07.27','2017.08.02','2017.08.09','2017.08.16','2017.08.22','2017.08.30')){
    if(j==7) for(i in 1:5){
        tt<-tt+1
        del[tt]<-print( mean(get(paste0('data',i))[grep(k,get(paste0('data',i))$날짜),j]))
      }     else  for(i in 1:5){
      tt<-tt+1
    if(i==1)del[tt]<-print(mean(
     c(mean(get(paste0('data',2))[grep(k,get(paste0('data',2))$날짜),j])
     ,mean(get(paste0('data',3))[grep(k,get(paste0('data',3))$날짜),j]))))else del[tt]<-
         print( mean(get(paste0('data',i))[grep(k,get(paste0('data',i))$날짜),j]))
    }
  }
  
  del2<-cbind(del2,del)
}

colnames(del2)<-colnames(data)[6:14]

del2<-NULL
setwd('C:/Users/qkdrk/Desktop')
write.csv(del2,'크래이2.csv')

