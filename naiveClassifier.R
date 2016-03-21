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

spam.words    <- Voc(spam.d)  ## 辞典を作る（単語、頻度、出現確率）
nonspam.words <- Voc(nonspam.d)


score <- function(mail,cate){
  alpha = 2		### Prior
  score = prior[cate]	### Default Score
  
  mail <- unlist(RMeCabC(mail))				
  mail <- subset(mail,mail != "") 			
  
  if(cate == 1){voc = spam.words}
  if(cate == 2){voc = nonspam.words}
  n = nrow(spam.words) + nrow(nonspam.words)
  
  for (w in 1:length(mail)){
    temp = 0
    for(i in 1:nrow(voc)){
      if(as.character(voc[i,1]) == mail[w]){
        temp = voc[i,2]
        break}
      }
      score = score * (temp + alpha - 1 )/(sum(voc[,2]) + alpha*n)
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
    if(C == 1){
    Mes = "スパムメール"
    }
    if(C == 2){
    Mes = "一般メール"
    }
    if(C == 0){
    Mes = "エラー"
    }
    print(c("p(Spam)","p(non-Spam)"))
    print(scores)
  }
  return(Mes)
}

