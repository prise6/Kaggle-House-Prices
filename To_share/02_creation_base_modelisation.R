#  ------------------------------------------------------------------------
#
#  Create modelisation dataset.
#  Voluntary, i wanted to compute every variable one by one
#
#  ------------------------------------------------------------------------



# Packages ----------------------------------------------------------------

library(data.table)
library(mice)


# init --------------------------------------------------------------------

set.seed(123)


# Read datas --------------------------------------------------------------

train = fread("./Datas/train.csv", stringsAsFactors = F)
test  = fread("./Datas/test.csv", stringsAsFactors = F)

# neighboorhood details collecteed thanks to website www.addressreport.com
ngbr_details = data.table::fread("./R_in/Neighborhood_details.csv", stringsAsFactors = F)


# Add columns -------------------------------------------------------------

datas = rbindlist(list(train, test), use.names = T, fill = T)
datas[is.na(SalePrice), set := "test"]
datas[!is.na(SalePrice), set := "train"]
datas[, set := factor(set, levels = c("train", "test"))]
datas[, logSalePrice := log(SalePrice)]
datas[, MSSubClass := as.character(MSSubClass)]

dataset = copy(datas)

# Garage ------------------------------------------------------------------

#
# Garages Variables
#


garages_vars = c("GarageFinish", "GarageQual", "GarageCond", "GarageType", "GarageYrBlt", "GarageCars", "GarageArea")

# recherche des NA's:
# md.pattern(dataset[, garages_vars, with = F])

dataset[!is.na(GarageType) & is.na(GarageFinish)]
dataset[Id == 2127]
dataset[Id == 2577]


summary(dataset[!is.na(GarageYrBlt), GarageYrBlt - YearBuilt])

dataset[Id == 2127, `:=` (
  GarageFinish = "Unf",
  GarageQual = "TA",
  GarageCond = "TA",
  GarageYrBlt = YearBuilt + 5
)]

dataset[Id == 2577, garages_vars, with = F]
dataset[Id == 2577, `:=` (
  GarageType = NA,
  GarageCars = 0,
  GarageArea = 0
)]




# Complete for people who doens't have garages 

dataset[is.na(GarageType), ]

dic_old = c(NA_character_, "Po", "Fa", "TA", "Gd", "Ex")
dic_new = 0:5

dataset$GarageQual = dic_new[match(dataset$GarageQual, dic_old)]
dataset$GarageCond = dic_new[match(dataset$GarageCond, dic_old)]

dic_old = c(NA_character_, "Unf", "RFn", "Fin")
dic_new = 0:3

dataset$GarageFinish = dic_new[match(dataset$GarageFinish, dic_old)]

dataset[is.na(GarageYrBlt), GarageYrBlt := 0] 

dataset[is.na(GarageType), GarageType := ""]
dataset[, `:=` (
  GarageType2Types  = as.numeric(GarageType == "2Types"),
  GarageTypeAttchd  = as.numeric(GarageType == "Attchd"), 
  GarageTypeBasment = as.numeric(GarageType == "Basment"),
  GarageTypeBuiltIn = as.numeric(GarageType == "BuiltIn"),
  GarageTypeCarPort = as.numeric(GarageType == "CarPort"),
  GarageTypeDetchd  = as.numeric(GarageType == "Detchd"),
  GarageType        = NULL
)]



# Bsmt --------------------------------------------------------------------


#
# Variable de Bsmt
#


bsmt_vars = c("BsmtCond", "BsmtExposure", "BsmtQual", "BsmtFinType2", "BsmtFinSF1", "BsmtFinType1", "BsmtFinSF2", "BsmtUnfSF", "TotalBsmtSF", "BsmtFullBath", "BsmtHalfBath")

# md.pattern(dataset[, bsmt_vars, with = F])

dataset[is.na(BsmtCond) & !is.na(BsmtExposure) & !is.na(BsmtQual) & !is.na(BsmtFinType2) & !is.na(BsmtFinSF1) & 
          !is.na(BsmtFinType1) & !is.na(BsmtFinSF2) & !is.na(BsmtUnfSF) & !is.na(TotalBsmtSF) & !is.na(BsmtFullBath) & !is.na(BsmtHalfBath),
        c("Id", bsmt_vars), with = F]

dataset[Id %in% c(2041, 2186, 2525), BsmtCond := "TA"]


