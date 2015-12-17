
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
  mail <- unlist(RMeCabC(mail))
  mail <- subset(mail,mail != "")
  score = prior[cate]
  if(cate == 1){voc = spam.words}
  if(cate == 2){voc = nonspam.words}
  
  for (w in 1:length(mail)){
    zero = TRUE
    for(i in 1:nrow(voc)){
      if(as.character(voc[i,1]) == mail[w]){
        score = score * voc[i,3]
        zero = FALSE
        break
      }
    }
    if(zero == TRUE){
      score = score *(1/(sum(voc[,3])*10))
    }
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
    print(scores)
  }
  return(C)
}


spam.d = gsub("\na","",spam.d)
nonspam.d = gsub("\na","",nonspam.d)
