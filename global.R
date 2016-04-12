source("http://bioconductor.org/biocLite.R")
mpackages=c("dplyr")
for (p in mpackages){
  lapply(p, require, character.only=T) #呼叫mpackages裡的package
  #檢查若p變數裡的package不存在則下載
  if (!lapply(p,exists)[[1]]){ 
    if (!lapply(p, require, character.only=T)[[1]]){ 
      cat(p,"此package不存在下載中","\n") 
      #lapply(p,install.packages) 如果可以的話盡量用biocLite
      lapply(p,biocLite)
      lapply(p, require, character.only=T)
    }
  }
}