dataset[!is.na(BsmtCond) & is.na(BsmtExposure) & !is.na(BsmtQual) & !is.na(BsmtFinType2) & !is.na(BsmtFinSF1) & 
          !is.na(BsmtFinType1) & !is.na(BsmtFinSF2) & !is.na(BsmtUnfSF) & !is.na(TotalBsmtSF) & !is.na(BsmtFullBath) & !is.na(BsmtHalfBath),
        c("Id", bsmt_vars), with = F]

dataset[Id %in% c(949, 1488, 2349), BsmtExposure := "No"]


dataset[!is.na(BsmtCond) & !is.na(BsmtExposure) & is.na(BsmtQual) & !is.na(BsmtFinType2) & !is.na(BsmtFinSF1) & 
          !is.na(BsmtFinType1) & !is.na(BsmtFinSF2) & !is.na(BsmtUnfSF) & !is.na(TotalBsmtSF) & !is.na(BsmtFullBath) & !is.na(BsmtHalfBath),
        c("Id", bsmt_vars), with = F]

dataset[Id %in% c(2218, 2219), BsmtQual := "TA"]


dataset[!is.na(BsmtCond) & !is.na(BsmtExposure) & !is.na(BsmtQual) & is.na(BsmtFinType2) & !is.na(BsmtFinSF1) & 
          !is.na(BsmtFinType1) & !is.na(BsmtFinSF2) & !is.na(BsmtUnfSF) & !is.na(TotalBsmtSF) & !is.na(BsmtFullBath) & !is.na(BsmtHalfBath),
        c("Id", bsmt_vars), with = F]

dataset[Id == 333, BsmtFinType2 := "Unf"]

dataset[Id == 2121, `:=` (
  BsmtFinSF1  = 0,
  BsmtFinSF2  = 0,
  BsmtUnfSF   = 0,
  TotalBsmtSF = 0
)]

dataset[Id %in% c(2121, 2189), BsmtFullBath := 0]
dataset[Id %in% c(2121, 2189), BsmtHalfBath := 0]


dic_old = c(NA_character_, "Po", "Fa", "TA", "Gd", "Ex")
dic_new = 0:5

dataset$BsmtCond = dic_new[match(dataset$BsmtCond, dic_old)]
dataset$BsmtQual = dic_new[match(dataset$BsmtQual, dic_old)]


dic_old = c(NA_character_, "No", "Mn", "Av", "Gd")
dic_new = 0:4

dataset$BsmtExposure = dic_new[match(dataset$BsmtExposure, dic_old)]


dic_old = c(NA_character_, "Unf", "LwQ", "Rec", "BLQ", "ALQ", "GLQ")
dic_new = 0:6

dataset$BsmtFinType1 = dic_new[match(dataset$BsmtFinType1, dic_old)]
dataset$BsmtFinType2 = dic_new[match(dataset$BsmtFinType2, dic_old)]




# MSSubClass --------------------------------------------------------------

#
# MSSubClass
#

table(dataset$MSSubClass)
dataset[, list(meanSalePrice = mean(SalePrice, na.rm = T), sd(SalePrice, na.rm = T), .N), by = "MSSubClass"][order(meanSalePrice)]

dic = data.table(
  MSSubClass  = as.character(c(30, 180, 45, 190, 90, 160, 50, 85, 40, 70, 80, 20, 75, 120, 60, 150)),
  MSSubClass2 = c("A", "A", "A", "B", "B", "B", "C", "C", "D", "D", "D", "E", "E", "F", "F", "E")
)

dataset = dataset[dic, on = "MSSubClass"]
dataset$MSSubClass = NULL

dataset[, `:=` (
  MSSubClassA = as.numeric(MSSubClass2 == "A"),
  MSSubClassB = as.numeric(MSSubClass2 == "B"), 
  MSSubClassC = as.numeric(MSSubClass2 == "C"),
  MSSubClassD = as.numeric(MSSubClass2 == "D"),
  MSSubClassE = as.numeric(MSSubClass2 == "E"),
  MSSubClassF = as.numeric(MSSubClass2 == "F"),
  MSSubClass2 = NULL
)]



# MSZoning ----------------------------------------------------------------

#
# MSZoning
#

dataset[is.na(MSZoning), MSZoning := "RL"]

