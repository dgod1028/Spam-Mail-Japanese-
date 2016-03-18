### http://taku910.github.io/mecab/
## 上のサイトから mecab_0.996.exe をダウンロードしてインストールします．

##　必要なパッケージ
##  install.packages ("RMeCab", repos = "http://rmecab.jp/R")
##  install.packages("RCurl")
##  install.packages("stringr")
library(RCurl)
library(RMeCab)
library(stringr)


### ソース読み込み失敗した場合だけしたのコメント
options(RCurlOptions = list(verbose = FALSE, capath = system.file("CurlSSL", "cacert.pem", package = "RCurl"), ssl.verifypeer = FALSE))
###

##  ソースコードを読み込む（訓練データ、naive分類器）
sample <-"http://raw.githubusercontent.com/dgod1028/Spam-Mail-Japanese-/master/sample.R"
naive <-  "http://raw.githubusercontent.com/dgod1028/Spam-Mail-Japanese-/master/naiveClassifier.R"
source(sample,encoding = "UTF-8")
source(naive)
Voc
score
classify
spam.d       ## spam.d = スパムメールサンプル
nonspam.d    ##  nonspam.d = 普通メールサンプル

spam.words <- Voc(spam.d)  ## 辞典を作る（単語、頻度、出現確率）
spam.words
nonspam.words <- Voc(nonspam.d)
nonspam.words


prior=c()
total = length(spam.d) + length(nonspam.d)
prior[1]=length(spam.d)/ total  ## スパムの事前確率
prior[2]=length(nonspam.d)/ total ##　普通メールの事前確率


classify("悪質なお客様として身辺調査の開始")   ### 1 = spam   2 = nonspam
classify("この度は貴殿が使用されたプロバイダー及び電話回線から接続された有料サイト利用料金について 
運営業者より利用料金支払遅延に関して料金等支払遅延者リスト（ブラックリスト）掲載要請を受けました。
これまで貴殿のネットワーク利用料に付きましては、コンテンツ事業者様及び債権回収業者が再三の ご連絡を試みてまいりましたが、
         未だ入金の確認がとれず、また貴殿より誠意ある回答も遺憾ながら 本日に至るまで頂いておりません。 ")
classify("電車が止まっており、出社が遅れそうです。申し訳ありません。 ")

