#Hw4 Prob3: Generating the data sets

this.dir<-dirname(parent.frame(2)$ofile)
setwd(this.dir)

N<-200
feat<-10
xor_data<-matrix(sample(c(1,0),N*feat,replace=T),N,feat)
vote_data<-matrix(sample(c(1,0),N*feat,replace=T),N,feat)

#Generate labels
t_xor<-matrix(0,N,1)
t_vote<-matrix(0,N,1)
for(i in 1:N){
  t_xor[i]<-sum(xor_data[i,1:3]) %% 2
  if(sum(vote_data[i,1:3]) >= 2){t_vote[i]<-1} else{t_vote[i]<-0}
}

#Putting it together
xor_data<-cbind(xor_data,t_xor)
vote_data<-cbind(vote_data,t_vote)

#Write to file
write.table(xor_data,'xor.csv',row.names=F,col.names=F,sep=',')
write.table(vote_data,'vote.csv',row.names=F,col.names=F,sep=',')