dataset[, `:=` (
  MSZoningC  = as.numeric(MSZoning == "C (all)"),
  MSZoningFV = as.numeric(MSZoning == "FV"), 
  MSZoningRH = as.numeric(MSZoning == "RH"),
  MSZoningRL = as.numeric(MSZoning == "RL"),
  MSZoningRM = as.numeric(MSZoning == "RM"),
  MSZoning = NULL
)]



# LotFrontage -------------------------------------------------------------

#
# LotFrontage
#

# > 200 ?
dataset[is.na(LotFrontage), LotFrontage := 0]



# Street ------------------------------------------------------------------

#
# Street
#

dataset[, `:=` (
  StreetPave = as.numeric(Street == "Pave"),
  Street     = NULL
)]



# Alley -------------------------------------------------------------------

# 
# Alley
# 

dataset[, `:=` (
  HasAlley = as.numeric(!is.na(Alley)),
  Alley    = NULL
)]



# LotShape ----------------------------------------------------------------

#
# LotShape
#

dataset[LotShape %in% c("IR1", "IR2", "IR3"), LotShapeIrr := 1]
dataset[is.na(LotShapeIrr), LotShapeIrr := 0]
dataset$LotShape = NULL


# LandContour -------------------------------------------------------------

#
# LandContour
#

dataset[, LandContourLvl := as.numeric(LandContour == "Lvl")]
dataset$LandContour = NULL


# Utilities ---------------------------------------------------------------

#
# Utilities
#

dataset$Utilities = NULL




# LotConfig ---------------------------------------------------------------

#
# LotConfig
#


dataset[, `:=` (
  LotConfigCorner  = as.numeric(LotConfig == "Corner"),
  LotConfigCulDSac = as.numeric(LotConfig == "CulDSac"), 
  LotConfigFR2     = as.numeric(LotConfig == "FR2"),
  LotConfigFR3     = as.numeric(LotConfig == "FR3"),
  LotConfigInside  = as.numeric(LotConfig == "Inside"),
  LotConfig = NULL
)]



# LandSlope ---------------------------------------------------------------

#
# LandSlope
#

dataset[, LandSlopeGtl := as.numeric(LandSlope == "Gtl")]
dataset$LandSlope = NULL


# Neighborhood ------------------------------------------------------------

#
# details
#

# complete with details of www.addressreport.com website
ngbr_details[is.na(Location), Location := "NN"]
ngbr_details[is.na(Cost_of_living), Cost_of_living := -18]
ngbr_details[is.na(Income), Income := 46358]
ngbr_details[is.na(Owners), Owners:= 43]
ngbr_details[is.na(Annual_property_tax), Annual_property_tax := 2479]
ngbr_details[is.na(School), School := 8]
ngbr_details[is.na(Crime), Crime := -28]

sum(is.na(ngbr_details[, -11, with = F]))

ngbr_details = ngbr_details[, -c(2, 11), with = F]

setnames(ngbr_details,
         old = c("Location", "Cost_of_living", "Income", "Owners", "Annual_property_tax", "School", "Crime"),
         new = paste0("Ngbr_", c("Location", "Cost_of_living", "Income", "Owners", "Annual_property_tax", "School", "Crime")))

ngbr_details[, `:=` (
  Ngbr_Location_WW     = as.numeric(Ngbr_Location == "WW"),
  Ngbr_Location_SS     = as.numeric(Ngbr_Location == "SS"),
  Ngbr_Location_Center = as.numeric(Ngbr_Location == "Center"),
  Ngbr_Location_NN     = as.numeric(Ngbr_Location == "NN"),
  Ngbr_Location        = NULL
)]

dataset = merge(dataset, ngbr_details, all.x = T, by = "Neighborhood")


#
# Neighborhood
#

tmp = dataset[, list(
  medLogSalePrice  = median(logSalePrice, na.rm = T),
  medSalePrice     = median(SalePrice, na.rm = T),
  N                = .N,
  meanLogSalePrice = mean(SalePrice, na.rm = T),
  meanSalePrice    = mean(SalePrice, na.rm = T),
  sdLogSalePrice   = sd(SalePrice, na.rm = T),
  sdSalePrice      = sd(SalePrice, na.rm = T)
  ), by = "Neighborhood"][order(medLogSalePrice)]

km = kmeans(tmp[, 2:8], centers = 10, iter.max = 200)

dic = data.table(
  Neighborhood   = tmp$Neighborhood,
  NeighborhoodCl = km$cluster
)

