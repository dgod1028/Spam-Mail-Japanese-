### http://taku910.github.io/mecab/
## 最初に上のサイトから mecab_0.996.exe をダウンロードしてインストールします．

##　必要なパッケージ
##  install.packages ("RMeCab", repos = "http://rmecab.jp/R")

##　①　MeCabを読み込む

library(RMeCab)

##  ②　訓練データとNaiveBayes分類器を読み込む

source("d:/Spam_Function.R",encoding = "UTF-8")  ##　フォルダは自分で修正が必要です。


##　③新着メールの分類

classify("この度は貴殿が使用されたプロバイダー及び電話回線から接続された有料サイト利用料金について 
         運営業者より利用料金支払遅延に関して料金等支払遅延者リスト（ブラックリスト）掲載要請を受けました")
classify("電車が止まっており、出社が遅れそうです。申し訳ありません。 ")


###data       -> spam.d   nonspam.d   spam.words    nonspam.words
###function   -> Voc      classify    score
