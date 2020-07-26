library("caret")
library("mlbench")
library("mice")
library("e1071")

sink("Satelite SVM.txt")

data("Satellite")

temp_dados <- Satellite
data <- temp_dados[17:20]
data["classes"] <- temp_dados$classes

imp <- mice(data)

dados <- complete(imp,1)

indices <- createDataPartition(dados$classes, p=0.80,list=FALSE)


treino <- dados[indices,]
teste  <- dados[-indices,]


set.seed(7)

#rf<- train(classes~.,data=treino, method="rf")
svm<- train(classes~.,data=treino, method="svmRadial")
#svm<- svm(classes~.,data=dados, method="svmRadial")
#rna<- train(classes~.,data=treino, method="nnet")



#predict.rf <- predict(rf,teste)
predict.svm <- predict(svm,teste)
#predict.rna <- predict(rna,teste)

table(teste$classes)

#confusionMatrix(predict.rf,teste$classes)
confusionMatrix(predict.svm,teste$classes)
#confusionMatrix(predict.rna,teste$classes)
svm<- svm(classes~.,data=dados, method="svmRadial")

saveRDS(svm,"./satelite_svm.rds")


sink()