dataset = dataset[dic, on = "Neighborhood"]
dataset$Neighborhood = NULL

dataset[, `:=` (
  Neighborhood1  = as.numeric(NeighborhoodCl == 1),
  Neighborhood2  = as.numeric(NeighborhoodCl == 2),
  Neighborhood3  = as.numeric(NeighborhoodCl == 3),
  Neighborhood4  = as.numeric(NeighborhoodCl == 4),
  Neighborhood5  = as.numeric(NeighborhoodCl == 5),
  Neighborhood6  = as.numeric(NeighborhoodCl == 6),
  Neighborhood7  = as.numeric(NeighborhoodCl == 7),
  Neighborhood8  = as.numeric(NeighborhoodCl == 8),
  Neighborhood9  = as.numeric(NeighborhoodCl == 9),
  Neighborhood10 = as.numeric(NeighborhoodCl == 10),
  NeighborhoodCl = NULL
)]


# Condition1 --------------------------------------------------------------

#
# Condition1  & Condition2
#

dataset[, list(Condition1, Condition2)][Condition1 != Condition2]

levels(dataset$Condition1)

dataset[, `:=` (
  ConditionArtery = as.numeric("Artery" == Condition1 | "Artery" == Condition2),
  ConditionFeedr  = as.numeric("Feedr" == Condition1 | "Feedr" == Condition2),
  ConditionNorm   = as.numeric("Norm" == Condition1 | "Norm" == Condition2),
  ConditionRRNn   = as.numeric("RRNn" == Condition1 | "RRNn" == Condition2),
  ConditionRRAn   = as.numeric("RRAn" == Condition1 | "RRAn" == Condition2),
  ConditionPosN   = as.numeric("PosN" == Condition1 | "PosN" == Condition2),
  ConditionPosA   = as.numeric("PosA" == Condition1 | "PosA" == Condition2),
  ConditionRRNe   = as.numeric("RRNe" == Condition1 | "RRNe" == Condition2),
  ConditionRRAe   = as.numeric("RRAe" == Condition1 | "RRAe" == Condition2),
  hasTwoCondition = as.numeric(Condition1 != Condition2),
  Condition1      = NULL,
  Condition2      = NULL
)]



# BldgType ----------------------------------------------------------------

#
# BldgType
#
 
dataset[, `:=` (
  BldgType1Fam   = as.numeric(BldgType == "1Fam"),
  BldgType2fmCon = as.numeric(BldgType == "2fmCon"), 
  BldgTypeDuplex = as.numeric(BldgType == "Duplex"),
  BldgTypeTwnhs  = as.numeric(BldgType == "Twnhs"),
  BldgTypeTwnhsE = as.numeric(BldgType == "TwnhsE"),
  BldgType       = NULL
)]



# HouseStyle --------------------------------------------------------------

#
# HouseStyle
#

# NbrStory
dataset[HouseStyle %in% c("1Story", "SFoyer", "SLvl") , HouseStyleNbrStory := 1]
dataset[HouseStyle %in% c("1.5Fin", "1.5Unf"),        HouseStyleNbrStory := 1.5]
dataset[HouseStyle %in% c("2Story") ,                   HouseStyleNbrStory := 2]
dataset[HouseStyle %in% c("2.5Fin", "2.5Unf"),          HouseStyleNbrStory := 2.5]

# Split?
dataset[, HouseStyleSplit := as.numeric(HouseStyle %in% c("SFoyer", "SLvl"))]

# Unfinished?
dataset[, HouseStyleUnf := as.numeric(HouseStyle %in% c("2.5Unf", "1.5Unf"))]

dataset$HouseStyle = NULL


# OverallQual -------------------------------------------------------------

#
# OverallQual
#

dic_old = as.character(1:10)
dic_new = 1:10

dataset$OverallQual = dic_new[match(dataset$OverallQual, dic_old)]



# OverallCond -------------------------------------------------------------

#
# OverallCond
#

dic_old = as.character(1:10)
dic_new = 1:10

dataset$OverallCond = dic_new[match(dataset$OverallCond, dic_old)]


# YearRemodAdd ------------------------------------------------------------

#
# YearRemodAdd
#

model = lm(YearRemodAdd~YearBuilt, data = dataset[YearBuilt > 1950])
dataset[YearBuilt<= 1950, YearRemodAdd := as.integer(round(predict(model, data.frame(YearBuilt)), digits = 0))]
dataset[YearBuilt<= 1950, YearRemodAddBefore50 := 1]
dataset[YearBuilt> 1950, YearRemodAddBefore50 := 0]
dataset[, isRemod := as.numeric(YearBuilt != YearRemodAdd)]



