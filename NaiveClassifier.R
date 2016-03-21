### Read Me
### https://raw.githubusercontent.com/dgod1028/Spam-Mail-Japanese-/master/README.txt

### http://taku910.github.io/mecab/
## 上のサイトから mecab_0.996.exe をダウンロードしてインストールします．

##　必要なパッケージ
##  install.packages ("RMeCab", repos = "http://rmecab.jp/R")
##  install.packages("RCurl")
##  install.packages("stringr")
library(RCurl)
library(RMeCab)
library(stringr)

##  ソースコードを読み込む（訓練データ、naive分類器）
sample <-"http://raw.githubusercontent.com/dgod1028/Spam-Mail-Japanese-/master/sample.R"
naive <-  "http://raw.githubusercontent.com/dgod1028/Spam-Mail-Japanese-/master/naiveClassifier.R"
source(sample,encoding = "UTF-8")
source(naive,encoding = "UTF-8")



## 上のソース読み込み失敗した場合だけ
options(RCurlOptions = list(verbose = FALSE, capath = system.file("CurlSSL", "cacert.pem", package = "RCurl"), ssl.verifypeer = FALSE))
##

##　分類実例
classify("悪質なお客様として身辺調査の開始")   ### 1 = spam   2 = nonspam
classify("この度は貴殿が使用されたプロバイダー及び電話回線から接続された有料サイト利用料金について 
運営業者より利用料金支払遅延に関して料金等支払遅延者リスト（ブラックリスト）掲載要請を受けました")
classify("電車が止まっており、出社が遅れそうです。申し訳ありません。 ")

###data       -> spam.d   nonspam.d   spam.words    nonspam.words
###function   -> Voc      classify    score
