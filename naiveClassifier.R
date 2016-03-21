
Voc = function(x){
	word = list()
	for(i in 1:length(x)){
		word[[i]] = RMeCabC(x[[i]])
	}
	word.t = table(unlist(word))
	voc= data.frame(name = names(word.t),
	frequancy = as.vector(word.t),
	density = as.vector(word.t)/sum(word.t)) 
	return(voc)
}


score <- function(mail,cate){
  alpha = 2
  mail <- unlist(RMeCabC(mail))
  mail <- subset(mail,mail != "")
  
  if(cate == 1){voc = spam.words}
  if(cate == 2){voc = nonspam.words}
  n = nrow(spam.words) + nrow(nonspam.words)
  
  for (w in 1:length(mail)){
    temp = 0
    for(i in 1:nrow(voc)){
      if(as.character(voc[i,1]) == mail[w]){
        temp = voc[i,3]
        break}
      }
      score = prior[cate] * (temp + alpha - 1 )/(sum(voc[,3]) + alpha*n)
    }
    
  return(score)
}



classify <- function(mail){
  class = c()
  scores=c()
  for(n in 1:length(mail)){
    for(i in 1:2){
      scores[i] = score(mail[n],i)
    }
    
    C = which(scores==max(scores))
    print(c("p(Spam)","p(non-Spam)"))
    print(scores)
  }
  return(C)
}