# RoofStyle ---------------------------------------------------------------

#
# RoofStyle
#

dataset[, `:=` (
  RoofStyleFlat    = as.numeric(RoofStyle == "Flat"),
  RoofStyleGable   = as.numeric(RoofStyle == "Gable"),
  RoofStyleGambrel = as.numeric(RoofStyle == "Gambrel"),
  RoofStyleHip     = as.numeric(RoofStyle == "Hip"),
  RoofStyleShed    = as.numeric(RoofStyle == "Shed"),
  RoofStyleMansard = as.numeric(RoofStyle == "Mansard"),
  RoofStyle        = NULL
)]




# RoofMatl ----------------------------------------------------------------

#
# RoofMatl
# 


dataset[, `:=` (
  RoofMatlCompShg = as.numeric(RoofMatl == "CompShg"),
  RoofMatlTarGrv  = as.numeric(RoofMatl == "Tar&Grv"),
  RoofMatlWood    = as.numeric(substr(RoofMatl, 1, 2) == "Wd"),
  RoofMatl        = NULL
)]



# Exterior1st -------------------------------------------------------------

#
# Exterior1st & Exterior2nd
#

dataset[is.na(Exterior1st), Exterior1st := "VinylSd"]
dataset[is.na(Exterior2nd), Exterior2nd := "VinylSd"]
dataset[, list(meanSalePrice = mean(SalePrice, na.rm = T), sd(SalePrice, na.rm = T), .N), by = "Exterior1st"][order(N)]

dataset[, `:=` (
  ExteriorVinylSd = as.numeric("VinylSd" == Exterior1st | "VinylSd" == Exterior2nd),
  ExteriorMetalSd = as.numeric("MetalSd" == Exterior1st | "MetalSd" == Exterior2nd),
  ExteriorHdBoard = as.numeric("HdBoard" == Exterior1st | "HdBoard" == Exterior2nd),
  ExteriorWdSdng  = as.numeric("Wd Sdng" == Exterior1st | "Wd Sdng" == Exterior2nd),
  ExteriorPlywood = as.numeric("Plywood" == Exterior1st | "Plywood" == Exterior2nd),
  ExteriorCemntBd = as.numeric("CemntBd" == Exterior1st | "CemntBd" == Exterior2nd),
  ExteriorBrkFace = as.numeric("BrkFace" == Exterior1st | "BrkFace" == Exterior2nd),
  ExteriorWdShing = as.numeric("WdShing" == Exterior1st | "WdShing" == Exterior2nd),
  ExteriorAsbShng = as.numeric("AsbShng" == Exterior1st | "AsbShng" == Exterior2nd),
  ExteriorStucco  = as.numeric("Stucco" == Exterior1st | "Stucco" == Exterior2nd),
  ExteriorOthr    = as.numeric(Exterior1st  %in%  c("ImStucc", "AsphShn", "CBlock", "Stone", "BrkComm") | 
                                    Exterior2nd %in% c("ImStucc", "AsphShn", "CBlock", "Stone", "BrkComm")),
  Exterior1st     = NULL,
  Exterior2nd     = NULL
)]



# MasVnrType --------------------------------------------------------------

#
# MasVnrType
#

dataset[is.na(MasVnrType) & is.na(MasVnrArea), MasVnrType := "None"]
dataset[is.na(MasVnrType) & !is.na(MasVnrArea), MasVnrType := "BrkFace"]
dataset[is.na(MasVnrArea), MasVnrArea := 0]


dataset[, `:=`(
  MasVnrTypeBrkCmn  = as.numeric(MasVnrType == "BrkCmn"),
  MasVnrTypeBrkFace = as.numeric(MasVnrType == "BrkFace"),
  MasVnrTypeNone    = as.numeric(MasVnrType == "None"),
  MasVnrTypeStone   = as.numeric(MasVnrType == "Stone"),
  MasVnrType        = NULL
)]



# ExterQual ---------------------------------------------------------------

#
# ExterQual
#

dic_old = c("Fa", "TA", "Gd", "Ex")
dic_new = 1:4

dataset$ExterQual = dic_new[match(dataset$ExterQual, dic_old)]



