#  ------------------------------------------------------------------------
#
#   Read data and assign good classes to each variable
#
#
#  ------------------------------------------------------------------------


# Package -----------------------------------------------------------------

library(data.table)


# Read datas --------------------------------------------------------------

# dictonnary of variables created from infos that we have
dic_var = data.table::fread("./R_in/dictionnaire_variables.csv")
# dictonnary of levels of categoricals created from infos that we have
dic_nvx = data.table::fread("./R_in/dictionnaire_niveaux.csv")

# read train dataset
train = fread("./Datas/train.csv", stringsAsFactors = FALSE, colClasses = "character")
# read test dataset
test  = fread("./Datas/test.csv", stringsAsFactors = FALSE, colClasses = "character")



# Add columns  ------------------------------------------------------------

datas = rbindlist(list(train, test), use.names = T, fill = T)
datas[is.na(SalePrice), set := "test"]
datas[!is.na(SalePrice), set := "train"]
datas[, set := factor(set, levels = c("train", "test"))]





# Apply good format -------------------------------------------------------

datas.format = do.call(cbind, lapply(seq_along(dic_var$Variable), function(line) {
  
  var  =  dic_var[line, Variable]
  type =  dic_var[line, Type]
  
  res = NULL
  
  print(var)
  
  if(type == "Nominal") {
    
    lvls = dic_nvx[Variable == var, Niveau]
    lbls = dic_nvx[Variable == var, Libelle]
    lbls = lbls[!is.na(lvls)]
    
    res  = factor(datas[[var]], levels = lvls)
    
  } else if (type == "Ordinal"){
    
    lvls = dic_nvx[Variable == var, Niveau]
    lbls = dic_nvx[Variable == var, Libelle]
    lbls = lbls[!is.na(lvls)]

    res  = ordered(datas[[var]], levels = lvls)
    
  } else if (type == "Discrete" | type == "Continuous") {
    
    res = as.numeric(datas[[var]])
    
  }

  res = data.table(res)
  colnames(res) = var
  res  
}))



# Conclusion --------------------------------------------------------------

dataset = cbind(Id = datas$Id, set = datas$set, datas.format, logSalePrice = log(datas.format$SalePrice))

saveRDS(dataset, "./Datas/dataset_format.RDS")

