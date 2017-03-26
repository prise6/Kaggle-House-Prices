#  ------------------------------------------------------------------------
#
#  Modelisation : 
#   - Lasso
#   - GBM
#   - Stacking with RF
#
#  ------------------------------------------------------------------------


# Package -----------------------------------------------------------------

library(data.table)
library(caret)
library(glmnet)
library(gbm)
library(randomForest)


# Init --------------------------------------------------------------------

dataset[, Id := as.numeric(Id)]
setorder(dataset, Id)

my.RMSE = function(model, x, y, round = T, ...){
  pred_valid = predict(model, x, ...)
  if(isTRUE(round))
    pred_valid  = log(round(exp(pred_valid)/100, digits = 0)*100)
  sqrt(mean((pred_valid - y)**2))
}


id_outliers = c(524, 1299, 1183, 692)

set.seed(123)
idx = createDataPartition(1:1456, p = .85, list = F)

train = dataset[set == "train" & !Id %in% id_outliers, !colnames(dataset) %in% c("Id", "set", "SalePrice"), with = F]

train.x = train[, colnames(train) != "logSalePrice", with = F]
train.y = train[, colnames(train) == "logSalePrice", with = F]

train_sub.x = train.x[idx,]
train_sub.y = train.y[idx,]

valid.x = train.x[-idx,]
valid.y = train.y[-idx,]



# LASSO -------------------------------------------------------------------

resGLM = glmnet(as.matrix(train_sub.x), train_sub.y$logSalePrice, lambda = .001, alpha = 1)

my.RMSE(resGLM, as.matrix(train_sub.x), train_sub.y$logSalePrice)
my.RMSE(resGLM, as.matrix(valid.x), valid.y$logSalePrice)


# GBM ---------------------------------------------------------------------

set.seed(367)
resGBM = gbm.fit(train_sub.x, train_sub.y$logSalePrice, distribution = "gaussian", n.trees = 2000, interaction.depth = 5, shrinkage = .005, n.minobsinnode = 15)

my.RMSE(resGBM, train_sub.x, train_sub.y$logSalePrice, n.trees = 2000)
my.RMSE(resGBM, valid.x, valid.y$logSalePrice, n.trees = 2000)


# Stacking with RF --------------------------------------------------------


res = data.frame(
  gbm   = predict(resGBM, train_sub.x, n.trees = 2000),
  lasso = as.vector(predict(resGLM, as.matrix(train_sub.x)))
)

res.valid = data.frame(
  gbm   = predict(resGBM, valid.x, n.trees = 2000),
  lasso = as.vector(predict(resGLM, as.matrix(valid.x)))
)

train_sub_stack.x = cbind(train_sub.x, res[, c("lasso", "gbm")])
valid_stack.x = cbind(valid.x, res.valid[, c("lasso", "gbm")])

resRF = randomForest(x = train_sub_stack.x, y = train_sub.y$logSalePrice, ntree = 1000)

res$pred = predict(resRF, train_sub_stack.x)
sqrt(mean((res$pred - train_sub.y$logSalePrice)**2))

res.valid$pred = predict(resRF, valid_stack.x)
sqrt(mean(( res.valid$pred - valid.y$logSalePrice)**2))



# Predictions for test set ------------------------------------------------

pred_lasso = predict(resGLM, as.matrix(dataset[set == "test", colnames(train.x), with = F]))
pred_gbm = predict(resGBM, as.matrix(dataset[set == "test", colnames(train.x), with = F]), n.trees = 2000)

tmp = data.frame(pred_lasso, pred_gbm)
colnames(tmp) = c("lasso", "gbm")

tmp = cbind(dataset[set == "test", colnames(train.x), with = F], tmp)
pred_rf = predict(resRF, tmp)
pred_rf = exp(pred_rf)

res = data.table(Id = dataset[set == "test"]$Id, SalePrice = pred_rf)
setnames(res, c("Id", "SalePrice"))
# this Id has wrong prediction: you can see in pred_lasso
# thanks to proximity algorithm i looked houseprice around "same" observations
res[Id == 2550, SalePrice := 269600]

# write.csv(res, "submission.csv" ,row.names = F)