# ExterCond ---------------------------------------------------------------

#
# ExterCond
#

dic_old = c("Po", "Fa", "TA", "Gd", "Ex")
dic_new = 0:4

dataset$ExterCond = dic_new[match(dataset$ExterCond, dic_old)]



# Foundation --------------------------------------------------------------

#
# Foundation
#

dataset[, `:=`(
  FoundationBrkTil = as.numeric(Foundation == "BrkTil"),
  FoundationCBlock = as.numeric(Foundation == "CBlock"),
  FoundationPConc  = as.numeric(Foundation == "PConc"),
  FoundationSlab   = as.numeric(Foundation == "Slab"),
  FoundationStone  = as.numeric(Foundation == "Stone"),
  FoundationWood   = as.numeric(Foundation == "Wood"),
  Foundation       = NULL
)]




# Heating -----------------------------------------------------------------

#
# Heating
#

dataset[, `:=` (
  HeatingGasA = as.numeric(Heating == "GasA"),
  HeatingGasW = as.numeric(Heating == "GasW"),
  HeatingGrav = as.numeric(Heating == "Grav"),
  HeatingWall = as.numeric(Heating == "Wall"),
  Heating     = NULL
)]



# HeatingQC ---------------------------------------------------------------

#
# HeatingQC
#

dic_old = c("Po", "Fa", "TA", "Gd", "Ex")
dic_new = 0:4

dataset$HeatingQC = dic_new[match(dataset$HeatingQC, dic_old)]



# CentralAir --------------------------------------------------------------

#
# CentralAir
#

dataset[, `:=` (
  CentralAirYes = as.numeric(CentralAir == "Y"),
  CentralAir    = NULL
)]




# Electrical --------------------------------------------------------------

#
# Electrical
#

dataset[is.na(Electrical), Electrical := "SBrkr"]

dataset[, `:=` (
  ElectricalFuseA = as.numeric(Electrical == "FuseA"),
  ElectricalFuseF = as.numeric(Electrical == "FuseF"),
  ElectricalFuseP = as.numeric(Electrical == "FuseP"),
  ElectricalSBrkr = as.numeric(Electrical == "SBrkr"),
  Electrical      = NULL
)]



# KitchenQual -------------------------------------------------------------

#
# KitchenQual
#

dataset[is.na(KitchenQual), KitchenQual := "TA"]

dic_old = c("Fa", "TA", "Gd", "Ex")
dic_new = 1:4

dataset$KitchenQual = dic_new[match(dataset$KitchenQual, dic_old)]




# Functional --------------------------------------------------------------

#
# Functional
#

dataset[is.na(Functional), Functional := "Typ"]
dataset[Functional == "Sev", Functional := "Mod"]

dataset[, `:=` (
  FunctionalMaj1 = as.numeric(Functional  == "Maj1"),
  FunctionalMaj2 = as.numeric(Functional  == "Maj2"),
  FunctionalMin1 = as.numeric(Functional  == "Min1"),
  FunctionalMin2 = as.numeric(Functional  == "Min2"),
  FunctionalMod  = as.numeric(Functional  == "Mod"),
  FunctionalTyp  = as.numeric(Functional  == "Typ"),
  Functional     = NULL
)]



# Fireplaces --------------------------------------------------------------

#
# Fireplaces
#

dataset$HasFireplace = as.numeric(dataset$Fireplaces > 0) 



# FireplaceQu -------------------------------------------------------------

#
# FireplaceQu
#

dic_old = c(NA_character_, "Po", "Fa", "TA", "Gd", "Ex")
dic_new = 0:5

dataset$FireplaceQu = dic_new[match(dataset$FireplaceQu, dic_old)]



# PavedDrive --------------------------------------------------------------

#
# PavedDrive
#

dic_old = c("N", "P", "Y")
dic_new = 1:3

dataset$PavedDrive = dic_new[match(dataset$PavedDrive, dic_old)]



# WoodDeckSF --------------------------------------------------------------

#
# WoodDeckSF
#

dataset[, HasWoodDeck := as.numeric(WoodDeckSF > 0)]



# OpenPorchSF -------------------------------------------------------------

#
#  OpenPorchSF
#

dataset[, HasOpenPorch := as.numeric(OpenPorchSF > 0)]



# EnclosedPorch -----------------------------------------------------------

#
# EnclosedPorch
#

