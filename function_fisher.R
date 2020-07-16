# Plot Fisher function

plot.fisher.matrix<-function(data,p.value=0.05){
      
      # Create the matrix
      fisher.matrix<-matrix(NA,nrow=ncol(data),ncol=ncol(data))
      colnames(fisher.matrix)<-colnames(data)
      rownames(fisher.matrix)<-colnames(data)
      
      # p-values
      p.values.matrix<-matrix(NA,nrow=ncol(data),ncol=ncol(data))
      colnames(p.values.matrix)<-colnames(data)
      rownames(p.values.matrix)<-colnames(data)
      
      # Running the test
      for(i in 1:(ncol(data)-1)){
            for(j in (i+1):ncol(data)){
                  table_data<-table(data[,i],data[,j])
                  aux<-fisher.test(table_data, workspace = 6e8,simulate.p.value = TRUE)
                  fisher.matrix[i,j]<-ifelse(aux$p.value<0.05,paste0("p<",p.value),paste0("p>",p.value))
                  p.values.matrix[i,j]<-aux$p.value
            }
      }
      
      require(plot.matrix)
      plot.matrix<-plot(t(fisher.matrix),col=rev(c("#FD0D39","#6AF07A")),breaks=c(paste0("p<",p.value),paste0("p>",p.value)),
           na.cell=FALSE,key=list(side=3, cex.axis=0.8,las=1),xlab='',ylab='',main="")
      
      return(list(plot=plot.matrix,p.values=p.values.matrix))
}           

