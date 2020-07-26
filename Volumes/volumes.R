library("caret")
library("mlbench")
library("mice")

#sink("volume.txt")

csv <- read.csv2(file = "Volumes.csv",header = TRUE,sep = ";",quote = "")

temp_dados <- csv
temp_dados$NR <- NULL

imp <- mice(temp_dados)

dados <- complete(imp,1)


indices <- createDataPartition(dados$VOL, p=0.80,list=FALSE)

treino <- dados[indices,]
teste  <- dados[-indices,]

set.seed(7)

alom <- nls(VOL ~ b0 + b1*DAP*DAP*HT, dados, start=list(b0=0.5, b1=0.5))

#redeNeural<- train(VOL~.,data=treino, method="neuralnet")
#rf<- train(classes~.,data=treino, method="rf")
#svm<- train(classes~.,data=treino, method="svmRadial")
#warnings()



#predict.rf <- predict(rf,teste)
#predict.svm <- predict(svm,teste)

#predict.redeNeural <- predict(redeNeural,teste)

predict.alom <- predict(alom,teste)

teste$VOL <- as.factor(teste$VOL)
predict.alom <- as.factor(predict.alom)


confusionMatrix(predict.alom,teste$VOL)
#confusionMatrix(predict.rf,teste$classes)
#confusionMatrix(predict.svm,teste$classes)
#confusionMatrix(predict.redeNeural ,teste$VOL)

#print(str(predict.alom))




saveRDS(rf,"./volumes.rds")
#sink()