dataset[, HasEnclosedPorch := as.numeric(EnclosedPorch > 0)]



# 3SsnPorch ---------------------------------------------------------------

#
# 3SsnPorch
#

dataset[, Has3SsnPorch := as.numeric(`3SsnPorch` > 0)]


# ScreenPorch -------------------------------------------------------------

#
# ScreenPorch
#

dataset[, HasScreenPorch := as.numeric(ScreenPorch > 0)]



# PoolArea ----------------------------------------------------------------

#
# PoolArea
#

dataset[, HasPool := as.numeric(PoolArea > 0)]



# PoolQC ------------------------------------------------------------------

#
# PoolQC
#

dataset[, PoolQCEx := as.numeric(PoolQC == "Ex")]
dataset[is.na(PoolQCEx), PoolQCEx := 0]
dataset$PoolQC = NULL



# Fence -------------------------------------------------------------------

#
# Fence
#

dataset[, HasFence := as.numeric(!is.na(Fence))]

dic_old = c(NA_character_, "MnWw", "GdWo", "MnPrv", "GdPrv")
dic_new = 0:4

dataset$Fence = dic_new[match(dataset$Fence, dic_old)]




# MiscFeature -------------------------------------------------------------

#
# MiscFeature
#

dataset[, `:=` (
  HasGar2     = as.numeric(MiscFeature == "Gar2"),
  HasShed     = as.numeric(MiscFeature == "Shed"),
  MiscFeature = NULL
)]
dataset[is.na(HasGar2), HasGar2 := 0]
dataset[is.na(HasShed), HasShed := 0]


# MoSold ------------------------------------------------------------------

#
# MoSold
#

dataset[, `:=` (
  QuSold1 = as.numeric(MoSold %in% 1:3),
  QuSold2 = as.numeric(MoSold %in% 4:6),
  QuSold3 = as.numeric(MoSold %in% 7:9),
  QuSold4 = as.numeric(MoSold %in% 10:12),
  MoSold  = NULL
)]



# SaleType ----------------------------------------------------------------

#
# SaleType
#

dataset[is.na(SaleType), SaleType := "WD"]

dataset[, list(meanSalePrice = mean(SalePrice, na.rm = T), sdSalePrice = sd(SalePrice, na.rm = T), .N), by = "SaleType"][order(meanSalePrice)]

dataset[, `:=` (
  SaleType1 = as.numeric(SaleType %in% c("Oth", "ConLD", "ConLw", "COD")),
  SaleType2 = as.numeric(SaleType == "WD"),
  SaleType3 = as.numeric(SaleType %in% c("ConLI", "CWD")),
  SaleType4 = as.numeric(SaleType %in% c("Con", "New")),
  SaleType  = NULL
)]



# SaleCondition -----------------------------------------------------------

#
# SaleCondition
#

dataset[, `:=` (
  SaleConditionAbnorml = as.numeric(SaleCondition == "Abnorml"),
  SaleConditionAdjLand = as.numeric(SaleCondition == "AdjLand"),
  SaleConditionAlloca  = as.numeric(SaleCondition == "Alloca"),
  SaleConditionFamily  = as.numeric(SaleCondition == "Family"),
  SaleConditionNormal  = as.numeric(SaleCondition == "Normal"),
  SaleConditionPartial = as.numeric(SaleCondition == "Partial"),
  SaleCondition        = NULL
)]





# Others ------------------------------------------------------------------

#
# TotalArea (all metric)
#

area_cols = c("LotFrontage", "LotArea", "MasVnrArea", "BsmtFinSF1", "BsmtFinSF2", "BsmtUnfSF",
             "TotalBsmtSF", "1stFlrSF", "2ndFlrSF", "GrLivArea", "GarageArea", "WoodDeckSF", 
             "OpenPorchSF", "EnclosedPorch", "3SsnPorch", "ScreenPorch", "LowQualFinSF", "PoolArea")

dataset$TotalArea = apply(dataset[, area_cols, with = F], MARGIN = 1, sum)


#
# Area 1st and 2nd floor
#

dataset$TotalArea1stAnd2nd = with(dataset, `1stFlrSF`+`2ndFlrSF`)


#
# Year since sold
#

dataset$YearSinceSold = 2010 - dataset$YrSold


#
# Year between sold and bbuilt
#

dataset$YearBetweenSoldAndBuilt = dataset$YrSold - dataset$YearBuilt


