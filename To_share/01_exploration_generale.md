# [FR] Exploration des données
Lincoln - François  
03 janvier 2017  



## Introduction


Exploration univariée de chaque variable du jeu de données. 
Exploration par rapport à la cible.
Nombre de valeur manquante.

Il y a 79 variables explicatives. 

Il y a 23 variables nominale.

Il y a 23 variables ordinale.

Il y a 14 variables discrète.

Il y a 20 variables continue.

(j'ai essayé de traduire le libellé des variables rapidement ...)

## Exploration de la cible

### SalePrice

```r
train[, summary(SalePrice)]
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##   34900  130000  163000  180900  214000  755000
```

![](01_exploration_generale_files/figure-html/boxplot_salePrice-1.png)<!-- -->

### LogSalePrice

```r
train[, summary(logSalePrice)]
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##   10.46   11.78   12.00   12.02   12.27   13.53
```

![](01_exploration_generale_files/figure-html/boxplot_logSalePrice-1.png)<!-- -->

![](01_exploration_generale_files/figure-html/densite_logSalePrice-1.png)<!-- -->

## Liste des variables et valeurs manquantes

Parfois certaines variables ont des NA's "logique", à voir s'il y a des valeurs manquantes "missing at random".
Supression des variables dans ce tableau n'ayant aucune valeurs manquantes dans les deux sets.




<table class='table'>
 <thead>
  <tr>
   <th style="text-align:left;"> set </th>
   <th style="text-align:left;"> variable </th>
   <th style="text-align:right;"> NA's </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> train </td>
   <td style="text-align:left;"> PoolQC </td>
   <td style="text-align:right;"> 1453 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> test </td>
   <td style="text-align:left;"> PoolQC </td>
   <td style="text-align:right;"> 1456 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> train </td>
   <td style="text-align:left;"> MiscFeature </td>
   <td style="text-align:right;"> 1406 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> test </td>
   <td style="text-align:left;"> MiscFeature </td>
   <td style="text-align:right;"> 1408 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> train </td>
   <td style="text-align:left;"> Alley </td>
   <td style="text-align:right;"> 1369 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> test </td>
   <td style="text-align:left;"> Alley </td>
   <td style="text-align:right;"> 1352 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> train </td>
   <td style="text-align:left;"> Fence </td>
   <td style="text-align:right;"> 1179 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> test </td>
   <td style="text-align:left;"> Fence </td>
   <td style="text-align:right;"> 1169 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> train </td>
   <td style="text-align:left;"> SalePrice </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> test </td>
   <td style="text-align:left;"> SalePrice </td>
   <td style="text-align:right;"> 1459 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> train </td>
   <td style="text-align:left;"> logSalePrice </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> test </td>
   <td style="text-align:left;"> logSalePrice </td>
   <td style="text-align:right;"> 1459 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> train </td>
   <td style="text-align:left;"> FireplaceQu </td>
   <td style="text-align:right;"> 690 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> test </td>
   <td style="text-align:left;"> FireplaceQu </td>
   <td style="text-align:right;"> 730 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> train </td>
   <td style="text-align:left;"> LotFrontage </td>
   <td style="text-align:right;"> 259 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> test </td>
   <td style="text-align:left;"> LotFrontage </td>
   <td style="text-align:right;"> 227 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> train </td>
   <td style="text-align:left;"> GarageYrBlt </td>
   <td style="text-align:right;"> 81 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> test </td>
   <td style="text-align:left;"> GarageYrBlt </td>
   <td style="text-align:right;"> 78 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> train </td>
   <td style="text-align:left;"> GarageFinish </td>
   <td style="text-align:right;"> 81 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> test </td>
   <td style="text-align:left;"> GarageFinish </td>
   <td style="text-align:right;"> 78 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> train </td>
   <td style="text-align:left;"> GarageQual </td>
   <td style="text-align:right;"> 81 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> test </td>
   <td style="text-align:left;"> GarageQual </td>
   <td style="text-align:right;"> 78 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> train </td>
   <td style="text-align:left;"> GarageCond </td>
   <td style="text-align:right;"> 81 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> test </td>
   <td style="text-align:left;"> GarageCond </td>
   <td style="text-align:right;"> 78 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> train </td>
   <td style="text-align:left;"> GarageType </td>
   <td style="text-align:right;"> 81 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> test </td>
   <td style="text-align:left;"> GarageType </td>
   <td style="text-align:right;"> 76 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> train </td>
   <td style="text-align:left;"> BsmtCond </td>
   <td style="text-align:right;"> 37 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> test </td>
   <td style="text-align:left;"> BsmtCond </td>
   <td style="text-align:right;"> 45 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> train </td>
   <td style="text-align:left;"> BsmtExposure </td>
   <td style="text-align:right;"> 38 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> test </td>
   <td style="text-align:left;"> BsmtExposure </td>
   <td style="text-align:right;"> 44 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> train </td>
   <td style="text-align:left;"> BsmtQual </td>
   <td style="text-align:right;"> 37 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> test </td>
   <td style="text-align:left;"> BsmtQual </td>
   <td style="text-align:right;"> 44 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> train </td>
   <td style="text-align:left;"> BsmtFinType2 </td>
   <td style="text-align:right;"> 38 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> test </td>
   <td style="text-align:left;"> BsmtFinType2 </td>
   <td style="text-align:right;"> 42 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> train </td>
   <td style="text-align:left;"> BsmtFinType1 </td>
   <td style="text-align:right;"> 37 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> test </td>
   <td style="text-align:left;"> BsmtFinType1 </td>
   <td style="text-align:right;"> 42 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> train </td>
   <td style="text-align:left;"> MasVnrType </td>
   <td style="text-align:right;"> 8 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> test </td>
   <td style="text-align:left;"> MasVnrType </td>
   <td style="text-align:right;"> 16 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> train </td>
   <td style="text-align:left;"> MasVnrArea </td>
   <td style="text-align:right;"> 8 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> test </td>
   <td style="text-align:left;"> MasVnrArea </td>
   <td style="text-align:right;"> 15 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> train </td>
   <td style="text-align:left;"> MSZoning </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> test </td>
   <td style="text-align:left;"> MSZoning </td>
   <td style="text-align:right;"> 4 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> train </td>
   <td style="text-align:left;"> Utilities </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> test </td>
   <td style="text-align:left;"> Utilities </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> train </td>
   <td style="text-align:left;"> BsmtFullBath </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> test </td>
   <td style="text-align:left;"> BsmtFullBath </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> train </td>
   <td style="text-align:left;"> BsmtHalfBath </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> test </td>
   <td style="text-align:left;"> BsmtHalfBath </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> train </td>
   <td style="text-align:left;"> Functional </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> test </td>
   <td style="text-align:left;"> Functional </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> train </td>
   <td style="text-align:left;"> Exterior1st </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> test </td>
   <td style="text-align:left;"> Exterior1st </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> train </td>
   <td style="text-align:left;"> Exterior2nd </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> test </td>
   <td style="text-align:left;"> Exterior2nd </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> train </td>
   <td style="text-align:left;"> BsmtFinSF1 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> test </td>
   <td style="text-align:left;"> BsmtFinSF1 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> train </td>
   <td style="text-align:left;"> BsmtFinSF2 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> test </td>
   <td style="text-align:left;"> BsmtFinSF2 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> train </td>
   <td style="text-align:left;"> BsmtUnfSF </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> test </td>
   <td style="text-align:left;"> BsmtUnfSF </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> train </td>
   <td style="text-align:left;"> TotalBsmtSF </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> test </td>
   <td style="text-align:left;"> TotalBsmtSF </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> train </td>
   <td style="text-align:left;"> Electrical </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> test </td>
   <td style="text-align:left;"> Electrical </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> train </td>
   <td style="text-align:left;"> KitchenQual </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> test </td>
   <td style="text-align:left;"> KitchenQual </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> train </td>
   <td style="text-align:left;"> GarageCars </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> test </td>
   <td style="text-align:left;"> GarageCars </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> train </td>
   <td style="text-align:left;"> GarageArea </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> test </td>
   <td style="text-align:left;"> GarageArea </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> train </td>
   <td style="text-align:left;"> SaleType </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> test </td>
   <td style="text-align:left;"> SaleType </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
</tbody>
</table>


## Exploration univariée

<h3 class='title'>MSSubClass (Nominal)</h3><h5 class='title'>Identifies the type of dwelling involved in the sale</h5><h5 class='title'><em>[FR] Qualifie le type de logement de facon macro</em></h5><h4>Tableau</h3><table class='table'>
 <thead>
  <tr>
   <th style="text-align:left;"> MSSubClass </th>
   <th style="text-align:left;"> Libelle </th>
   <th style="text-align:right;"> Eff. train </th>
   <th style="text-align:right;"> Eff. test </th>
   <th style="text-align:right;"> % train </th>
   <th style="text-align:right;"> % test </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> 120 </td>
   <td style="text-align:left;"> 1-STORY PUD (Planned Unit Development) - 1946 &amp; NEWER </td>
   <td style="text-align:right;"> 87 </td>
   <td style="text-align:right;"> 95 </td>
   <td style="text-align:right;"> 5.96 </td>
   <td style="text-align:right;"> 6.51 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 150 </td>
   <td style="text-align:left;"> 1-1/2 STORY PUD - ALL AGES </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0.00 </td>
   <td style="text-align:right;"> 0.07 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 160 </td>
   <td style="text-align:left;"> 2-STORY PUD - 1946 &amp; NEWER </td>
   <td style="text-align:right;"> 63 </td>
   <td style="text-align:right;"> 65 </td>
   <td style="text-align:right;"> 4.32 </td>
   <td style="text-align:right;"> 4.46 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 180 </td>
   <td style="text-align:left;"> PUD - MULTILEVEL - INCL SPLIT LEV/FOYER </td>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:right;"> 0.68 </td>
   <td style="text-align:right;"> 0.48 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 190 </td>
   <td style="text-align:left;"> 2 FAMILY CONVERSION - ALL STYLES AND AGES </td>
   <td style="text-align:right;"> 30 </td>
   <td style="text-align:right;"> 31 </td>
   <td style="text-align:right;"> 2.05 </td>
   <td style="text-align:right;"> 2.12 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 20 </td>
   <td style="text-align:left;"> 1-STORY 1946 &amp; NEWER ALL STYLES </td>
   <td style="text-align:right;"> 536 </td>
   <td style="text-align:right;"> 543 </td>
   <td style="text-align:right;"> 36.71 </td>
   <td style="text-align:right;"> 37.22 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 30 </td>
   <td style="text-align:left;"> 1-STORY 1945 &amp; OLDER </td>
   <td style="text-align:right;"> 69 </td>
   <td style="text-align:right;"> 70 </td>
   <td style="text-align:right;"> 4.73 </td>
   <td style="text-align:right;"> 4.80 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 40 </td>
   <td style="text-align:left;"> 1-STORY W/FINISHED ATTIC ALL AGES </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 0.27 </td>
   <td style="text-align:right;"> 0.14 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 45 </td>
   <td style="text-align:left;"> 1-1/2 STORY - UNFINISHED ALL AGES </td>
   <td style="text-align:right;"> 12 </td>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:right;"> 0.82 </td>
   <td style="text-align:right;"> 0.41 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 50 </td>
   <td style="text-align:left;"> 1-1/2 STORY FINISHED ALL AGES </td>
   <td style="text-align:right;"> 144 </td>
   <td style="text-align:right;"> 143 </td>
   <td style="text-align:right;"> 9.86 </td>
   <td style="text-align:right;"> 9.80 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 60 </td>
   <td style="text-align:left;"> 2-STORY 1946 &amp; NEWER </td>
   <td style="text-align:right;"> 299 </td>
   <td style="text-align:right;"> 276 </td>
   <td style="text-align:right;"> 20.48 </td>
   <td style="text-align:right;"> 18.92 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 70 </td>
   <td style="text-align:left;"> 2-STORY 1945 &amp; OLDER </td>
   <td style="text-align:right;"> 60 </td>
   <td style="text-align:right;"> 68 </td>
   <td style="text-align:right;"> 4.11 </td>
   <td style="text-align:right;"> 4.66 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 75 </td>
   <td style="text-align:left;"> 2-1/2 STORY ALL AGES </td>
   <td style="text-align:right;"> 16 </td>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:right;"> 1.10 </td>
   <td style="text-align:right;"> 0.48 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 80 </td>
   <td style="text-align:left;"> SPLIT OR MULTI-LEVEL </td>
   <td style="text-align:right;"> 58 </td>
   <td style="text-align:right;"> 60 </td>
   <td style="text-align:right;"> 3.97 </td>
   <td style="text-align:right;"> 4.11 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 85 </td>
   <td style="text-align:left;"> SPLIT FOYER </td>
   <td style="text-align:right;"> 20 </td>
   <td style="text-align:right;"> 28 </td>
   <td style="text-align:right;"> 1.37 </td>
   <td style="text-align:right;"> 1.92 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 90 </td>
   <td style="text-align:left;"> DUPLEX - ALL STYLES AND AGES </td>
   <td style="text-align:right;"> 52 </td>
   <td style="text-align:right;"> 57 </td>
   <td style="text-align:right;"> 3.56 </td>
   <td style="text-align:right;"> 3.91 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Total </td>
   <td style="text-align:left;"> Total </td>
   <td style="text-align:right;"> 1460 </td>
   <td style="text-align:right;"> 1459 </td>
   <td style="text-align:right;"> 99.99 </td>
   <td style="text-align:right;"> 100.01 </td>
  </tr>
</tbody>
</table><h4>Graphiques</h3>![](01_exploration_generale_files/figure-html/test-1.png)<!-- -->![](01_exploration_generale_files/figure-html/test-2.png)<!-- --><br/><br/><h3 class='title'>MSZoning (Nominal)</h3><h5 class='title'>Identifies the general zoning classification of the sale</h5><h5 class='title'><em>[FR] Qualifie le type de zone du logement</em></h5><h4>Tableau</h3><table class='table'>
 <thead>
  <tr>
   <th style="text-align:left;"> MSZoning </th>
   <th style="text-align:left;"> Libelle </th>
   <th style="text-align:right;"> Eff. train </th>
   <th style="text-align:right;"> Eff. test </th>
   <th style="text-align:right;"> % train </th>
   <th style="text-align:right;"> % test </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> 0.00 </td>
   <td style="text-align:right;"> 0.27 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> C (all) </td>
   <td style="text-align:left;"> Commercial </td>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:right;"> 15 </td>
   <td style="text-align:right;"> 0.68 </td>
   <td style="text-align:right;"> 1.03 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FV </td>
   <td style="text-align:left;"> Floating Village Residential </td>
   <td style="text-align:right;"> 65 </td>
   <td style="text-align:right;"> 74 </td>
   <td style="text-align:right;"> 4.45 </td>
   <td style="text-align:right;"> 5.07 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RH </td>
   <td style="text-align:left;"> Residential High Density </td>
   <td style="text-align:right;"> 16 </td>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:right;"> 1.10 </td>
   <td style="text-align:right;"> 0.69 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RL </td>
   <td style="text-align:left;"> Residential Low Density </td>
   <td style="text-align:right;"> 1151 </td>
   <td style="text-align:right;"> 1114 </td>
   <td style="text-align:right;"> 78.84 </td>
   <td style="text-align:right;"> 76.35 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RM </td>
   <td style="text-align:left;"> Residential Medium Density </td>
   <td style="text-align:right;"> 218 </td>
   <td style="text-align:right;"> 242 </td>
   <td style="text-align:right;"> 14.93 </td>
   <td style="text-align:right;"> 16.59 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Total </td>
   <td style="text-align:left;"> Total </td>
   <td style="text-align:right;"> 1460 </td>
   <td style="text-align:right;"> 1459 </td>
   <td style="text-align:right;"> 100.00 </td>
   <td style="text-align:right;"> 100.00 </td>
  </tr>
</tbody>
</table><h4>Graphiques</h3>![](01_exploration_generale_files/figure-html/test-3.png)<!-- -->![](01_exploration_generale_files/figure-html/test-4.png)<!-- --><br/><br/><h3 class='title'>LotFrontage (Continuous)</h3><h5 class='title'>Linear feet of street connected to property</h5><h5 class='title'><em>[FR] Mesure en pied la distance commune entre la rue et la propriété</em></h5><h4>Tableau</h3><table class='table'>
 <thead>
  <tr>
   <th style="text-align:left;"> set </th>
   <th style="text-align:right;"> Min. </th>
   <th style="text-align:right;"> 1st Qu. </th>
   <th style="text-align:right;"> Median </th>
   <th style="text-align:right;"> 3rd Qu. </th>
   <th style="text-align:right;"> Max. </th>
   <th style="text-align:right;"> NA's </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> train </td>
   <td style="text-align:right;"> 21 </td>
   <td style="text-align:right;"> 59 </td>
   <td style="text-align:right;"> 69 </td>
   <td style="text-align:right;"> 80 </td>
   <td style="text-align:right;"> 313 </td>
   <td style="text-align:right;"> 259 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> test </td>
   <td style="text-align:right;"> 21 </td>
   <td style="text-align:right;"> 58 </td>
   <td style="text-align:right;"> 67 </td>
   <td style="text-align:right;"> 80 </td>
   <td style="text-align:right;"> 200 </td>
   <td style="text-align:right;"> 227 </td>
  </tr>
</tbody>
</table><h4>Graphiques</h3>![](01_exploration_generale_files/figure-html/test-5.png)<!-- -->

```
## `geom_smooth()` using method = 'gam'
```

![](01_exploration_generale_files/figure-html/test-6.png)<!-- --><br/><br/><h3 class='title'>LotArea (Continuous)</h3><h5 class='title'>Lot size in square feet</h5><h5 class='title'><em>[FR] Surface de la propriété en pied2</em></h5><h4>Tableau</h3><table class='table'>
 <thead>
  <tr>
   <th style="text-align:left;"> set </th>
   <th style="text-align:right;"> Min. </th>
   <th style="text-align:right;"> 1st Qu. </th>
   <th style="text-align:right;"> Median </th>
   <th style="text-align:right;"> 3rd Qu. </th>
   <th style="text-align:right;"> Max. </th>
   <th style="text-align:right;"> NA's </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> train </td>
   <td style="text-align:right;"> 1300 </td>
   <td style="text-align:right;"> 7553.5 </td>
   <td style="text-align:right;"> 9478.5 </td>
   <td style="text-align:right;"> 11601.5 </td>
   <td style="text-align:right;"> 215245 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> test </td>
   <td style="text-align:right;"> 1470 </td>
   <td style="text-align:right;"> 7391.0 </td>
   <td style="text-align:right;"> 9399.0 </td>
   <td style="text-align:right;"> 11517.5 </td>
   <td style="text-align:right;"> 56600 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
</tbody>
</table><h4>Graphiques</h3>![](01_exploration_generale_files/figure-html/test-7.png)<!-- -->

```
## `geom_smooth()` using method = 'gam'
```

![](01_exploration_generale_files/figure-html/test-8.png)<!-- --><br/><br/><h3 class='title'>Street (Nominal)</h3><h5 class='title'>Type of road access to property</h5><h5 class='title'><em>[FR] Type de la route pour accèder à la propriété</em></h5><h4>Tableau</h3><table class='table'>
 <thead>
  <tr>
   <th style="text-align:left;"> Street </th>
   <th style="text-align:left;"> Libelle </th>
   <th style="text-align:right;"> Eff. train </th>
   <th style="text-align:right;"> Eff. test </th>
   <th style="text-align:right;"> % train </th>
   <th style="text-align:right;"> % test </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Grvl </td>
   <td style="text-align:left;"> Gravel </td>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:right;"> 0.41 </td>
   <td style="text-align:right;"> 0.41 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Pave </td>
   <td style="text-align:left;"> Paved </td>
   <td style="text-align:right;"> 1454 </td>
   <td style="text-align:right;"> 1453 </td>
   <td style="text-align:right;"> 99.59 </td>
   <td style="text-align:right;"> 99.59 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Total </td>
   <td style="text-align:left;"> Total </td>
   <td style="text-align:right;"> 1460 </td>
   <td style="text-align:right;"> 1459 </td>
   <td style="text-align:right;"> 100.00 </td>
   <td style="text-align:right;"> 100.00 </td>
  </tr>
</tbody>
</table><h4>Graphiques</h3>![](01_exploration_generale_files/figure-html/test-9.png)<!-- -->![](01_exploration_generale_files/figure-html/test-10.png)<!-- --><br/><br/><h3 class='title'>Alley (Nominal)</h3><h5 class='title'>Type of alley access to property</h5><h5 class='title'><em>[FR] Type de l'allée pour acceder à la propriété</em></h5><h4>Tableau</h3><table class='table'>
 <thead>
  <tr>
   <th style="text-align:left;"> Alley </th>
   <th style="text-align:left;"> Libelle </th>
   <th style="text-align:right;"> Eff. train </th>
   <th style="text-align:right;"> Eff. test </th>
   <th style="text-align:right;"> % train </th>
   <th style="text-align:right;"> % test </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> No alley access </td>
   <td style="text-align:right;"> 1369 </td>
   <td style="text-align:right;"> 1352 </td>
   <td style="text-align:right;"> 93.77 </td>
   <td style="text-align:right;"> 92.67 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Grvl </td>
   <td style="text-align:left;"> Gravel </td>
   <td style="text-align:right;"> 50 </td>
   <td style="text-align:right;"> 70 </td>
   <td style="text-align:right;"> 3.42 </td>
   <td style="text-align:right;"> 4.80 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Pave </td>
   <td style="text-align:left;"> Paved </td>
   <td style="text-align:right;"> 41 </td>
   <td style="text-align:right;"> 37 </td>
   <td style="text-align:right;"> 2.81 </td>
   <td style="text-align:right;"> 2.54 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Total </td>
   <td style="text-align:left;"> Total </td>
   <td style="text-align:right;"> 1460 </td>
   <td style="text-align:right;"> 1459 </td>
   <td style="text-align:right;"> 100.00 </td>
   <td style="text-align:right;"> 100.01 </td>
  </tr>
</tbody>
</table><h4>Graphiques</h3>![](01_exploration_generale_files/figure-html/test-11.png)<!-- -->![](01_exploration_generale_files/figure-html/test-12.png)<!-- --><br/><br/><h3 class='title'>LotShape (Ordinal)</h3><h5 class='title'>General shape of property</h5><h5 class='title'><em>[FR] Forme générale de la propriété</em></h5><h4>Tableau</h3><table class='table'>
 <thead>
  <tr>
   <th style="text-align:left;"> LotShape </th>
   <th style="text-align:left;"> Libelle </th>
   <th style="text-align:right;"> Eff. train </th>
   <th style="text-align:right;"> Eff. test </th>
   <th style="text-align:right;"> % train </th>
   <th style="text-align:right;"> % test </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> IR1 </td>
   <td style="text-align:left;"> Slightly irregular </td>
   <td style="text-align:right;"> 484 </td>
   <td style="text-align:right;"> 484 </td>
   <td style="text-align:right;"> 33.15 </td>
   <td style="text-align:right;"> 33.17 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> IR2 </td>
   <td style="text-align:left;"> Moderately Irregular </td>
   <td style="text-align:right;"> 41 </td>
   <td style="text-align:right;"> 35 </td>
   <td style="text-align:right;"> 2.81 </td>
   <td style="text-align:right;"> 2.40 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> IR3 </td>
   <td style="text-align:left;"> Irregular </td>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:right;"> 0.68 </td>
   <td style="text-align:right;"> 0.41 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Reg </td>
   <td style="text-align:left;"> Regular </td>
   <td style="text-align:right;"> 925 </td>
   <td style="text-align:right;"> 934 </td>
   <td style="text-align:right;"> 63.36 </td>
   <td style="text-align:right;"> 64.02 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Total </td>
   <td style="text-align:left;"> Total </td>
   <td style="text-align:right;"> 1460 </td>
   <td style="text-align:right;"> 1459 </td>
   <td style="text-align:right;"> 100.00 </td>
   <td style="text-align:right;"> 100.00 </td>
  </tr>
</tbody>
</table><h4>Graphiques</h3>![](01_exploration_generale_files/figure-html/test-13.png)<!-- -->![](01_exploration_generale_files/figure-html/test-14.png)<!-- --><br/><br/><h3 class='title'>LandContour (Nominal)</h3><h5 class='title'>Flatness of the property</h5><h5 class='title'><em>[FR] Platitude du sol de la propriété</em></h5><h4>Tableau</h3><table class='table'>
 <thead>
  <tr>
   <th style="text-align:left;"> LandContour </th>
   <th style="text-align:left;"> Libelle </th>
   <th style="text-align:right;"> Eff. train </th>
   <th style="text-align:right;"> Eff. test </th>
   <th style="text-align:right;"> % train </th>
   <th style="text-align:right;"> % test </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Bnk </td>
   <td style="text-align:left;"> Banked - Quick and significant rise from street grade to building </td>
   <td style="text-align:right;"> 63 </td>
   <td style="text-align:right;"> 54 </td>
   <td style="text-align:right;"> 4.32 </td>
   <td style="text-align:right;"> 3.70 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> HLS </td>
   <td style="text-align:left;"> Hillside - Significant slope from side to side </td>
   <td style="text-align:right;"> 50 </td>
   <td style="text-align:right;"> 70 </td>
   <td style="text-align:right;"> 3.42 </td>
   <td style="text-align:right;"> 4.80 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Low </td>
   <td style="text-align:left;"> Depression </td>
   <td style="text-align:right;"> 36 </td>
   <td style="text-align:right;"> 24 </td>
   <td style="text-align:right;"> 2.47 </td>
   <td style="text-align:right;"> 1.64 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Lvl </td>
   <td style="text-align:left;"> Near Flat/Level </td>
   <td style="text-align:right;"> 1311 </td>
   <td style="text-align:right;"> 1311 </td>
   <td style="text-align:right;"> 89.79 </td>
   <td style="text-align:right;"> 89.86 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Total </td>
   <td style="text-align:left;"> Total </td>
   <td style="text-align:right;"> 1460 </td>
   <td style="text-align:right;"> 1459 </td>
   <td style="text-align:right;"> 100.00 </td>
   <td style="text-align:right;"> 100.00 </td>
  </tr>
</tbody>
</table><h4>Graphiques</h3>![](01_exploration_generale_files/figure-html/test-15.png)<!-- -->![](01_exploration_generale_files/figure-html/test-16.png)<!-- --><br/><br/><h3 class='title'>Utilities (Ordinal)</h3><h5 class='title'>Type of utilities available</h5><h5 class='title'><em>[FR] Type de service publiques à disposition</em></h5><h4>Tableau</h3><table class='table'>
 <thead>
  <tr>
   <th style="text-align:left;"> Utilities </th>
   <th style="text-align:left;"> Libelle </th>
   <th style="text-align:right;"> Eff. train </th>
   <th style="text-align:right;"> Eff. test </th>
   <th style="text-align:right;"> % train </th>
   <th style="text-align:right;"> % test </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 0.00 </td>
   <td style="text-align:right;"> 0.14 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AllPub </td>
   <td style="text-align:left;"> All public Utilities (E </td>
   <td style="text-align:right;"> 1459 </td>
   <td style="text-align:right;"> 1457 </td>
   <td style="text-align:right;"> 99.93 </td>
   <td style="text-align:right;"> 99.86 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> NoSeWa </td>
   <td style="text-align:left;"> Electricity and Gas Only </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0.07 </td>
   <td style="text-align:right;"> 0.00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Total </td>
   <td style="text-align:left;"> Total </td>
   <td style="text-align:right;"> 1460 </td>
   <td style="text-align:right;"> 1459 </td>
   <td style="text-align:right;"> 100.00 </td>
   <td style="text-align:right;"> 100.00 </td>
  </tr>
</tbody>
</table><h4>Graphiques</h3>![](01_exploration_generale_files/figure-html/test-17.png)<!-- -->![](01_exploration_generale_files/figure-html/test-18.png)<!-- --><br/><br/><h3 class='title'>LotConfig (Nominal)</h3><h5 class='title'>Lot configuration</h5><h5 class='title'><em>[FR] Configuration de la propriété</em></h5><h4>Tableau</h3><table class='table'>
 <thead>
  <tr>
   <th style="text-align:left;"> LotConfig </th>
   <th style="text-align:left;"> Libelle </th>
   <th style="text-align:right;"> Eff. train </th>
   <th style="text-align:right;"> Eff. test </th>
   <th style="text-align:right;"> % train </th>
   <th style="text-align:right;"> % test </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Corner </td>
   <td style="text-align:left;"> Corner lot </td>
   <td style="text-align:right;"> 263 </td>
   <td style="text-align:right;"> 248 </td>
   <td style="text-align:right;"> 18.01 </td>
   <td style="text-align:right;"> 17.00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CulDSac </td>
   <td style="text-align:left;"> Cul-de-sac </td>
   <td style="text-align:right;"> 94 </td>
   <td style="text-align:right;"> 82 </td>
   <td style="text-align:right;"> 6.44 </td>
   <td style="text-align:right;"> 5.62 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FR2 </td>
   <td style="text-align:left;"> Frontage on 2 sides of property </td>
   <td style="text-align:right;"> 47 </td>
   <td style="text-align:right;"> 38 </td>
   <td style="text-align:right;"> 3.22 </td>
   <td style="text-align:right;"> 2.60 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FR3 </td>
   <td style="text-align:left;"> Frontage on 3 sides of property </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:right;"> 0.27 </td>
   <td style="text-align:right;"> 0.69 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Inside </td>
   <td style="text-align:left;"> Inside lot </td>
   <td style="text-align:right;"> 1052 </td>
   <td style="text-align:right;"> 1081 </td>
   <td style="text-align:right;"> 72.05 </td>
   <td style="text-align:right;"> 74.09 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Total </td>
   <td style="text-align:left;"> Total </td>
   <td style="text-align:right;"> 1460 </td>
   <td style="text-align:right;"> 1459 </td>
   <td style="text-align:right;"> 99.99 </td>
   <td style="text-align:right;"> 100.00 </td>
  </tr>
</tbody>
</table><h4>Graphiques</h3>![](01_exploration_generale_files/figure-html/test-19.png)<!-- -->![](01_exploration_generale_files/figure-html/test-20.png)<!-- --><br/><br/><h3 class='title'>LandSlope (Ordinal)</h3><h5 class='title'>Slope of property</h5><h5 class='title'><em>[FR] Pente de la propriété</em></h5><h4>Tableau</h3><table class='table'>
 <thead>
  <tr>
   <th style="text-align:left;"> LandSlope </th>
   <th style="text-align:left;"> Libelle </th>
   <th style="text-align:right;"> Eff. train </th>
   <th style="text-align:right;"> Eff. test </th>
   <th style="text-align:right;"> % train </th>
   <th style="text-align:right;"> % test </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Gtl </td>
   <td style="text-align:left;"> Gentle slope </td>
   <td style="text-align:right;"> 1382 </td>
   <td style="text-align:right;"> 1396 </td>
   <td style="text-align:right;"> 94.66 </td>
   <td style="text-align:right;"> 95.68 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Mod </td>
   <td style="text-align:left;"> Moderate  slope </td>
   <td style="text-align:right;"> 65 </td>
   <td style="text-align:right;"> 60 </td>
   <td style="text-align:right;"> 4.45 </td>
   <td style="text-align:right;"> 4.11 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Sev </td>
   <td style="text-align:left;"> Severe slope </td>
   <td style="text-align:right;"> 13 </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 0.89 </td>
   <td style="text-align:right;"> 0.21 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Total </td>
   <td style="text-align:left;"> Total </td>
   <td style="text-align:right;"> 1460 </td>
   <td style="text-align:right;"> 1459 </td>
   <td style="text-align:right;"> 100.00 </td>
   <td style="text-align:right;"> 100.00 </td>
  </tr>
</tbody>
</table><h4>Graphiques</h3>![](01_exploration_generale_files/figure-html/test-21.png)<!-- -->![](01_exploration_generale_files/figure-html/test-22.png)<!-- --><br/><br/><h3 class='title'>Neighborhood (Nominal)</h3><h5 class='title'>Physical locations within Ames city limits (map available)</h5><h5 class='title'><em>[FR] Localisation (quartier) de la propriété</em></h5><h4>Tableau</h3><table class='table'>
 <thead>
  <tr>
   <th style="text-align:left;"> Neighborhood </th>
   <th style="text-align:left;"> Libelle </th>
   <th style="text-align:right;"> Eff. train </th>
   <th style="text-align:right;"> Eff. test </th>
   <th style="text-align:right;"> % train </th>
   <th style="text-align:right;"> % test </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Blmngtn </td>
   <td style="text-align:left;"> Bloomington Heights </td>
   <td style="text-align:right;"> 17 </td>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:right;"> 1.16 </td>
   <td style="text-align:right;"> 0.75 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Blueste </td>
   <td style="text-align:left;"> Bluestem </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:right;"> 0.14 </td>
   <td style="text-align:right;"> 0.55 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BrDale </td>
   <td style="text-align:left;"> Briardale </td>
   <td style="text-align:right;"> 16 </td>
   <td style="text-align:right;"> 14 </td>
   <td style="text-align:right;"> 1.10 </td>
   <td style="text-align:right;"> 0.96 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BrkSide </td>
   <td style="text-align:left;"> Brookside </td>
   <td style="text-align:right;"> 58 </td>
   <td style="text-align:right;"> 50 </td>
   <td style="text-align:right;"> 3.97 </td>
   <td style="text-align:right;"> 3.43 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ClearCr </td>
   <td style="text-align:left;"> Clear Creek </td>
   <td style="text-align:right;"> 28 </td>
   <td style="text-align:right;"> 16 </td>
   <td style="text-align:right;"> 1.92 </td>
   <td style="text-align:right;"> 1.10 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CollgCr </td>
   <td style="text-align:left;"> College Creek </td>
   <td style="text-align:right;"> 150 </td>
   <td style="text-align:right;"> 117 </td>
   <td style="text-align:right;"> 10.27 </td>
   <td style="text-align:right;"> 8.02 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Crawfor </td>
   <td style="text-align:left;"> Crawford </td>
   <td style="text-align:right;"> 51 </td>
   <td style="text-align:right;"> 52 </td>
   <td style="text-align:right;"> 3.49 </td>
   <td style="text-align:right;"> 3.56 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Edwards </td>
   <td style="text-align:left;"> Edwards </td>
   <td style="text-align:right;"> 100 </td>
   <td style="text-align:right;"> 94 </td>
   <td style="text-align:right;"> 6.85 </td>
   <td style="text-align:right;"> 6.44 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Gilbert </td>
   <td style="text-align:left;"> Gilbert </td>
   <td style="text-align:right;"> 79 </td>
   <td style="text-align:right;"> 86 </td>
   <td style="text-align:right;"> 5.41 </td>
   <td style="text-align:right;"> 5.89 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> IDOTRR </td>
   <td style="text-align:left;"> Iowa DOT and Rail Road </td>
   <td style="text-align:right;"> 37 </td>
   <td style="text-align:right;"> 56 </td>
   <td style="text-align:right;"> 2.53 </td>
   <td style="text-align:right;"> 3.84 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MeadowV </td>
   <td style="text-align:left;"> Meadow Village </td>
   <td style="text-align:right;"> 17 </td>
   <td style="text-align:right;"> 20 </td>
   <td style="text-align:right;"> 1.16 </td>
   <td style="text-align:right;"> 1.37 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Mitchel </td>
   <td style="text-align:left;"> Mitchell </td>
   <td style="text-align:right;"> 49 </td>
   <td style="text-align:right;"> 65 </td>
   <td style="text-align:right;"> 3.36 </td>
   <td style="text-align:right;"> 4.46 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> NAmes </td>
   <td style="text-align:left;"> North Ames </td>
   <td style="text-align:right;"> 225 </td>
   <td style="text-align:right;"> 218 </td>
   <td style="text-align:right;"> 15.41 </td>
   <td style="text-align:right;"> 14.94 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> NPkVill </td>
   <td style="text-align:left;"> Northpark Villa </td>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:right;"> 14 </td>
   <td style="text-align:right;"> 0.62 </td>
   <td style="text-align:right;"> 0.96 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> NWAmes </td>
   <td style="text-align:left;"> Northwest Ames </td>
   <td style="text-align:right;"> 73 </td>
   <td style="text-align:right;"> 58 </td>
   <td style="text-align:right;"> 5.00 </td>
   <td style="text-align:right;"> 3.98 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> NoRidge </td>
   <td style="text-align:left;"> Northridge </td>
   <td style="text-align:right;"> 41 </td>
   <td style="text-align:right;"> 30 </td>
   <td style="text-align:right;"> 2.81 </td>
   <td style="text-align:right;"> 2.06 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> NridgHt </td>
   <td style="text-align:left;"> Northridge Heights </td>
   <td style="text-align:right;"> 77 </td>
   <td style="text-align:right;"> 89 </td>
   <td style="text-align:right;"> 5.27 </td>
   <td style="text-align:right;"> 6.10 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> OldTown </td>
   <td style="text-align:left;"> Old Town </td>
   <td style="text-align:right;"> 113 </td>
   <td style="text-align:right;"> 126 </td>
   <td style="text-align:right;"> 7.74 </td>
   <td style="text-align:right;"> 8.64 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SWISU </td>
   <td style="text-align:left;"> South &amp; West of Iowa State University </td>
   <td style="text-align:right;"> 25 </td>
   <td style="text-align:right;"> 23 </td>
   <td style="text-align:right;"> 1.71 </td>
   <td style="text-align:right;"> 1.58 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Sawyer </td>
   <td style="text-align:left;"> Sawyer </td>
   <td style="text-align:right;"> 74 </td>
   <td style="text-align:right;"> 77 </td>
   <td style="text-align:right;"> 5.07 </td>
   <td style="text-align:right;"> 5.28 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SawyerW </td>
   <td style="text-align:left;"> Sawyer West </td>
   <td style="text-align:right;"> 59 </td>
   <td style="text-align:right;"> 66 </td>
   <td style="text-align:right;"> 4.04 </td>
   <td style="text-align:right;"> 4.52 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Somerst </td>
   <td style="text-align:left;"> Somerset </td>
   <td style="text-align:right;"> 86 </td>
   <td style="text-align:right;"> 96 </td>
   <td style="text-align:right;"> 5.89 </td>
   <td style="text-align:right;"> 6.58 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> StoneBr </td>
   <td style="text-align:left;"> Stone Brook </td>
   <td style="text-align:right;"> 25 </td>
   <td style="text-align:right;"> 26 </td>
   <td style="text-align:right;"> 1.71 </td>
   <td style="text-align:right;"> 1.78 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Timber </td>
   <td style="text-align:left;"> Timberland </td>
   <td style="text-align:right;"> 38 </td>
   <td style="text-align:right;"> 34 </td>
   <td style="text-align:right;"> 2.60 </td>
   <td style="text-align:right;"> 2.33 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Veenker </td>
   <td style="text-align:left;"> Veenker </td>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:right;"> 13 </td>
   <td style="text-align:right;"> 0.75 </td>
   <td style="text-align:right;"> 0.89 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Total </td>
   <td style="text-align:left;"> Total </td>
   <td style="text-align:right;"> 1460 </td>
   <td style="text-align:right;"> 1459 </td>
   <td style="text-align:right;"> 99.98 </td>
   <td style="text-align:right;"> 100.01 </td>
  </tr>
</tbody>
</table><h4>Graphiques</h3>![](01_exploration_generale_files/figure-html/test-23.png)<!-- -->![](01_exploration_generale_files/figure-html/test-24.png)<!-- --><br/><br/><h3 class='title'>Condition1 (Nominal)</h3><h5 class='title'>Proximity to various conditions</h5><h5 class='title'><em>[FR] Proche de plusieurs type de condition</em></h5><h4>Tableau</h3><table class='table'>
 <thead>
  <tr>
   <th style="text-align:left;"> Condition1 </th>
   <th style="text-align:left;"> Libelle </th>
   <th style="text-align:right;"> Eff. train </th>
   <th style="text-align:right;"> Eff. test </th>
   <th style="text-align:right;"> % train </th>
   <th style="text-align:right;"> % test </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Artery </td>
   <td style="text-align:left;"> Adjacent to arterial street </td>
   <td style="text-align:right;"> 48 </td>
   <td style="text-align:right;"> 44 </td>
   <td style="text-align:right;"> 3.29 </td>
   <td style="text-align:right;"> 3.02 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Feedr </td>
   <td style="text-align:left;"> Adjacent to feeder street </td>
   <td style="text-align:right;"> 81 </td>
   <td style="text-align:right;"> 83 </td>
   <td style="text-align:right;"> 5.55 </td>
   <td style="text-align:right;"> 5.69 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Norm </td>
   <td style="text-align:left;"> Normal </td>
   <td style="text-align:right;"> 1260 </td>
   <td style="text-align:right;"> 1251 </td>
   <td style="text-align:right;"> 86.30 </td>
   <td style="text-align:right;"> 85.74 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PosA </td>
   <td style="text-align:left;"> Adjacent to postive off-site feature </td>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:right;"> 12 </td>
   <td style="text-align:right;"> 0.55 </td>
   <td style="text-align:right;"> 0.82 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PosN </td>
   <td style="text-align:left;"> Near positive off-site feature--park </td>
   <td style="text-align:right;"> 19 </td>
   <td style="text-align:right;"> 20 </td>
   <td style="text-align:right;"> 1.30 </td>
   <td style="text-align:right;"> 1.37 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RRAe </td>
   <td style="text-align:left;"> Adjacent to East-West Railroad </td>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:right;"> 17 </td>
   <td style="text-align:right;"> 0.75 </td>
   <td style="text-align:right;"> 1.17 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RRAn </td>
   <td style="text-align:left;"> Adjacent to North-South Railroad </td>
   <td style="text-align:right;"> 26 </td>
   <td style="text-align:right;"> 24 </td>
   <td style="text-align:right;"> 1.78 </td>
   <td style="text-align:right;"> 1.64 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RRNe </td>
   <td style="text-align:left;"> Within 200' of East-West Railroad </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> 0.14 </td>
   <td style="text-align:right;"> 0.27 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RRNn </td>
   <td style="text-align:left;"> Within 200' of North-South Railroad </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> 0.34 </td>
   <td style="text-align:right;"> 0.27 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Total </td>
   <td style="text-align:left;"> Total </td>
   <td style="text-align:right;"> 1460 </td>
   <td style="text-align:right;"> 1459 </td>
   <td style="text-align:right;"> 100.00 </td>
   <td style="text-align:right;"> 99.99 </td>
  </tr>
</tbody>
</table><h4>Graphiques</h3>![](01_exploration_generale_files/figure-html/test-25.png)<!-- -->![](01_exploration_generale_files/figure-html/test-26.png)<!-- --><br/><br/><h3 class='title'>Condition2 (Nominal)</h3><h5 class='title'>Proximity to various conditions (if more than one is present)</h5><h5 class='title'><em>[FR] Proche de plusieurs type de condition</em></h5><h4>Tableau</h3><table class='table'>
 <thead>
  <tr>
   <th style="text-align:left;"> Condition2 </th>
   <th style="text-align:left;"> Libelle </th>
   <th style="text-align:right;"> Eff. train </th>
   <th style="text-align:right;"> Eff. test </th>
   <th style="text-align:right;"> % train </th>
   <th style="text-align:right;"> % test </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Artery </td>
   <td style="text-align:left;"> Adjacent to arterial street </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 0.14 </td>
   <td style="text-align:right;"> 0.21 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Feedr </td>
   <td style="text-align:left;"> Adjacent to feeder street </td>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:right;"> 0.41 </td>
   <td style="text-align:right;"> 0.48 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Norm </td>
   <td style="text-align:left;"> Normal </td>
   <td style="text-align:right;"> 1445 </td>
   <td style="text-align:right;"> 1444 </td>
   <td style="text-align:right;"> 98.97 </td>
   <td style="text-align:right;"> 98.97 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PosA </td>
   <td style="text-align:left;"> Adjacent to postive off-site feature </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 0.07 </td>
   <td style="text-align:right;"> 0.21 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PosN </td>
   <td style="text-align:left;"> Near positive off-site feature--park </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 0.14 </td>
   <td style="text-align:right;"> 0.14 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RRAe </td>
   <td style="text-align:left;"> Adjacent to East-West Railroad </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0.07 </td>
   <td style="text-align:right;"> 0.00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RRAn </td>
   <td style="text-align:left;"> Adjacent to North-South Railroad </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0.07 </td>
   <td style="text-align:right;"> 0.00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RRNn </td>
   <td style="text-align:left;"> Within 200' of North-South Railroad </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0.14 </td>
   <td style="text-align:right;"> 0.00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Total </td>
   <td style="text-align:left;"> Total </td>
   <td style="text-align:right;"> 1460 </td>
   <td style="text-align:right;"> 1459 </td>
   <td style="text-align:right;"> 100.01 </td>
   <td style="text-align:right;"> 100.01 </td>
  </tr>
</tbody>
</table><h4>Graphiques</h3>![](01_exploration_generale_files/figure-html/test-27.png)<!-- -->![](01_exploration_generale_files/figure-html/test-28.png)<!-- --><br/><br/><h3 class='title'>BldgType (Nominal)</h3><h5 class='title'>Type of dwelling</h5><h5 class='title'><em>[FR] Type du batiment</em></h5><h4>Tableau</h3><table class='table'>
 <thead>
  <tr>
   <th style="text-align:left;"> BldgType </th>
   <th style="text-align:left;"> Libelle </th>
   <th style="text-align:right;"> Eff. train </th>
   <th style="text-align:right;"> Eff. test </th>
   <th style="text-align:right;"> % train </th>
   <th style="text-align:right;"> % test </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> 1Fam </td>
   <td style="text-align:left;"> Single-family Detached </td>
   <td style="text-align:right;"> 1220 </td>
   <td style="text-align:right;"> 1205 </td>
   <td style="text-align:right;"> 83.56 </td>
   <td style="text-align:right;"> 82.59 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2fmCon </td>
   <td style="text-align:left;"> Two-family Conversion; originally built as one-family dwelling </td>
   <td style="text-align:right;"> 31 </td>
   <td style="text-align:right;"> 31 </td>
   <td style="text-align:right;"> 2.12 </td>
   <td style="text-align:right;"> 2.12 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Duplex </td>
   <td style="text-align:left;"> Duplex </td>
   <td style="text-align:right;"> 52 </td>
   <td style="text-align:right;"> 57 </td>
   <td style="text-align:right;"> 3.56 </td>
   <td style="text-align:right;"> 3.91 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Twnhs </td>
   <td style="text-align:left;"> Townhouse Inside Unit </td>
   <td style="text-align:right;"> 43 </td>
   <td style="text-align:right;"> 53 </td>
   <td style="text-align:right;"> 2.95 </td>
   <td style="text-align:right;"> 3.63 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TwnhsE </td>
   <td style="text-align:left;"> Townhouse End Unit </td>
   <td style="text-align:right;"> 114 </td>
   <td style="text-align:right;"> 113 </td>
   <td style="text-align:right;"> 7.81 </td>
   <td style="text-align:right;"> 7.75 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Total </td>
   <td style="text-align:left;"> Total </td>
   <td style="text-align:right;"> 1460 </td>
   <td style="text-align:right;"> 1459 </td>
   <td style="text-align:right;"> 100.00 </td>
   <td style="text-align:right;"> 100.00 </td>
  </tr>
</tbody>
</table><h4>Graphiques</h3>![](01_exploration_generale_files/figure-html/test-29.png)<!-- -->![](01_exploration_generale_files/figure-html/test-30.png)<!-- --><br/><br/><h3 class='title'>HouseStyle (Nominal)</h3><h5 class='title'>Style of dwelling</h5><h5 class='title'><em>[FR] Style du batiment</em></h5><h4>Tableau</h3><table class='table'>
 <thead>
  <tr>
   <th style="text-align:left;"> HouseStyle </th>
   <th style="text-align:left;"> Libelle </th>
   <th style="text-align:right;"> Eff. train </th>
   <th style="text-align:right;"> Eff. test </th>
   <th style="text-align:right;"> % train </th>
   <th style="text-align:right;"> % test </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> 1.5Fin </td>
   <td style="text-align:left;"> One and one-half story: 2nd level finished </td>
   <td style="text-align:right;"> 154 </td>
   <td style="text-align:right;"> 160 </td>
   <td style="text-align:right;"> 10.55 </td>
   <td style="text-align:right;"> 10.97 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1.5Unf </td>
   <td style="text-align:left;"> One and one-half story: 2nd level unfinished </td>
   <td style="text-align:right;"> 14 </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> 0.96 </td>
   <td style="text-align:right;"> 0.34 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1Story </td>
   <td style="text-align:left;"> One story </td>
   <td style="text-align:right;"> 726 </td>
   <td style="text-align:right;"> 745 </td>
   <td style="text-align:right;"> 49.73 </td>
   <td style="text-align:right;"> 51.06 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2.5Fin </td>
   <td style="text-align:left;"> Two and one-half story: 2nd level finished </td>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0.55 </td>
   <td style="text-align:right;"> 0.00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2.5Unf </td>
   <td style="text-align:left;"> Two and one-half story: 2nd level unfinished </td>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:right;"> 13 </td>
   <td style="text-align:right;"> 0.75 </td>
   <td style="text-align:right;"> 0.89 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2Story </td>
   <td style="text-align:left;"> Two story </td>
   <td style="text-align:right;"> 445 </td>
   <td style="text-align:right;"> 427 </td>
   <td style="text-align:right;"> 30.48 </td>
   <td style="text-align:right;"> 29.27 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SFoyer </td>
   <td style="text-align:left;"> Split Foyer </td>
   <td style="text-align:right;"> 37 </td>
   <td style="text-align:right;"> 46 </td>
   <td style="text-align:right;"> 2.53 </td>
   <td style="text-align:right;"> 3.15 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SLvl </td>
   <td style="text-align:left;"> Split Level </td>
   <td style="text-align:right;"> 65 </td>
   <td style="text-align:right;"> 63 </td>
   <td style="text-align:right;"> 4.45 </td>
   <td style="text-align:right;"> 4.32 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Total </td>
   <td style="text-align:left;"> Total </td>
   <td style="text-align:right;"> 1460 </td>
   <td style="text-align:right;"> 1459 </td>
   <td style="text-align:right;"> 100.00 </td>
   <td style="text-align:right;"> 100.00 </td>
  </tr>
</tbody>
</table><h4>Graphiques</h3>![](01_exploration_generale_files/figure-html/test-31.png)<!-- -->![](01_exploration_generale_files/figure-html/test-32.png)<!-- --><br/><br/><h3 class='title'>OverallQual (Ordinal)</h3><h5 class='title'>Rates the overall material and finish of the house</h5><h5 class='title'><em>[FR] Note general du batiment et de la finition de la maison</em></h5><h4>Tableau</h3><table class='table'>
 <thead>
  <tr>
   <th style="text-align:left;"> OverallQual </th>
   <th style="text-align:left;"> Libelle </th>
   <th style="text-align:right;"> Eff. train </th>
   <th style="text-align:right;"> Eff. test </th>
   <th style="text-align:right;"> % train </th>
   <th style="text-align:right;"> % test </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> 1 </td>
   <td style="text-align:left;"> Very Poor </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 0.14 </td>
   <td style="text-align:right;"> 0.14 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 10 </td>
   <td style="text-align:left;"> Very Excellent </td>
   <td style="text-align:right;"> 18 </td>
   <td style="text-align:right;"> 13 </td>
   <td style="text-align:right;"> 1.23 </td>
   <td style="text-align:right;"> 0.89 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2 </td>
   <td style="text-align:left;"> Poor </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:right;"> 0.21 </td>
   <td style="text-align:right;"> 0.69 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 3 </td>
   <td style="text-align:left;"> Fair </td>
   <td style="text-align:right;"> 20 </td>
   <td style="text-align:right;"> 20 </td>
   <td style="text-align:right;"> 1.37 </td>
   <td style="text-align:right;"> 1.37 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 4 </td>
   <td style="text-align:left;"> Below Average </td>
   <td style="text-align:right;"> 116 </td>
   <td style="text-align:right;"> 110 </td>
   <td style="text-align:right;"> 7.95 </td>
   <td style="text-align:right;"> 7.54 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 5 </td>
   <td style="text-align:left;"> Average </td>
   <td style="text-align:right;"> 397 </td>
   <td style="text-align:right;"> 428 </td>
   <td style="text-align:right;"> 27.19 </td>
   <td style="text-align:right;"> 29.34 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 6 </td>
   <td style="text-align:left;"> Above Average </td>
   <td style="text-align:right;"> 374 </td>
   <td style="text-align:right;"> 357 </td>
   <td style="text-align:right;"> 25.62 </td>
   <td style="text-align:right;"> 24.47 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 7 </td>
   <td style="text-align:left;"> Good </td>
   <td style="text-align:right;"> 319 </td>
   <td style="text-align:right;"> 281 </td>
   <td style="text-align:right;"> 21.85 </td>
   <td style="text-align:right;"> 19.26 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 8 </td>
   <td style="text-align:left;"> Very Good </td>
   <td style="text-align:right;"> 168 </td>
   <td style="text-align:right;"> 174 </td>
   <td style="text-align:right;"> 11.51 </td>
   <td style="text-align:right;"> 11.93 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 9 </td>
   <td style="text-align:left;"> Excellent </td>
   <td style="text-align:right;"> 43 </td>
   <td style="text-align:right;"> 64 </td>
   <td style="text-align:right;"> 2.95 </td>
   <td style="text-align:right;"> 4.39 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Total </td>
   <td style="text-align:left;"> Total </td>
   <td style="text-align:right;"> 1460 </td>
   <td style="text-align:right;"> 1459 </td>
   <td style="text-align:right;"> 100.02 </td>
   <td style="text-align:right;"> 100.02 </td>
  </tr>
</tbody>
</table><h4>Graphiques</h3>![](01_exploration_generale_files/figure-html/test-33.png)<!-- -->![](01_exploration_generale_files/figure-html/test-34.png)<!-- --><br/><br/><h3 class='title'>OverallCond (Ordinal)</h3><h5 class='title'>Rates the overall condition of the house</h5><h5 class='title'><em>[FR] Note general de l'emplacement de la maison</em></h5><h4>Tableau</h3><table class='table'>
 <thead>
  <tr>
   <th style="text-align:left;"> OverallCond </th>
   <th style="text-align:left;"> Libelle </th>
   <th style="text-align:right;"> Eff. train </th>
   <th style="text-align:right;"> Eff. test </th>
   <th style="text-align:right;"> % train </th>
   <th style="text-align:right;"> % test </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> 1 </td>
   <td style="text-align:left;"> Very Poor </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:right;"> 0.07 </td>
   <td style="text-align:right;"> 0.41 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2 </td>
   <td style="text-align:left;"> Poor </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> 0.34 </td>
   <td style="text-align:right;"> 0.34 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 3 </td>
   <td style="text-align:left;"> Fair </td>
   <td style="text-align:right;"> 25 </td>
   <td style="text-align:right;"> 25 </td>
   <td style="text-align:right;"> 1.71 </td>
   <td style="text-align:right;"> 1.71 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 4 </td>
   <td style="text-align:left;"> Below Average </td>
   <td style="text-align:right;"> 57 </td>
   <td style="text-align:right;"> 44 </td>
   <td style="text-align:right;"> 3.90 </td>
   <td style="text-align:right;"> 3.02 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 5 </td>
   <td style="text-align:left;"> Average </td>
   <td style="text-align:right;"> 821 </td>
   <td style="text-align:right;"> 824 </td>
   <td style="text-align:right;"> 56.23 </td>
   <td style="text-align:right;"> 56.48 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 6 </td>
   <td style="text-align:left;"> Above Average </td>
   <td style="text-align:right;"> 252 </td>
   <td style="text-align:right;"> 279 </td>
   <td style="text-align:right;"> 17.26 </td>
   <td style="text-align:right;"> 19.12 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 7 </td>
   <td style="text-align:left;"> Good </td>
   <td style="text-align:right;"> 205 </td>
   <td style="text-align:right;"> 185 </td>
   <td style="text-align:right;"> 14.04 </td>
   <td style="text-align:right;"> 12.68 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 8 </td>
   <td style="text-align:left;"> Very Good </td>
   <td style="text-align:right;"> 72 </td>
   <td style="text-align:right;"> 72 </td>
   <td style="text-align:right;"> 4.93 </td>
   <td style="text-align:right;"> 4.93 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 9 </td>
   <td style="text-align:left;"> Excellent </td>
   <td style="text-align:right;"> 22 </td>
   <td style="text-align:right;"> 19 </td>
   <td style="text-align:right;"> 1.51 </td>
   <td style="text-align:right;"> 1.30 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Total </td>
   <td style="text-align:left;"> Total </td>
   <td style="text-align:right;"> 1460 </td>
   <td style="text-align:right;"> 1459 </td>
   <td style="text-align:right;"> 99.99 </td>
   <td style="text-align:right;"> 99.99 </td>
  </tr>
</tbody>
</table><h4>Graphiques</h3>![](01_exploration_generale_files/figure-html/test-35.png)<!-- -->![](01_exploration_generale_files/figure-html/test-36.png)<!-- --><br/><br/><h3 class='title'>YearBuilt (Discrete)</h3><h5 class='title'>Original construction date</h5><h5 class='title'><em>[FR] Date de la construction</em></h5><h4>Tableau</h3><table class='table'>
 <thead>
  <tr>
   <th style="text-align:left;"> set </th>
   <th style="text-align:right;"> Min. </th>
   <th style="text-align:right;"> 1st Qu. </th>
   <th style="text-align:right;"> Median </th>
   <th style="text-align:right;"> 3rd Qu. </th>
   <th style="text-align:right;"> Max. </th>
   <th style="text-align:right;"> NA's </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> train </td>
   <td style="text-align:right;"> 1872 </td>
   <td style="text-align:right;"> 1954 </td>
   <td style="text-align:right;"> 1973 </td>
   <td style="text-align:right;"> 2000 </td>
   <td style="text-align:right;"> 2010 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> test </td>
   <td style="text-align:right;"> 1879 </td>
   <td style="text-align:right;"> 1953 </td>
   <td style="text-align:right;"> 1973 </td>
   <td style="text-align:right;"> 2001 </td>
   <td style="text-align:right;"> 2010 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
</tbody>
</table><h4>Graphiques</h3>![](01_exploration_generale_files/figure-html/test-37.png)<!-- -->

```
## `geom_smooth()` using method = 'gam'
```

![](01_exploration_generale_files/figure-html/test-38.png)<!-- --><br/><br/><h3 class='title'>YearRemodAdd (Discrete)</h3><h5 class='title'>Remodel date (same as construction date if no remodeling or additions)</h5><h5 class='title'><em>[FR] Date de modification (même que YearBuilt si aucune modification)</em></h5><h4>Tableau</h3><table class='table'>
 <thead>
  <tr>
   <th style="text-align:left;"> set </th>
   <th style="text-align:right;"> Min. </th>
   <th style="text-align:right;"> 1st Qu. </th>
   <th style="text-align:right;"> Median </th>
   <th style="text-align:right;"> 3rd Qu. </th>
   <th style="text-align:right;"> Max. </th>
   <th style="text-align:right;"> NA's </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> train </td>
   <td style="text-align:right;"> 1950 </td>
   <td style="text-align:right;"> 1967 </td>
   <td style="text-align:right;"> 1994 </td>
   <td style="text-align:right;"> 2004 </td>
   <td style="text-align:right;"> 2010 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> test </td>
   <td style="text-align:right;"> 1950 </td>
   <td style="text-align:right;"> 1963 </td>
   <td style="text-align:right;"> 1992 </td>
   <td style="text-align:right;"> 2004 </td>
   <td style="text-align:right;"> 2010 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
</tbody>
</table><h4>Graphiques</h3>![](01_exploration_generale_files/figure-html/test-39.png)<!-- -->

```
## `geom_smooth()` using method = 'gam'
```

![](01_exploration_generale_files/figure-html/test-40.png)<!-- --><br/><br/><h3 class='title'>RoofStyle (Nominal)</h3><h5 class='title'>Type of roof</h5><h5 class='title'><em>[FR] Type de toit</em></h5><h4>Tableau</h3><table class='table'>
 <thead>
  <tr>
   <th style="text-align:left;"> RoofStyle </th>
   <th style="text-align:left;"> Libelle </th>
   <th style="text-align:right;"> Eff. train </th>
   <th style="text-align:right;"> Eff. test </th>
   <th style="text-align:right;"> % train </th>
   <th style="text-align:right;"> % test </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Flat </td>
   <td style="text-align:left;"> Flat </td>
   <td style="text-align:right;"> 13 </td>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:right;"> 0.89 </td>
   <td style="text-align:right;"> 0.48 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Gable </td>
   <td style="text-align:left;"> Gable </td>
   <td style="text-align:right;"> 1141 </td>
   <td style="text-align:right;"> 1169 </td>
   <td style="text-align:right;"> 78.15 </td>
   <td style="text-align:right;"> 80.12 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Gambrel </td>
   <td style="text-align:left;"> Gabrel (Barn) </td>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:right;"> 0.75 </td>
   <td style="text-align:right;"> 0.75 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Hip </td>
   <td style="text-align:left;"> Hip </td>
   <td style="text-align:right;"> 286 </td>
   <td style="text-align:right;"> 265 </td>
   <td style="text-align:right;"> 19.59 </td>
   <td style="text-align:right;"> 18.16 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Mansard </td>
   <td style="text-align:left;"> Mansard </td>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> 0.48 </td>
   <td style="text-align:right;"> 0.27 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Shed </td>
   <td style="text-align:left;"> Shed </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 0.14 </td>
   <td style="text-align:right;"> 0.21 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Total </td>
   <td style="text-align:left;"> Total </td>
   <td style="text-align:right;"> 1460 </td>
   <td style="text-align:right;"> 1459 </td>
   <td style="text-align:right;"> 100.00 </td>
   <td style="text-align:right;"> 99.99 </td>
  </tr>
</tbody>
</table><h4>Graphiques</h3>![](01_exploration_generale_files/figure-html/test-41.png)<!-- -->![](01_exploration_generale_files/figure-html/test-42.png)<!-- --><br/><br/><h3 class='title'>RoofMatl (Nominal)</h3><h5 class='title'>Roof material</h5><h5 class='title'><em>[FR] Materiaux de toiture</em></h5><h4>Tableau</h3><table class='table'>
 <thead>
  <tr>
   <th style="text-align:left;"> RoofMatl </th>
   <th style="text-align:left;"> Libelle </th>
   <th style="text-align:right;"> Eff. train </th>
   <th style="text-align:right;"> Eff. test </th>
   <th style="text-align:right;"> % train </th>
   <th style="text-align:right;"> % test </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> ClyTile </td>
   <td style="text-align:left;"> Clay or Tile </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0.07 </td>
   <td style="text-align:right;"> 0.00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CompShg </td>
   <td style="text-align:left;"> Standard (Composite) Shingle </td>
   <td style="text-align:right;"> 1434 </td>
   <td style="text-align:right;"> 1442 </td>
   <td style="text-align:right;"> 98.22 </td>
   <td style="text-align:right;"> 98.83 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Membran </td>
   <td style="text-align:left;"> Membrane </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0.07 </td>
   <td style="text-align:right;"> 0.00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Metal </td>
   <td style="text-align:left;"> Metal </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0.07 </td>
   <td style="text-align:right;"> 0.00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Roll </td>
   <td style="text-align:left;"> Roll </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0.07 </td>
   <td style="text-align:right;"> 0.00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Tar&amp;Grv </td>
   <td style="text-align:left;"> Gravel &amp; Tar </td>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:right;"> 12 </td>
   <td style="text-align:right;"> 0.75 </td>
   <td style="text-align:right;"> 0.82 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> WdShake </td>
   <td style="text-align:left;"> Wood Shakes </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> 0.34 </td>
   <td style="text-align:right;"> 0.27 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> WdShngl </td>
   <td style="text-align:left;"> Wood Shingles </td>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0.41 </td>
   <td style="text-align:right;"> 0.07 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Total </td>
   <td style="text-align:left;"> Total </td>
   <td style="text-align:right;"> 1460 </td>
   <td style="text-align:right;"> 1459 </td>
   <td style="text-align:right;"> 100.00 </td>
   <td style="text-align:right;"> 99.99 </td>
  </tr>
</tbody>
</table><h4>Graphiques</h3>![](01_exploration_generale_files/figure-html/test-43.png)<!-- -->![](01_exploration_generale_files/figure-html/test-44.png)<!-- --><br/><br/><h3 class='title'>Exterior1st (Nominal)</h3><h5 class='title'>Exterior covering on house</h5><h5 class='title'><em>[FR] Revêtement facade</em></h5><h4>Tableau</h3><table class='table'>
 <thead>
  <tr>
   <th style="text-align:left;"> Exterior1st </th>
   <th style="text-align:left;"> Libelle </th>
   <th style="text-align:right;"> Eff. train </th>
   <th style="text-align:right;"> Eff. test </th>
   <th style="text-align:right;"> % train </th>
   <th style="text-align:right;"> % test </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0.00 </td>
   <td style="text-align:right;"> 0.07 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AsbShng </td>
   <td style="text-align:left;"> Asbestos Shingles </td>
   <td style="text-align:right;"> 20 </td>
   <td style="text-align:right;"> 24 </td>
   <td style="text-align:right;"> 1.37 </td>
   <td style="text-align:right;"> 1.64 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AsphShn </td>
   <td style="text-align:left;"> Asphalt Shingles </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0.07 </td>
   <td style="text-align:right;"> 0.07 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BrkComm </td>
   <td style="text-align:left;"> Brick Common </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> 0.14 </td>
   <td style="text-align:right;"> 0.27 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BrkFace </td>
   <td style="text-align:left;"> Brick Face </td>
   <td style="text-align:right;"> 50 </td>
   <td style="text-align:right;"> 37 </td>
   <td style="text-align:right;"> 3.42 </td>
   <td style="text-align:right;"> 2.54 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CBlock </td>
   <td style="text-align:left;"> Cinder Block </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0.07 </td>
   <td style="text-align:right;"> 0.07 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CemntBd </td>
   <td style="text-align:left;"> Cement Board </td>
   <td style="text-align:right;"> 61 </td>
   <td style="text-align:right;"> 65 </td>
   <td style="text-align:right;"> 4.18 </td>
   <td style="text-align:right;"> 4.46 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> HdBoard </td>
   <td style="text-align:left;"> Hard Board </td>
   <td style="text-align:right;"> 222 </td>
   <td style="text-align:right;"> 220 </td>
   <td style="text-align:right;"> 15.21 </td>
   <td style="text-align:right;"> 15.08 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ImStucc </td>
   <td style="text-align:left;"> Imitation Stucco </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0.07 </td>
   <td style="text-align:right;"> 0.00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MetalSd </td>
   <td style="text-align:left;"> Metal Siding </td>
   <td style="text-align:right;"> 220 </td>
   <td style="text-align:right;"> 230 </td>
   <td style="text-align:right;"> 15.07 </td>
   <td style="text-align:right;"> 15.76 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Plywood </td>
   <td style="text-align:left;"> Plywood </td>
   <td style="text-align:right;"> 108 </td>
   <td style="text-align:right;"> 113 </td>
   <td style="text-align:right;"> 7.40 </td>
   <td style="text-align:right;"> 7.75 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Stone </td>
   <td style="text-align:left;"> Stone </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0.14 </td>
   <td style="text-align:right;"> 0.00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Stucco </td>
   <td style="text-align:left;"> Stucco </td>
   <td style="text-align:right;"> 25 </td>
   <td style="text-align:right;"> 18 </td>
   <td style="text-align:right;"> 1.71 </td>
   <td style="text-align:right;"> 1.23 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> VinylSd </td>
   <td style="text-align:left;"> Vinyl Siding </td>
   <td style="text-align:right;"> 515 </td>
   <td style="text-align:right;"> 510 </td>
   <td style="text-align:right;"> 35.27 </td>
   <td style="text-align:right;"> 34.96 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Wd Sdng </td>
   <td style="text-align:left;"> Wood Siding </td>
   <td style="text-align:right;"> 206 </td>
   <td style="text-align:right;"> 205 </td>
   <td style="text-align:right;"> 14.11 </td>
   <td style="text-align:right;"> 14.05 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> WdShing </td>
   <td style="text-align:left;"> Wood Shingles </td>
   <td style="text-align:right;"> 26 </td>
   <td style="text-align:right;"> 30 </td>
   <td style="text-align:right;"> 1.78 </td>
   <td style="text-align:right;"> 2.06 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Total </td>
   <td style="text-align:left;"> Total </td>
   <td style="text-align:right;"> 1460 </td>
   <td style="text-align:right;"> 1459 </td>
   <td style="text-align:right;"> 100.01 </td>
   <td style="text-align:right;"> 100.01 </td>
  </tr>
</tbody>
</table><h4>Graphiques</h3>![](01_exploration_generale_files/figure-html/test-45.png)<!-- -->![](01_exploration_generale_files/figure-html/test-46.png)<!-- --><br/><br/><h3 class='title'>Exterior2nd (Nominal)</h3><h5 class='title'>Exterior covering on house (if more than one material)</h5><h5 class='title'><em>[FR] Revêtement facade (si plus d'un revêtement)</em></h5><h4>Tableau</h3><table class='table'>
 <thead>
  <tr>
   <th style="text-align:left;"> Exterior2nd </th>
   <th style="text-align:left;"> Libelle </th>
   <th style="text-align:right;"> Eff. train </th>
   <th style="text-align:right;"> Eff. test </th>
   <th style="text-align:right;"> % train </th>
   <th style="text-align:right;"> % test </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0.00 </td>
   <td style="text-align:right;"> 0.07 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AsbShng </td>
   <td style="text-align:left;"> Asbestos Shingles </td>
   <td style="text-align:right;"> 20 </td>
   <td style="text-align:right;"> 18 </td>
   <td style="text-align:right;"> 1.37 </td>
   <td style="text-align:right;"> 1.23 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AsphShn </td>
   <td style="text-align:left;"> Asphalt Shingles </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0.21 </td>
   <td style="text-align:right;"> 0.07 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Brk Cmn </td>
   <td style="text-align:left;"> Brick Common </td>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:right;"> 15 </td>
   <td style="text-align:right;"> 0.48 </td>
   <td style="text-align:right;"> 1.03 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BrkFace </td>
   <td style="text-align:left;"> Brick Face </td>
   <td style="text-align:right;"> 25 </td>
   <td style="text-align:right;"> 22 </td>
   <td style="text-align:right;"> 1.71 </td>
   <td style="text-align:right;"> 1.51 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CBlock </td>
   <td style="text-align:left;"> Cinder Block </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 0.07 </td>
   <td style="text-align:right;"> 0.14 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CmentBd </td>
   <td style="text-align:left;"> Cement Board </td>
   <td style="text-align:right;"> 60 </td>
   <td style="text-align:right;"> 66 </td>
   <td style="text-align:right;"> 4.11 </td>
   <td style="text-align:right;"> 4.52 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> HdBoard </td>
   <td style="text-align:left;"> Hard Board </td>
   <td style="text-align:right;"> 207 </td>
   <td style="text-align:right;"> 199 </td>
   <td style="text-align:right;"> 14.18 </td>
   <td style="text-align:right;"> 13.64 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ImStucc </td>
   <td style="text-align:left;"> Imitation Stucco </td>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> 0.68 </td>
   <td style="text-align:right;"> 0.34 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MetalSd </td>
   <td style="text-align:left;"> Metal Siding </td>
   <td style="text-align:right;"> 214 </td>
   <td style="text-align:right;"> 233 </td>
   <td style="text-align:right;"> 14.66 </td>
   <td style="text-align:right;"> 15.97 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Other </td>
   <td style="text-align:left;"> Other </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0.07 </td>
   <td style="text-align:right;"> 0.00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Plywood </td>
   <td style="text-align:left;"> Plywood </td>
   <td style="text-align:right;"> 142 </td>
   <td style="text-align:right;"> 128 </td>
   <td style="text-align:right;"> 9.73 </td>
   <td style="text-align:right;"> 8.77 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Stone </td>
   <td style="text-align:left;"> Stone </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0.34 </td>
   <td style="text-align:right;"> 0.07 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Stucco </td>
   <td style="text-align:left;"> Stucco </td>
   <td style="text-align:right;"> 26 </td>
   <td style="text-align:right;"> 21 </td>
   <td style="text-align:right;"> 1.78 </td>
   <td style="text-align:right;"> 1.44 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> VinylSd </td>
   <td style="text-align:left;"> Vinyl Siding </td>
   <td style="text-align:right;"> 504 </td>
   <td style="text-align:right;"> 510 </td>
   <td style="text-align:right;"> 34.52 </td>
   <td style="text-align:right;"> 34.96 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Wd Sdng </td>
   <td style="text-align:left;"> Wood Siding </td>
   <td style="text-align:right;"> 197 </td>
   <td style="text-align:right;"> 194 </td>
   <td style="text-align:right;"> 13.49 </td>
   <td style="text-align:right;"> 13.30 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Wd Shng </td>
   <td style="text-align:left;"> Wood Shingles </td>
   <td style="text-align:right;"> 38 </td>
   <td style="text-align:right;"> 43 </td>
   <td style="text-align:right;"> 2.60 </td>
   <td style="text-align:right;"> 2.95 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Total </td>
   <td style="text-align:left;"> Total </td>
   <td style="text-align:right;"> 1460 </td>
   <td style="text-align:right;"> 1459 </td>
   <td style="text-align:right;"> 100.00 </td>
   <td style="text-align:right;"> 100.01 </td>
  </tr>
</tbody>
</table><h4>Graphiques</h3>![](01_exploration_generale_files/figure-html/test-47.png)<!-- -->![](01_exploration_generale_files/figure-html/test-48.png)<!-- --><br/><br/><h3 class='title'>MasVnrType (Nominal)</h3><h5 class='title'>Masonry veneer type</h5><h5 class='title'><em>[FR] Type placage en maconnerie</em></h5><h4>Tableau</h3><table class='table'>
 <thead>
  <tr>
   <th style="text-align:left;"> MasVnrType </th>
   <th style="text-align:left;"> Libelle </th>
   <th style="text-align:right;"> Eff. train </th>
   <th style="text-align:right;"> Eff. test </th>
   <th style="text-align:right;"> % train </th>
   <th style="text-align:right;"> % test </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:right;"> 16 </td>
   <td style="text-align:right;"> 0.55 </td>
   <td style="text-align:right;"> 1.10 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BrkCmn </td>
   <td style="text-align:left;"> Brick Common </td>
   <td style="text-align:right;"> 15 </td>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:right;"> 1.03 </td>
   <td style="text-align:right;"> 0.69 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BrkFace </td>
   <td style="text-align:left;"> Brick Face </td>
   <td style="text-align:right;"> 445 </td>
   <td style="text-align:right;"> 434 </td>
   <td style="text-align:right;"> 30.48 </td>
   <td style="text-align:right;"> 29.75 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> None </td>
   <td style="text-align:left;"> None </td>
   <td style="text-align:right;"> 864 </td>
   <td style="text-align:right;"> 878 </td>
   <td style="text-align:right;"> 59.18 </td>
   <td style="text-align:right;"> 60.18 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Stone </td>
   <td style="text-align:left;"> Stone </td>
   <td style="text-align:right;"> 128 </td>
   <td style="text-align:right;"> 121 </td>
   <td style="text-align:right;"> 8.77 </td>
   <td style="text-align:right;"> 8.29 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Total </td>
   <td style="text-align:left;"> Total </td>
   <td style="text-align:right;"> 1460 </td>
   <td style="text-align:right;"> 1459 </td>
   <td style="text-align:right;"> 100.01 </td>
   <td style="text-align:right;"> 100.01 </td>
  </tr>
</tbody>
</table><h4>Graphiques</h3>![](01_exploration_generale_files/figure-html/test-49.png)<!-- -->![](01_exploration_generale_files/figure-html/test-50.png)<!-- --><br/><br/><h3 class='title'>MasVnrArea (Continuous)</h3><h5 class='title'>Masonry veneer area in square feet</h5><h5 class='title'><em>[FR] Surface de placage en maconnerie en pied au carre</em></h5><h4>Tableau</h3><table class='table'>
 <thead>
  <tr>
   <th style="text-align:left;"> set </th>
   <th style="text-align:right;"> Min. </th>
   <th style="text-align:right;"> 1st Qu. </th>
   <th style="text-align:right;"> Median </th>
   <th style="text-align:right;"> 3rd Qu. </th>
   <th style="text-align:right;"> Max. </th>
   <th style="text-align:right;"> NA's </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> train </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 166 </td>
   <td style="text-align:right;"> 1600 </td>
   <td style="text-align:right;"> 8 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> test </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 164 </td>
   <td style="text-align:right;"> 1290 </td>
   <td style="text-align:right;"> 15 </td>
  </tr>
</tbody>
</table><h4>Graphiques</h3>![](01_exploration_generale_files/figure-html/test-51.png)<!-- -->

```
## `geom_smooth()` using method = 'gam'
```

![](01_exploration_generale_files/figure-html/test-52.png)<!-- --><br/><br/><h3 class='title'>ExterQual (Ordinal)</h3><h5 class='title'>Evaluates the quality of the material on the exterior</h5><h5 class='title'><em>[FR] Evalue la qualité des matériaux extérieures</em></h5><h4>Tableau</h3><table class='table'>
 <thead>
  <tr>
   <th style="text-align:left;"> ExterQual </th>
   <th style="text-align:left;"> Libelle </th>
   <th style="text-align:right;"> Eff. train </th>
   <th style="text-align:right;"> Eff. test </th>
   <th style="text-align:right;"> % train </th>
   <th style="text-align:right;"> % test </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Ex </td>
   <td style="text-align:left;"> Excellent </td>
   <td style="text-align:right;"> 52 </td>
   <td style="text-align:right;"> 55 </td>
   <td style="text-align:right;"> 3.56 </td>
   <td style="text-align:right;"> 3.77 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Fa </td>
   <td style="text-align:left;"> Fair </td>
   <td style="text-align:right;"> 14 </td>
   <td style="text-align:right;"> 21 </td>
   <td style="text-align:right;"> 0.96 </td>
   <td style="text-align:right;"> 1.44 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Gd </td>
   <td style="text-align:left;"> Good </td>
   <td style="text-align:right;"> 488 </td>
   <td style="text-align:right;"> 491 </td>
   <td style="text-align:right;"> 33.42 </td>
   <td style="text-align:right;"> 33.65 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TA </td>
   <td style="text-align:left;"> Average/Typical </td>
   <td style="text-align:right;"> 906 </td>
   <td style="text-align:right;"> 892 </td>
   <td style="text-align:right;"> 62.05 </td>
   <td style="text-align:right;"> 61.14 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Total </td>
   <td style="text-align:left;"> Total </td>
   <td style="text-align:right;"> 1460 </td>
   <td style="text-align:right;"> 1459 </td>
   <td style="text-align:right;"> 99.99 </td>
   <td style="text-align:right;"> 100.00 </td>
  </tr>
</tbody>
</table><h4>Graphiques</h3>![](01_exploration_generale_files/figure-html/test-53.png)<!-- -->![](01_exploration_generale_files/figure-html/test-54.png)<!-- --><br/><br/><h3 class='title'>ExterCond (Ordinal)</h3><h5 class='title'>Evaluates the present condition of the material on the exterior</h5><h5 class='title'><em>[FR] Evalue l'état réel des matériaux extérieurs</em></h5><h4>Tableau</h3><table class='table'>
 <thead>
  <tr>
   <th style="text-align:left;"> ExterCond </th>
   <th style="text-align:left;"> Libelle </th>
   <th style="text-align:right;"> Eff. train </th>
   <th style="text-align:right;"> Eff. test </th>
   <th style="text-align:right;"> % train </th>
   <th style="text-align:right;"> % test </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Ex </td>
   <td style="text-align:left;"> Excellent </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:right;"> 0.21 </td>
   <td style="text-align:right;"> 0.62 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Fa </td>
   <td style="text-align:left;"> Fair </td>
   <td style="text-align:right;"> 28 </td>
   <td style="text-align:right;"> 39 </td>
   <td style="text-align:right;"> 1.92 </td>
   <td style="text-align:right;"> 2.67 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Gd </td>
   <td style="text-align:left;"> Good </td>
   <td style="text-align:right;"> 146 </td>
   <td style="text-align:right;"> 153 </td>
   <td style="text-align:right;"> 10.00 </td>
   <td style="text-align:right;"> 10.49 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Po </td>
   <td style="text-align:left;"> Poor </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 0.07 </td>
   <td style="text-align:right;"> 0.14 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TA </td>
   <td style="text-align:left;"> Average/Typical </td>
   <td style="text-align:right;"> 1282 </td>
   <td style="text-align:right;"> 1256 </td>
   <td style="text-align:right;"> 87.81 </td>
   <td style="text-align:right;"> 86.09 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Total </td>
   <td style="text-align:left;"> Total </td>
   <td style="text-align:right;"> 1460 </td>
   <td style="text-align:right;"> 1459 </td>
   <td style="text-align:right;"> 100.01 </td>
   <td style="text-align:right;"> 100.01 </td>
  </tr>
</tbody>
</table><h4>Graphiques</h3>![](01_exploration_generale_files/figure-html/test-55.png)<!-- -->![](01_exploration_generale_files/figure-html/test-56.png)<!-- --><br/><br/><h3 class='title'>Foundation (Nominal)</h3><h5 class='title'>Type of foundation</h5><h5 class='title'><em>[FR] Type de fondation</em></h5><h4>Tableau</h3><table class='table'>
 <thead>
  <tr>
   <th style="text-align:left;"> Foundation </th>
   <th style="text-align:left;"> Libelle </th>
   <th style="text-align:right;"> Eff. train </th>
   <th style="text-align:right;"> Eff. test </th>
   <th style="text-align:right;"> % train </th>
   <th style="text-align:right;"> % test </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> BrkTil </td>
   <td style="text-align:left;"> Brick &amp; Tile </td>
   <td style="text-align:right;"> 146 </td>
   <td style="text-align:right;"> 165 </td>
   <td style="text-align:right;"> 10.00 </td>
   <td style="text-align:right;"> 11.31 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CBlock </td>
   <td style="text-align:left;"> Cinder Block </td>
   <td style="text-align:right;"> 634 </td>
   <td style="text-align:right;"> 601 </td>
   <td style="text-align:right;"> 43.42 </td>
   <td style="text-align:right;"> 41.19 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PConc </td>
   <td style="text-align:left;"> Poured Contrete </td>
   <td style="text-align:right;"> 647 </td>
   <td style="text-align:right;"> 661 </td>
   <td style="text-align:right;"> 44.32 </td>
   <td style="text-align:right;"> 45.31 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Slab </td>
   <td style="text-align:left;"> Slab </td>
   <td style="text-align:right;"> 24 </td>
   <td style="text-align:right;"> 25 </td>
   <td style="text-align:right;"> 1.64 </td>
   <td style="text-align:right;"> 1.71 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Stone </td>
   <td style="text-align:left;"> Stone </td>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> 0.41 </td>
   <td style="text-align:right;"> 0.34 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Wood </td>
   <td style="text-align:left;"> Wood </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 0.21 </td>
   <td style="text-align:right;"> 0.14 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Total </td>
   <td style="text-align:left;"> Total </td>
   <td style="text-align:right;"> 1460 </td>
   <td style="text-align:right;"> 1459 </td>
   <td style="text-align:right;"> 100.00 </td>
   <td style="text-align:right;"> 100.00 </td>
  </tr>
</tbody>
</table><h4>Graphiques</h3>![](01_exploration_generale_files/figure-html/test-57.png)<!-- -->![](01_exploration_generale_files/figure-html/test-58.png)<!-- --><br/><br/><h3 class='title'>BsmtQual (Ordinal)</h3><h5 class='title'>Evaluates the height of the basement</h5><h5 class='title'><em>[FR] Evalue la taille du sous-sol (dans le sens socle de fondation)</em></h5><h4>Tableau</h3><table class='table'>
 <thead>
  <tr>
   <th style="text-align:left;"> BsmtQual </th>
   <th style="text-align:left;"> Libelle </th>
   <th style="text-align:right;"> Eff. train </th>
   <th style="text-align:right;"> Eff. test </th>
   <th style="text-align:right;"> % train </th>
   <th style="text-align:right;"> % test </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> No Basement </td>
   <td style="text-align:right;"> 37 </td>
   <td style="text-align:right;"> 44 </td>
   <td style="text-align:right;"> 2.53 </td>
   <td style="text-align:right;"> 3.02 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Ex </td>
   <td style="text-align:left;"> Excellent (100+ inches) </td>
   <td style="text-align:right;"> 121 </td>
   <td style="text-align:right;"> 137 </td>
   <td style="text-align:right;"> 8.29 </td>
   <td style="text-align:right;"> 9.39 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Fa </td>
   <td style="text-align:left;"> Fair (70-79 inches) </td>
   <td style="text-align:right;"> 35 </td>
   <td style="text-align:right;"> 53 </td>
   <td style="text-align:right;"> 2.40 </td>
   <td style="text-align:right;"> 3.63 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Gd </td>
   <td style="text-align:left;"> Good (90-99 inches) </td>
   <td style="text-align:right;"> 618 </td>
   <td style="text-align:right;"> 591 </td>
   <td style="text-align:right;"> 42.33 </td>
   <td style="text-align:right;"> 40.51 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TA </td>
   <td style="text-align:left;"> Typical (80-89 inches) </td>
   <td style="text-align:right;"> 649 </td>
   <td style="text-align:right;"> 634 </td>
   <td style="text-align:right;"> 44.45 </td>
   <td style="text-align:right;"> 43.45 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Total </td>
   <td style="text-align:left;"> Total </td>
   <td style="text-align:right;"> 1460 </td>
   <td style="text-align:right;"> 1459 </td>
   <td style="text-align:right;"> 100.00 </td>
   <td style="text-align:right;"> 100.00 </td>
  </tr>
</tbody>
</table><h4>Graphiques</h3>![](01_exploration_generale_files/figure-html/test-59.png)<!-- -->![](01_exploration_generale_files/figure-html/test-60.png)<!-- --><br/><br/><h3 class='title'>BsmtCond (Ordinal)</h3><h5 class='title'>Evaluates the general condition of the basement</h5><h5 class='title'><em>[FR] Evalue les condition general du sous-sol (dans le sens socle de fondation)</em></h5><h4>Tableau</h3><table class='table'>
 <thead>
  <tr>
   <th style="text-align:left;"> BsmtCond </th>
   <th style="text-align:left;"> Libelle </th>
   <th style="text-align:right;"> Eff. train </th>
   <th style="text-align:right;"> Eff. test </th>
   <th style="text-align:right;"> % train </th>
   <th style="text-align:right;"> % test </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> No Basement </td>
   <td style="text-align:right;"> 37 </td>
   <td style="text-align:right;"> 45 </td>
   <td style="text-align:right;"> 2.53 </td>
   <td style="text-align:right;"> 3.08 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Fa </td>
   <td style="text-align:left;"> Fair - dampness or some cracking or settling </td>
   <td style="text-align:right;"> 45 </td>
   <td style="text-align:right;"> 59 </td>
   <td style="text-align:right;"> 3.08 </td>
   <td style="text-align:right;"> 4.04 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Gd </td>
   <td style="text-align:left;"> Good </td>
   <td style="text-align:right;"> 65 </td>
   <td style="text-align:right;"> 57 </td>
   <td style="text-align:right;"> 4.45 </td>
   <td style="text-align:right;"> 3.91 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Po </td>
   <td style="text-align:left;"> Poor - Severe cracking </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 0.14 </td>
   <td style="text-align:right;"> 0.21 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TA </td>
   <td style="text-align:left;"> Typical - slight dampness allowed </td>
   <td style="text-align:right;"> 1311 </td>
   <td style="text-align:right;"> 1295 </td>
   <td style="text-align:right;"> 89.79 </td>
   <td style="text-align:right;"> 88.76 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Total </td>
   <td style="text-align:left;"> Total </td>
   <td style="text-align:right;"> 1460 </td>
   <td style="text-align:right;"> 1459 </td>
   <td style="text-align:right;"> 99.99 </td>
   <td style="text-align:right;"> 100.00 </td>
  </tr>
</tbody>
</table><h4>Graphiques</h3>![](01_exploration_generale_files/figure-html/test-61.png)<!-- -->![](01_exploration_generale_files/figure-html/test-62.png)<!-- --><br/><br/><h3 class='title'>BsmtExposure (Ordinal)</h3><h5 class='title'>Refers to walkout or garden level walls</h5><h5 class='title'><em>[FR] Walkout = sous-sol à entrée directe</em></h5><h4>Tableau</h3><table class='table'>
 <thead>
  <tr>
   <th style="text-align:left;"> BsmtExposure </th>
   <th style="text-align:left;"> Libelle </th>
   <th style="text-align:right;"> Eff. train </th>
   <th style="text-align:right;"> Eff. test </th>
   <th style="text-align:right;"> % train </th>
   <th style="text-align:right;"> % test </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> No Basement </td>
   <td style="text-align:right;"> 38 </td>
   <td style="text-align:right;"> 44 </td>
   <td style="text-align:right;"> 2.60 </td>
   <td style="text-align:right;"> 3.02 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Av </td>
   <td style="text-align:left;"> Average Exposure (split levels or foyers typically score average or above) </td>
   <td style="text-align:right;"> 221 </td>
   <td style="text-align:right;"> 197 </td>
   <td style="text-align:right;"> 15.14 </td>
   <td style="text-align:right;"> 13.50 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Gd </td>
   <td style="text-align:left;"> Good Exposure </td>
   <td style="text-align:right;"> 134 </td>
   <td style="text-align:right;"> 142 </td>
   <td style="text-align:right;"> 9.18 </td>
   <td style="text-align:right;"> 9.73 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Mn </td>
   <td style="text-align:left;"> Mimimum Exposure </td>
   <td style="text-align:right;"> 114 </td>
   <td style="text-align:right;"> 125 </td>
   <td style="text-align:right;"> 7.81 </td>
   <td style="text-align:right;"> 8.57 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> No </td>
   <td style="text-align:left;"> No Exposure </td>
   <td style="text-align:right;"> 953 </td>
   <td style="text-align:right;"> 951 </td>
   <td style="text-align:right;"> 65.27 </td>
   <td style="text-align:right;"> 65.18 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Total </td>
   <td style="text-align:left;"> Total </td>
   <td style="text-align:right;"> 1460 </td>
   <td style="text-align:right;"> 1459 </td>
   <td style="text-align:right;"> 100.00 </td>
   <td style="text-align:right;"> 100.00 </td>
  </tr>
</tbody>
</table><h4>Graphiques</h3>![](01_exploration_generale_files/figure-html/test-63.png)<!-- -->![](01_exploration_generale_files/figure-html/test-64.png)<!-- --><br/><br/><h3 class='title'>BsmtFinType1 (Ordinal)</h3><h5 class='title'>Rating of basement finished area</h5><h5 class='title'><em>[FR] Note du sous-sol (est-ce vivable?)</em></h5><h4>Tableau</h3><table class='table'>
 <thead>
  <tr>
   <th style="text-align:left;"> BsmtFinType1 </th>
   <th style="text-align:left;"> Libelle </th>
   <th style="text-align:right;"> Eff. train </th>
   <th style="text-align:right;"> Eff. test </th>
   <th style="text-align:right;"> % train </th>
   <th style="text-align:right;"> % test </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> No Basement </td>
   <td style="text-align:right;"> 37 </td>
   <td style="text-align:right;"> 42 </td>
   <td style="text-align:right;"> 2.53 </td>
   <td style="text-align:right;"> 2.88 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ALQ </td>
   <td style="text-align:left;"> Average Living Quarters </td>
   <td style="text-align:right;"> 220 </td>
   <td style="text-align:right;"> 209 </td>
   <td style="text-align:right;"> 15.07 </td>
   <td style="text-align:right;"> 14.32 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BLQ </td>
   <td style="text-align:left;"> Below Average Living Quarters </td>
   <td style="text-align:right;"> 148 </td>
   <td style="text-align:right;"> 121 </td>
   <td style="text-align:right;"> 10.14 </td>
   <td style="text-align:right;"> 8.29 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GLQ </td>
   <td style="text-align:left;"> Good Living Quarters </td>
   <td style="text-align:right;"> 418 </td>
   <td style="text-align:right;"> 431 </td>
   <td style="text-align:right;"> 28.63 </td>
   <td style="text-align:right;"> 29.54 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LwQ </td>
   <td style="text-align:left;"> Low Quality </td>
   <td style="text-align:right;"> 74 </td>
   <td style="text-align:right;"> 80 </td>
   <td style="text-align:right;"> 5.07 </td>
   <td style="text-align:right;"> 5.48 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Rec </td>
   <td style="text-align:left;"> Average Rec Room </td>
   <td style="text-align:right;"> 133 </td>
   <td style="text-align:right;"> 155 </td>
   <td style="text-align:right;"> 9.11 </td>
   <td style="text-align:right;"> 10.62 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Unf </td>
   <td style="text-align:left;"> Unfinshed </td>
   <td style="text-align:right;"> 430 </td>
   <td style="text-align:right;"> 421 </td>
   <td style="text-align:right;"> 29.45 </td>
   <td style="text-align:right;"> 28.86 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Total </td>
   <td style="text-align:left;"> Total </td>
   <td style="text-align:right;"> 1460 </td>
   <td style="text-align:right;"> 1459 </td>
   <td style="text-align:right;"> 100.00 </td>
   <td style="text-align:right;"> 99.99 </td>
  </tr>
</tbody>
</table><h4>Graphiques</h3>![](01_exploration_generale_files/figure-html/test-65.png)<!-- -->![](01_exploration_generale_files/figure-html/test-66.png)<!-- --><br/><br/><h3 class='title'>BsmtFinSF1 (Continuous)</h3><h5 class='title'>Type 1 finished square feet</h5><h5 class='title'><em>[FR] Surface finie (habitable?) du sous-sol de type 1</em></h5><h4>Tableau</h3><table class='table'>
 <thead>
  <tr>
   <th style="text-align:left;"> set </th>
   <th style="text-align:right;"> Min. </th>
   <th style="text-align:right;"> 1st Qu. </th>
   <th style="text-align:right;"> Median </th>
   <th style="text-align:right;"> 3rd Qu. </th>
   <th style="text-align:right;"> Max. </th>
   <th style="text-align:right;"> NA's </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> train </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 383.5 </td>
   <td style="text-align:right;"> 712.25 </td>
   <td style="text-align:right;"> 5644 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> test </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 350.5 </td>
   <td style="text-align:right;"> 753.50 </td>
   <td style="text-align:right;"> 4010 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
</tbody>
</table><h4>Graphiques</h3>![](01_exploration_generale_files/figure-html/test-67.png)<!-- -->

```
## `geom_smooth()` using method = 'gam'
```

![](01_exploration_generale_files/figure-html/test-68.png)<!-- --><br/><br/><h3 class='title'>BsmtFinType2 (Ordinal)</h3><h5 class='title'>Rating of basement finished area (if multiple types)</h5><h5 class='title'><em>[FR] Note du sous-sol (est-ce vivable?) type 2 si plusieurs types</em></h5><h4>Tableau</h3><table class='table'>
 <thead>
  <tr>
   <th style="text-align:left;"> BsmtFinType2 </th>
   <th style="text-align:left;"> Libelle </th>
   <th style="text-align:right;"> Eff. train </th>
   <th style="text-align:right;"> Eff. test </th>
   <th style="text-align:right;"> % train </th>
   <th style="text-align:right;"> % test </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> No Basement </td>
   <td style="text-align:right;"> 38 </td>
   <td style="text-align:right;"> 42 </td>
   <td style="text-align:right;"> 2.60 </td>
   <td style="text-align:right;"> 2.88 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ALQ </td>
   <td style="text-align:left;"> Average Living Quarters </td>
   <td style="text-align:right;"> 19 </td>
   <td style="text-align:right;"> 33 </td>
   <td style="text-align:right;"> 1.30 </td>
   <td style="text-align:right;"> 2.26 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BLQ </td>
   <td style="text-align:left;"> Below Average Living Quarters </td>
   <td style="text-align:right;"> 33 </td>
   <td style="text-align:right;"> 35 </td>
   <td style="text-align:right;"> 2.26 </td>
   <td style="text-align:right;"> 2.40 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GLQ </td>
   <td style="text-align:left;"> Good Living Quarters </td>
   <td style="text-align:right;"> 14 </td>
   <td style="text-align:right;"> 20 </td>
   <td style="text-align:right;"> 0.96 </td>
   <td style="text-align:right;"> 1.37 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LwQ </td>
   <td style="text-align:left;"> Low Quality </td>
   <td style="text-align:right;"> 46 </td>
   <td style="text-align:right;"> 41 </td>
   <td style="text-align:right;"> 3.15 </td>
   <td style="text-align:right;"> 2.81 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Rec </td>
   <td style="text-align:left;"> Average Rec Room </td>
   <td style="text-align:right;"> 54 </td>
   <td style="text-align:right;"> 51 </td>
   <td style="text-align:right;"> 3.70 </td>
   <td style="text-align:right;"> 3.50 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Unf </td>
   <td style="text-align:left;"> Unfinshed </td>
   <td style="text-align:right;"> 1256 </td>
   <td style="text-align:right;"> 1237 </td>
   <td style="text-align:right;"> 86.03 </td>
   <td style="text-align:right;"> 84.78 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Total </td>
   <td style="text-align:left;"> Total </td>
   <td style="text-align:right;"> 1460 </td>
   <td style="text-align:right;"> 1459 </td>
   <td style="text-align:right;"> 100.00 </td>
   <td style="text-align:right;"> 100.00 </td>
  </tr>
</tbody>
</table><h4>Graphiques</h3>![](01_exploration_generale_files/figure-html/test-69.png)<!-- -->![](01_exploration_generale_files/figure-html/test-70.png)<!-- --><br/><br/><h3 class='title'>BsmtFinSF2 (Continuous)</h3><h5 class='title'>Type 2 finished square feet</h5><h5 class='title'><em>[FR] Surface finie (habitable?) du sous-sol de type 2</em></h5><h4>Tableau</h3><table class='table'>
 <thead>
  <tr>
   <th style="text-align:left;"> set </th>
   <th style="text-align:right;"> Min. </th>
   <th style="text-align:right;"> 1st Qu. </th>
   <th style="text-align:right;"> Median </th>
   <th style="text-align:right;"> 3rd Qu. </th>
   <th style="text-align:right;"> Max. </th>
   <th style="text-align:right;"> NA's </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> train </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 1474 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> test </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 1526 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
</tbody>
</table><h4>Graphiques</h3>![](01_exploration_generale_files/figure-html/test-71.png)<!-- -->

```
## `geom_smooth()` using method = 'gam'
```

![](01_exploration_generale_files/figure-html/test-72.png)<!-- --><br/><br/><h3 class='title'>BsmtUnfSF (Continuous)</h3><h5 class='title'>Unfinished square feet of basement area</h5><h5 class='title'><em>[FR] Surface non finie du sous-sol (non habitable?)</em></h5><h4>Tableau</h3><table class='table'>
 <thead>
  <tr>
   <th style="text-align:left;"> set </th>
   <th style="text-align:right;"> Min. </th>
   <th style="text-align:right;"> 1st Qu. </th>
   <th style="text-align:right;"> Median </th>
   <th style="text-align:right;"> 3rd Qu. </th>
   <th style="text-align:right;"> Max. </th>
   <th style="text-align:right;"> NA's </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> train </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 223.00 </td>
   <td style="text-align:right;"> 477.5 </td>
   <td style="text-align:right;"> 808.00 </td>
   <td style="text-align:right;"> 2336 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> test </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 219.25 </td>
   <td style="text-align:right;"> 460.0 </td>
   <td style="text-align:right;"> 797.75 </td>
   <td style="text-align:right;"> 2140 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
</tbody>
</table><h4>Graphiques</h3>![](01_exploration_generale_files/figure-html/test-73.png)<!-- -->

```
## `geom_smooth()` using method = 'gam'
```

![](01_exploration_generale_files/figure-html/test-74.png)<!-- --><br/><br/><h3 class='title'>TotalBsmtSF (Continuous)</h3><h5 class='title'>Total square feet of basement area</h5><h5 class='title'><em>[FR] Surface totale du sous-sol</em></h5><h4>Tableau</h3><table class='table'>
 <thead>
  <tr>
   <th style="text-align:left;"> set </th>
   <th style="text-align:right;"> Min. </th>
   <th style="text-align:right;"> 1st Qu. </th>
   <th style="text-align:right;"> Median </th>
   <th style="text-align:right;"> 3rd Qu. </th>
   <th style="text-align:right;"> Max. </th>
   <th style="text-align:right;"> NA's </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> train </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 795.75 </td>
   <td style="text-align:right;"> 991.5 </td>
   <td style="text-align:right;"> 1298.25 </td>
   <td style="text-align:right;"> 6110 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> test </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 784.00 </td>
   <td style="text-align:right;"> 988.0 </td>
   <td style="text-align:right;"> 1305.00 </td>
   <td style="text-align:right;"> 5095 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
</tbody>
</table><h4>Graphiques</h3>![](01_exploration_generale_files/figure-html/test-75.png)<!-- -->

```
## `geom_smooth()` using method = 'gam'
```

![](01_exploration_generale_files/figure-html/test-76.png)<!-- --><br/><br/><h3 class='title'>Heating (Nominal)</h3><h5 class='title'>Type of heating</h5><h5 class='title'><em>[FR] Type de chauffage</em></h5><h4>Tableau</h3><table class='table'>
 <thead>
  <tr>
   <th style="text-align:left;"> Heating </th>
   <th style="text-align:left;"> Libelle </th>
   <th style="text-align:right;"> Eff. train </th>
   <th style="text-align:right;"> Eff. test </th>
   <th style="text-align:right;"> % train </th>
   <th style="text-align:right;"> % test </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Floor </td>
   <td style="text-align:left;"> Floor Furnace </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0.07 </td>
   <td style="text-align:right;"> 0.00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GasA </td>
   <td style="text-align:left;"> Gas forced warm air furnace </td>
   <td style="text-align:right;"> 1428 </td>
   <td style="text-align:right;"> 1446 </td>
   <td style="text-align:right;"> 97.81 </td>
   <td style="text-align:right;"> 99.11 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GasW </td>
   <td style="text-align:left;"> Gas hot water or steam heat </td>
   <td style="text-align:right;"> 18 </td>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:right;"> 1.23 </td>
   <td style="text-align:right;"> 0.62 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Grav </td>
   <td style="text-align:left;"> Gravity furnace </td>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 0.48 </td>
   <td style="text-align:right;"> 0.14 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> OthW </td>
   <td style="text-align:left;"> Hot water or steam heat other than gas </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0.14 </td>
   <td style="text-align:right;"> 0.00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Wall </td>
   <td style="text-align:left;"> Wall furnace </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 0.27 </td>
   <td style="text-align:right;"> 0.14 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Total </td>
   <td style="text-align:left;"> Total </td>
   <td style="text-align:right;"> 1460 </td>
   <td style="text-align:right;"> 1459 </td>
   <td style="text-align:right;"> 100.00 </td>
   <td style="text-align:right;"> 100.01 </td>
  </tr>
</tbody>
</table><h4>Graphiques</h3>![](01_exploration_generale_files/figure-html/test-77.png)<!-- -->![](01_exploration_generale_files/figure-html/test-78.png)<!-- --><br/><br/><h3 class='title'>HeatingQC (Ordinal)</h3><h5 class='title'>Heating quality and condition</h5><h5 class='title'><em>[FR] Qualité et état du chauffage</em></h5><h4>Tableau</h3><table class='table'>
 <thead>
  <tr>
   <th style="text-align:left;"> HeatingQC </th>
   <th style="text-align:left;"> Libelle </th>
   <th style="text-align:right;"> Eff. train </th>
   <th style="text-align:right;"> Eff. test </th>
   <th style="text-align:right;"> % train </th>
   <th style="text-align:right;"> % test </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Ex </td>
   <td style="text-align:left;"> Excellent </td>
   <td style="text-align:right;"> 741 </td>
   <td style="text-align:right;"> 752 </td>
   <td style="text-align:right;"> 50.75 </td>
   <td style="text-align:right;"> 51.54 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Fa </td>
   <td style="text-align:left;"> Fair </td>
   <td style="text-align:right;"> 49 </td>
   <td style="text-align:right;"> 43 </td>
   <td style="text-align:right;"> 3.36 </td>
   <td style="text-align:right;"> 2.95 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Gd </td>
   <td style="text-align:left;"> Good </td>
   <td style="text-align:right;"> 241 </td>
   <td style="text-align:right;"> 233 </td>
   <td style="text-align:right;"> 16.51 </td>
   <td style="text-align:right;"> 15.97 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Po </td>
   <td style="text-align:left;"> Poor </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 0.07 </td>
   <td style="text-align:right;"> 0.14 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TA </td>
   <td style="text-align:left;"> Average/Typical </td>
   <td style="text-align:right;"> 428 </td>
   <td style="text-align:right;"> 429 </td>
   <td style="text-align:right;"> 29.32 </td>
   <td style="text-align:right;"> 29.40 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Total </td>
   <td style="text-align:left;"> Total </td>
   <td style="text-align:right;"> 1460 </td>
   <td style="text-align:right;"> 1459 </td>
   <td style="text-align:right;"> 100.01 </td>
   <td style="text-align:right;"> 100.00 </td>
  </tr>
</tbody>
</table><h4>Graphiques</h3>![](01_exploration_generale_files/figure-html/test-79.png)<!-- -->![](01_exploration_generale_files/figure-html/test-80.png)<!-- --><br/><br/><h3 class='title'>CentralAir (Nominal)</h3><h5 class='title'>Central air conditioning</h5><h5 class='title'><em>[FR] Air conditionné</em></h5><h4>Tableau</h3><table class='table'>
 <thead>
  <tr>
   <th style="text-align:left;"> CentralAir </th>
   <th style="text-align:left;"> Libelle </th>
   <th style="text-align:right;"> Eff. train </th>
   <th style="text-align:right;"> Eff. test </th>
   <th style="text-align:right;"> % train </th>
   <th style="text-align:right;"> % test </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> N </td>
   <td style="text-align:left;"> No </td>
   <td style="text-align:right;"> 95 </td>
   <td style="text-align:right;"> 101 </td>
   <td style="text-align:right;"> 6.51 </td>
   <td style="text-align:right;"> 6.92 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Y </td>
   <td style="text-align:left;"> Yes </td>
   <td style="text-align:right;"> 1365 </td>
   <td style="text-align:right;"> 1358 </td>
   <td style="text-align:right;"> 93.49 </td>
   <td style="text-align:right;"> 93.08 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Total </td>
   <td style="text-align:left;"> Total </td>
   <td style="text-align:right;"> 1460 </td>
   <td style="text-align:right;"> 1459 </td>
   <td style="text-align:right;"> 100.00 </td>
   <td style="text-align:right;"> 100.00 </td>
  </tr>
</tbody>
</table><h4>Graphiques</h3>![](01_exploration_generale_files/figure-html/test-81.png)<!-- -->![](01_exploration_generale_files/figure-html/test-82.png)<!-- --><br/><br/><h3 class='title'>Electrical (Ordinal)</h3><h5 class='title'>Electrical system</h5><h5 class='title'><em>[FR] Systeme electrique</em></h5><h4>Tableau</h3><table class='table'>
 <thead>
  <tr>
   <th style="text-align:left;"> Electrical </th>
   <th style="text-align:left;"> Libelle </th>
   <th style="text-align:right;"> Eff. train </th>
   <th style="text-align:right;"> Eff. test </th>
   <th style="text-align:right;"> % train </th>
   <th style="text-align:right;"> % test </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0.07 </td>
   <td style="text-align:right;"> 0.00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FuseA </td>
   <td style="text-align:left;"> Fuse Box over 60 AMP and all Romex wiring (Average) </td>
   <td style="text-align:right;"> 94 </td>
   <td style="text-align:right;"> 94 </td>
   <td style="text-align:right;"> 6.44 </td>
   <td style="text-align:right;"> 6.44 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FuseF </td>
   <td style="text-align:left;"> 60 AMP Fuse Box and mostly Romex wiring (Fair) </td>
   <td style="text-align:right;"> 27 </td>
   <td style="text-align:right;"> 23 </td>
   <td style="text-align:right;"> 1.85 </td>
   <td style="text-align:right;"> 1.58 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FuseP </td>
   <td style="text-align:left;"> 60 AMP Fuse Box and mostly knob &amp; tube wiring (poor) </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> 0.21 </td>
   <td style="text-align:right;"> 0.34 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Mix </td>
   <td style="text-align:left;"> Mixed </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0.07 </td>
   <td style="text-align:right;"> 0.00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SBrkr </td>
   <td style="text-align:left;"> Standard Circuit Breakers &amp; Romex </td>
   <td style="text-align:right;"> 1334 </td>
   <td style="text-align:right;"> 1337 </td>
   <td style="text-align:right;"> 91.37 </td>
   <td style="text-align:right;"> 91.64 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Total </td>
   <td style="text-align:left;"> Total </td>
   <td style="text-align:right;"> 1460 </td>
   <td style="text-align:right;"> 1459 </td>
   <td style="text-align:right;"> 100.01 </td>
   <td style="text-align:right;"> 100.00 </td>
  </tr>
</tbody>
</table><h4>Graphiques</h3>![](01_exploration_generale_files/figure-html/test-83.png)<!-- -->![](01_exploration_generale_files/figure-html/test-84.png)<!-- --><br/><br/><h3 class='title'>1stFlrSF (Continuous)</h3><h5 class='title'>First Floor square feet</h5><h5 class='title'><em>[FR] Surface du premier etage</em></h5><h4>Tableau</h3><table class='table'>
 <thead>
  <tr>
   <th style="text-align:left;"> set </th>
   <th style="text-align:right;"> Min. </th>
   <th style="text-align:right;"> 1st Qu. </th>
   <th style="text-align:right;"> Median </th>
   <th style="text-align:right;"> 3rd Qu. </th>
   <th style="text-align:right;"> Max. </th>
   <th style="text-align:right;"> NA's </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> train </td>
   <td style="text-align:right;"> 334 </td>
   <td style="text-align:right;"> 882.0 </td>
   <td style="text-align:right;"> 1087 </td>
   <td style="text-align:right;"> 1391.25 </td>
   <td style="text-align:right;"> 4692 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> test </td>
   <td style="text-align:right;"> 407 </td>
   <td style="text-align:right;"> 873.5 </td>
   <td style="text-align:right;"> 1079 </td>
   <td style="text-align:right;"> 1382.50 </td>
   <td style="text-align:right;"> 5095 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
</tbody>
</table><h4>Graphiques</h3>![](01_exploration_generale_files/figure-html/test-85.png)<!-- -->

```
## `geom_smooth()` using method = 'gam'
```

![](01_exploration_generale_files/figure-html/test-86.png)<!-- --><br/><br/><h3 class='title'>2ndFlrSF (Continuous)</h3><h5 class='title'>Second Floor square feet</h5><h5 class='title'><em>[FR] Surface du second etage</em></h5><h4>Tableau</h3><table class='table'>
 <thead>
  <tr>
   <th style="text-align:left;"> set </th>
   <th style="text-align:right;"> Min. </th>
   <th style="text-align:right;"> 1st Qu. </th>
   <th style="text-align:right;"> Median </th>
   <th style="text-align:right;"> 3rd Qu. </th>
   <th style="text-align:right;"> Max. </th>
   <th style="text-align:right;"> NA's </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> train </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 728 </td>
   <td style="text-align:right;"> 2065 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> test </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 676 </td>
   <td style="text-align:right;"> 1862 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
</tbody>
</table><h4>Graphiques</h3>![](01_exploration_generale_files/figure-html/test-87.png)<!-- -->

```
## `geom_smooth()` using method = 'gam'
```

![](01_exploration_generale_files/figure-html/test-88.png)<!-- --><br/><br/><h3 class='title'>LowQualFinSF (Continuous)</h3><h5 class='title'>Low quality finished square feet (all floors)</h5><h5 class='title'><em>[FR] Surface globale ?</em></h5><h4>Tableau</h3><table class='table'>
 <thead>
  <tr>
   <th style="text-align:left;"> set </th>
   <th style="text-align:right;"> Min. </th>
   <th style="text-align:right;"> 1st Qu. </th>
   <th style="text-align:right;"> Median </th>
   <th style="text-align:right;"> 3rd Qu. </th>
   <th style="text-align:right;"> Max. </th>
   <th style="text-align:right;"> NA's </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> train </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 572 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> test </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 1064 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
</tbody>
</table><h4>Graphiques</h3>![](01_exploration_generale_files/figure-html/test-89.png)<!-- -->

```
## `geom_smooth()` using method = 'gam'
```

![](01_exploration_generale_files/figure-html/test-90.png)<!-- --><br/><br/><h3 class='title'>GrLivArea (Continuous)</h3><h5 class='title'>Above grade (ground) living area square feet</h5><h5 class='title'><em>[FR] Surface globale hormis sous-sol ?</em></h5><h4>Tableau</h3><table class='table'>
 <thead>
  <tr>
   <th style="text-align:left;"> set </th>
   <th style="text-align:right;"> Min. </th>
   <th style="text-align:right;"> 1st Qu. </th>
   <th style="text-align:right;"> Median </th>
   <th style="text-align:right;"> 3rd Qu. </th>
   <th style="text-align:right;"> Max. </th>
   <th style="text-align:right;"> NA's </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> train </td>
   <td style="text-align:right;"> 334 </td>
   <td style="text-align:right;"> 1129.5 </td>
   <td style="text-align:right;"> 1464 </td>
   <td style="text-align:right;"> 1776.75 </td>
   <td style="text-align:right;"> 5642 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> test </td>
   <td style="text-align:right;"> 407 </td>
   <td style="text-align:right;"> 1117.5 </td>
   <td style="text-align:right;"> 1432 </td>
   <td style="text-align:right;"> 1721.00 </td>
   <td style="text-align:right;"> 5095 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
</tbody>
</table><h4>Graphiques</h3>![](01_exploration_generale_files/figure-html/test-91.png)<!-- -->

```
## `geom_smooth()` using method = 'gam'
```

![](01_exploration_generale_files/figure-html/test-92.png)<!-- --><br/><br/><h3 class='title'>BsmtFullBath (Discrete)</h3><h5 class='title'>Basement full bathrooms</h5><h5 class='title'><em>[FR] Nombre de salle de bain complète au sous sol</em></h5><h4>Tableau</h3><table class='table'>
 <thead>
  <tr>
   <th style="text-align:left;"> set </th>
   <th style="text-align:right;"> Min. </th>
   <th style="text-align:right;"> 1st Qu. </th>
   <th style="text-align:right;"> Median </th>
   <th style="text-align:right;"> 3rd Qu. </th>
   <th style="text-align:right;"> Max. </th>
   <th style="text-align:right;"> NA's </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> train </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> test </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
</tbody>
</table><h4>Graphiques</h3>![](01_exploration_generale_files/figure-html/test-93.png)<!-- -->

```
## `geom_smooth()` using method = 'gam'
```

![](01_exploration_generale_files/figure-html/test-94.png)<!-- --><br/><br/><h3 class='title'>BsmtHalfBath (Discrete)</h3><h5 class='title'>Basement half bathrooms</h5><h5 class='title'><em>[FR] Nombre de salle de bain au sous sol</em></h5><h4>Tableau</h3><table class='table'>
 <thead>
  <tr>
   <th style="text-align:left;"> set </th>
   <th style="text-align:right;"> Min. </th>
   <th style="text-align:right;"> 1st Qu. </th>
   <th style="text-align:right;"> Median </th>
   <th style="text-align:right;"> 3rd Qu. </th>
   <th style="text-align:right;"> Max. </th>
   <th style="text-align:right;"> NA's </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> train </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> test </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
</tbody>
</table><h4>Graphiques</h3>![](01_exploration_generale_files/figure-html/test-95.png)<!-- -->

```
## `geom_smooth()` using method = 'gam'
```

![](01_exploration_generale_files/figure-html/test-96.png)<!-- --><br/><br/><h3 class='title'>FullBath (Discrete)</h3><h5 class='title'>Full bathrooms above grade</h5><h5 class='title'><em>[FR] Nombre de salle de bain complète sans compter le sous sol</em></h5><h4>Tableau</h3><table class='table'>
 <thead>
  <tr>
   <th style="text-align:left;"> set </th>
   <th style="text-align:right;"> Min. </th>
   <th style="text-align:right;"> 1st Qu. </th>
   <th style="text-align:right;"> Median </th>
   <th style="text-align:right;"> 3rd Qu. </th>
   <th style="text-align:right;"> Max. </th>
   <th style="text-align:right;"> NA's </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> train </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> test </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
</tbody>
</table><h4>Graphiques</h3>![](01_exploration_generale_files/figure-html/test-97.png)<!-- -->

```
## `geom_smooth()` using method = 'gam'
```

![](01_exploration_generale_files/figure-html/test-98.png)<!-- --><br/><br/><h3 class='title'>HalfBath (Discrete)</h3><h5 class='title'>Half bathrooms above grade</h5><h5 class='title'><em>[FR] Nombre de salle de bain sans compter le sous sol</em></h5><h4>Tableau</h3><table class='table'>
 <thead>
  <tr>
   <th style="text-align:left;"> set </th>
   <th style="text-align:right;"> Min. </th>
   <th style="text-align:right;"> 1st Qu. </th>
   <th style="text-align:right;"> Median </th>
   <th style="text-align:right;"> 3rd Qu. </th>
   <th style="text-align:right;"> Max. </th>
   <th style="text-align:right;"> NA's </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> train </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> test </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
</tbody>
</table><h4>Graphiques</h3>![](01_exploration_generale_files/figure-html/test-99.png)<!-- -->

```
## `geom_smooth()` using method = 'gam'
```

![](01_exploration_generale_files/figure-html/test-100.png)<!-- --><br/><br/><h3 class='title'>BedroomAbvGr (Discrete)</h3><h5 class='title'>Bedrooms above grade (does NOT include basement bedrooms)</h5><h5 class='title'><em>[FR] Nombre de chambre en dehors du sous sol</em></h5><h4>Tableau</h3><table class='table'>
 <thead>
  <tr>
   <th style="text-align:left;"> set </th>
   <th style="text-align:right;"> Min. </th>
   <th style="text-align:right;"> 1st Qu. </th>
   <th style="text-align:right;"> Median </th>
   <th style="text-align:right;"> 3rd Qu. </th>
   <th style="text-align:right;"> Max. </th>
   <th style="text-align:right;"> NA's </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> train </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> test </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
</tbody>
</table><h4>Graphiques</h3>![](01_exploration_generale_files/figure-html/test-101.png)<!-- -->

```
## `geom_smooth()` using method = 'gam'
```

![](01_exploration_generale_files/figure-html/test-102.png)<!-- --><br/><br/><h3 class='title'>KitchenAbvGr (Discrete)</h3><h5 class='title'>Kitchens above grade</h5><h5 class='title'><em>[FR] Nombre de cuisine</em></h5><h4>Tableau</h3><table class='table'>
 <thead>
  <tr>
   <th style="text-align:left;"> set </th>
   <th style="text-align:right;"> Min. </th>
   <th style="text-align:right;"> 1st Qu. </th>
   <th style="text-align:right;"> Median </th>
   <th style="text-align:right;"> 3rd Qu. </th>
   <th style="text-align:right;"> Max. </th>
   <th style="text-align:right;"> NA's </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> train </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> test </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
</tbody>
</table><h4>Graphiques</h3>![](01_exploration_generale_files/figure-html/test-103.png)<!-- -->

```
## `geom_smooth()` using method = 'gam'
```

![](01_exploration_generale_files/figure-html/test-104.png)<!-- --><br/><br/><h3 class='title'>KitchenQual (Ordinal)</h3><h5 class='title'>Kitchen quality</h5><h5 class='title'><em>[FR] Qualité cuisine</em></h5><h4>Tableau</h3><table class='table'>
 <thead>
  <tr>
   <th style="text-align:left;"> KitchenQual </th>
   <th style="text-align:left;"> Libelle </th>
   <th style="text-align:right;"> Eff. train </th>
   <th style="text-align:right;"> Eff. test </th>
   <th style="text-align:right;"> % train </th>
   <th style="text-align:right;"> % test </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0.00 </td>
   <td style="text-align:right;"> 0.07 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Ex </td>
   <td style="text-align:left;"> Excellent </td>
   <td style="text-align:right;"> 100 </td>
   <td style="text-align:right;"> 105 </td>
   <td style="text-align:right;"> 6.85 </td>
   <td style="text-align:right;"> 7.20 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Fa </td>
   <td style="text-align:left;"> Fair </td>
   <td style="text-align:right;"> 39 </td>
   <td style="text-align:right;"> 31 </td>
   <td style="text-align:right;"> 2.67 </td>
   <td style="text-align:right;"> 2.12 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Gd </td>
   <td style="text-align:left;"> Good </td>
   <td style="text-align:right;"> 586 </td>
   <td style="text-align:right;"> 565 </td>
   <td style="text-align:right;"> 40.14 </td>
   <td style="text-align:right;"> 38.73 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TA </td>
   <td style="text-align:left;"> Average/Typical </td>
   <td style="text-align:right;"> 735 </td>
   <td style="text-align:right;"> 757 </td>
   <td style="text-align:right;"> 50.34 </td>
   <td style="text-align:right;"> 51.88 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Total </td>
   <td style="text-align:left;"> Total </td>
   <td style="text-align:right;"> 1460 </td>
   <td style="text-align:right;"> 1459 </td>
   <td style="text-align:right;"> 100.00 </td>
   <td style="text-align:right;"> 100.00 </td>
  </tr>
</tbody>
</table><h4>Graphiques</h3>![](01_exploration_generale_files/figure-html/test-105.png)<!-- -->![](01_exploration_generale_files/figure-html/test-106.png)<!-- --><br/><br/><h3 class='title'>TotRmsAbvGrd (Discrete)</h3><h5 class='title'>Total rooms above grade (does not include bathrooms)</h5><h5 class='title'><em>[FR] Nombre de pièce hors sous-sol et salle de bain</em></h5><h4>Tableau</h3><table class='table'>
 <thead>
  <tr>
   <th style="text-align:left;"> set </th>
   <th style="text-align:right;"> Min. </th>
   <th style="text-align:right;"> 1st Qu. </th>
   <th style="text-align:right;"> Median </th>
   <th style="text-align:right;"> 3rd Qu. </th>
   <th style="text-align:right;"> Max. </th>
   <th style="text-align:right;"> NA's </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> train </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:right;"> 14 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> test </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:right;"> 15 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
</tbody>
</table><h4>Graphiques</h3>![](01_exploration_generale_files/figure-html/test-107.png)<!-- -->

```
## `geom_smooth()` using method = 'gam'
```

![](01_exploration_generale_files/figure-html/test-108.png)<!-- --><br/><br/><h3 class='title'>Functional (Ordinal)</h3><h5 class='title'>Home functionality (Assume typical unless deductions are warranted)</h5><h5 class='title'><em>[FR] ??</em></h5><h4>Tableau</h3><table class='table'>
 <thead>
  <tr>
   <th style="text-align:left;"> Functional </th>
   <th style="text-align:left;"> Libelle </th>
   <th style="text-align:right;"> Eff. train </th>
   <th style="text-align:right;"> Eff. test </th>
   <th style="text-align:right;"> % train </th>
   <th style="text-align:right;"> % test </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 0.00 </td>
   <td style="text-align:right;"> 0.14 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Maj1 </td>
   <td style="text-align:left;"> Major Deductions 1 </td>
   <td style="text-align:right;"> 14 </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> 0.96 </td>
   <td style="text-align:right;"> 0.34 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Maj2 </td>
   <td style="text-align:left;"> Major Deductions 2 </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> 0.34 </td>
   <td style="text-align:right;"> 0.27 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Min1 </td>
   <td style="text-align:left;"> Minor Deductions 1 </td>
   <td style="text-align:right;"> 31 </td>
   <td style="text-align:right;"> 34 </td>
   <td style="text-align:right;"> 2.12 </td>
   <td style="text-align:right;"> 2.33 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Min2 </td>
   <td style="text-align:left;"> Minor Deductions 2 </td>
   <td style="text-align:right;"> 34 </td>
   <td style="text-align:right;"> 36 </td>
   <td style="text-align:right;"> 2.33 </td>
   <td style="text-align:right;"> 2.47 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Mod </td>
   <td style="text-align:left;"> Moderate Deductions </td>
   <td style="text-align:right;"> 15 </td>
   <td style="text-align:right;"> 20 </td>
   <td style="text-align:right;"> 1.03 </td>
   <td style="text-align:right;"> 1.37 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Sev </td>
   <td style="text-align:left;"> Severely Damaged </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0.07 </td>
   <td style="text-align:right;"> 0.07 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Typ </td>
   <td style="text-align:left;"> Typical Functionality </td>
   <td style="text-align:right;"> 1360 </td>
   <td style="text-align:right;"> 1357 </td>
   <td style="text-align:right;"> 93.15 </td>
   <td style="text-align:right;"> 93.01 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Total </td>
   <td style="text-align:left;"> Total </td>
   <td style="text-align:right;"> 1460 </td>
   <td style="text-align:right;"> 1459 </td>
   <td style="text-align:right;"> 100.00 </td>
   <td style="text-align:right;"> 100.00 </td>
  </tr>
</tbody>
</table><h4>Graphiques</h3>![](01_exploration_generale_files/figure-html/test-109.png)<!-- -->![](01_exploration_generale_files/figure-html/test-110.png)<!-- --><br/><br/><h3 class='title'>Fireplaces (Discrete)</h3><h5 class='title'>Number of fireplaces</h5><h5 class='title'><em>[FR] Nombre de cheminée</em></h5><h4>Tableau</h3><table class='table'>
 <thead>
  <tr>
   <th style="text-align:left;"> set </th>
   <th style="text-align:right;"> Min. </th>
   <th style="text-align:right;"> 1st Qu. </th>
   <th style="text-align:right;"> Median </th>
   <th style="text-align:right;"> 3rd Qu. </th>
   <th style="text-align:right;"> Max. </th>
   <th style="text-align:right;"> NA's </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> train </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> test </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
</tbody>
</table><h4>Graphiques</h3>![](01_exploration_generale_files/figure-html/test-111.png)<!-- -->

```
## `geom_smooth()` using method = 'gam'
```

![](01_exploration_generale_files/figure-html/test-112.png)<!-- --><br/><br/><h3 class='title'>FireplaceQu (Ordinal)</h3><h5 class='title'>Fireplace quality</h5><h5 class='title'><em>[FR] Qualité cheminée</em></h5><h4>Tableau</h3><table class='table'>
 <thead>
  <tr>
   <th style="text-align:left;"> FireplaceQu </th>
   <th style="text-align:left;"> Libelle </th>
   <th style="text-align:right;"> Eff. train </th>
   <th style="text-align:right;"> Eff. test </th>
   <th style="text-align:right;"> % train </th>
   <th style="text-align:right;"> % test </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> No Fireplace </td>
   <td style="text-align:right;"> 690 </td>
   <td style="text-align:right;"> 730 </td>
   <td style="text-align:right;"> 47.26 </td>
   <td style="text-align:right;"> 50.03 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Ex </td>
   <td style="text-align:left;"> Excellent - Exceptional Masonry Fireplace </td>
   <td style="text-align:right;"> 24 </td>
   <td style="text-align:right;"> 19 </td>
   <td style="text-align:right;"> 1.64 </td>
   <td style="text-align:right;"> 1.30 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Fa </td>
   <td style="text-align:left;"> Fair - Prefabricated Fireplace in basement </td>
   <td style="text-align:right;"> 33 </td>
   <td style="text-align:right;"> 41 </td>
   <td style="text-align:right;"> 2.26 </td>
   <td style="text-align:right;"> 2.81 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Gd </td>
   <td style="text-align:left;"> Good - Masonry Fireplace in main level </td>
   <td style="text-align:right;"> 380 </td>
   <td style="text-align:right;"> 364 </td>
   <td style="text-align:right;"> 26.03 </td>
   <td style="text-align:right;"> 24.95 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Po </td>
   <td style="text-align:left;"> Poor - Ben Franklin Stove </td>
   <td style="text-align:right;"> 20 </td>
   <td style="text-align:right;"> 26 </td>
   <td style="text-align:right;"> 1.37 </td>
   <td style="text-align:right;"> 1.78 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TA </td>
   <td style="text-align:left;"> Average - Prefabricated Fireplace in main living area or Masonry Fireplace in basement </td>
   <td style="text-align:right;"> 313 </td>
   <td style="text-align:right;"> 279 </td>
   <td style="text-align:right;"> 21.44 </td>
   <td style="text-align:right;"> 19.12 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Total </td>
   <td style="text-align:left;"> Total </td>
   <td style="text-align:right;"> 1460 </td>
   <td style="text-align:right;"> 1459 </td>
   <td style="text-align:right;"> 100.00 </td>
   <td style="text-align:right;"> 99.99 </td>
  </tr>
</tbody>
</table><h4>Graphiques</h3>![](01_exploration_generale_files/figure-html/test-113.png)<!-- -->![](01_exploration_generale_files/figure-html/test-114.png)<!-- --><br/><br/><h3 class='title'>GarageType (Nominal)</h3><h5 class='title'>Garage location</h5><h5 class='title'><em>[FR] localisation du garage</em></h5><h4>Tableau</h3><table class='table'>
 <thead>
  <tr>
   <th style="text-align:left;"> GarageType </th>
   <th style="text-align:left;"> Libelle </th>
   <th style="text-align:right;"> Eff. train </th>
   <th style="text-align:right;"> Eff. test </th>
   <th style="text-align:right;"> % train </th>
   <th style="text-align:right;"> % test </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> No Garage </td>
   <td style="text-align:right;"> 81 </td>
   <td style="text-align:right;"> 76 </td>
   <td style="text-align:right;"> 5.55 </td>
   <td style="text-align:right;"> 5.21 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2Types </td>
   <td style="text-align:left;"> More than one type of garage </td>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:right;"> 17 </td>
   <td style="text-align:right;"> 0.41 </td>
   <td style="text-align:right;"> 1.17 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Attchd </td>
   <td style="text-align:left;"> Attached to home </td>
   <td style="text-align:right;"> 870 </td>
   <td style="text-align:right;"> 853 </td>
   <td style="text-align:right;"> 59.59 </td>
   <td style="text-align:right;"> 58.46 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Basment </td>
   <td style="text-align:left;"> Basement Garage </td>
   <td style="text-align:right;"> 19 </td>
   <td style="text-align:right;"> 17 </td>
   <td style="text-align:right;"> 1.30 </td>
   <td style="text-align:right;"> 1.17 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BuiltIn </td>
   <td style="text-align:left;"> Built-In (Garage part of house - typically has room above garage) </td>
   <td style="text-align:right;"> 88 </td>
   <td style="text-align:right;"> 98 </td>
   <td style="text-align:right;"> 6.03 </td>
   <td style="text-align:right;"> 6.72 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CarPort </td>
   <td style="text-align:left;"> Car Port </td>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:right;"> 0.62 </td>
   <td style="text-align:right;"> 0.41 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Detchd </td>
   <td style="text-align:left;"> Detached from home </td>
   <td style="text-align:right;"> 387 </td>
   <td style="text-align:right;"> 392 </td>
   <td style="text-align:right;"> 26.51 </td>
   <td style="text-align:right;"> 26.87 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Total </td>
   <td style="text-align:left;"> Total </td>
   <td style="text-align:right;"> 1460 </td>
   <td style="text-align:right;"> 1459 </td>
   <td style="text-align:right;"> 100.01 </td>
   <td style="text-align:right;"> 100.01 </td>
  </tr>
</tbody>
</table><h4>Graphiques</h3>![](01_exploration_generale_files/figure-html/test-115.png)<!-- -->![](01_exploration_generale_files/figure-html/test-116.png)<!-- --><br/><br/><h3 class='title'>GarageYrBlt (Discrete)</h3><h5 class='title'>Year garage was built</h5><h5 class='title'><em>[FR] Année de construction du garage</em></h5><h4>Tableau</h3><table class='table'>
 <thead>
  <tr>
   <th style="text-align:left;"> set </th>
   <th style="text-align:right;"> Min. </th>
   <th style="text-align:right;"> 1st Qu. </th>
   <th style="text-align:right;"> Median </th>
   <th style="text-align:right;"> 3rd Qu. </th>
   <th style="text-align:right;"> Max. </th>
   <th style="text-align:right;"> NA's </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> train </td>
   <td style="text-align:right;"> 1900 </td>
   <td style="text-align:right;"> 1961 </td>
   <td style="text-align:right;"> 1980 </td>
   <td style="text-align:right;"> 2002 </td>
   <td style="text-align:right;"> 2010 </td>
   <td style="text-align:right;"> 81 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> test </td>
   <td style="text-align:right;"> 1895 </td>
   <td style="text-align:right;"> 1959 </td>
   <td style="text-align:right;"> 1979 </td>
   <td style="text-align:right;"> 2002 </td>
   <td style="text-align:right;"> 2207 </td>
   <td style="text-align:right;"> 78 </td>
  </tr>
</tbody>
</table><h4>Graphiques</h3>![](01_exploration_generale_files/figure-html/test-117.png)<!-- -->

```
## `geom_smooth()` using method = 'gam'
```

![](01_exploration_generale_files/figure-html/test-118.png)<!-- --><br/><br/><h3 class='title'>GarageFinish (Ordinal)</h3><h5 class='title'>Interior finish of the garage</h5><h5 class='title'><em>[FR] Finition intérieure du garage</em></h5><h4>Tableau</h3><table class='table'>
 <thead>
  <tr>
   <th style="text-align:left;"> GarageFinish </th>
   <th style="text-align:left;"> Libelle </th>
   <th style="text-align:right;"> Eff. train </th>
   <th style="text-align:right;"> Eff. test </th>
   <th style="text-align:right;"> % train </th>
   <th style="text-align:right;"> % test </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> No Garage </td>
   <td style="text-align:right;"> 81 </td>
   <td style="text-align:right;"> 78 </td>
   <td style="text-align:right;"> 5.55 </td>
   <td style="text-align:right;"> 5.35 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Fin </td>
   <td style="text-align:left;"> Finished </td>
   <td style="text-align:right;"> 352 </td>
   <td style="text-align:right;"> 367 </td>
   <td style="text-align:right;"> 24.11 </td>
   <td style="text-align:right;"> 25.15 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RFn </td>
   <td style="text-align:left;"> Rough Finished </td>
   <td style="text-align:right;"> 422 </td>
   <td style="text-align:right;"> 389 </td>
   <td style="text-align:right;"> 28.90 </td>
   <td style="text-align:right;"> 26.66 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Unf </td>
   <td style="text-align:left;"> Unfinished </td>
   <td style="text-align:right;"> 605 </td>
   <td style="text-align:right;"> 625 </td>
   <td style="text-align:right;"> 41.44 </td>
   <td style="text-align:right;"> 42.84 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Total </td>
   <td style="text-align:left;"> Total </td>
   <td style="text-align:right;"> 1460 </td>
   <td style="text-align:right;"> 1459 </td>
   <td style="text-align:right;"> 100.00 </td>
   <td style="text-align:right;"> 100.00 </td>
  </tr>
</tbody>
</table><h4>Graphiques</h3>![](01_exploration_generale_files/figure-html/test-119.png)<!-- -->![](01_exploration_generale_files/figure-html/test-120.png)<!-- --><br/><br/><h3 class='title'>GarageCars (Discrete)</h3><h5 class='title'>Size of garage in car capacity</h5><h5 class='title'><em>[FR] Taille du garage en capacité de nombre de voiture</em></h5><h4>Tableau</h3><table class='table'>
 <thead>
  <tr>
   <th style="text-align:left;"> set </th>
   <th style="text-align:right;"> Min. </th>
   <th style="text-align:right;"> 1st Qu. </th>
   <th style="text-align:right;"> Median </th>
   <th style="text-align:right;"> 3rd Qu. </th>
   <th style="text-align:right;"> Max. </th>
   <th style="text-align:right;"> NA's </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> train </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> test </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
</tbody>
</table><h4>Graphiques</h3>![](01_exploration_generale_files/figure-html/test-121.png)<!-- -->

```
## `geom_smooth()` using method = 'gam'
```

![](01_exploration_generale_files/figure-html/test-122.png)<!-- --><br/><br/><h3 class='title'>GarageArea (Continuous)</h3><h5 class='title'>Size of garage in square feet</h5><h5 class='title'><em>[FR] Taille du garage en pied carré</em></h5><h4>Tableau</h3><table class='table'>
 <thead>
  <tr>
   <th style="text-align:left;"> set </th>
   <th style="text-align:right;"> Min. </th>
   <th style="text-align:right;"> 1st Qu. </th>
   <th style="text-align:right;"> Median </th>
   <th style="text-align:right;"> 3rd Qu. </th>
   <th style="text-align:right;"> Max. </th>
   <th style="text-align:right;"> NA's </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> train </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 334.5 </td>
   <td style="text-align:right;"> 480 </td>
   <td style="text-align:right;"> 576 </td>
   <td style="text-align:right;"> 1418 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> test </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 318.0 </td>
   <td style="text-align:right;"> 480 </td>
   <td style="text-align:right;"> 576 </td>
   <td style="text-align:right;"> 1488 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
</tbody>
</table><h4>Graphiques</h3>![](01_exploration_generale_files/figure-html/test-123.png)<!-- -->

```
## `geom_smooth()` using method = 'gam'
```

![](01_exploration_generale_files/figure-html/test-124.png)<!-- --><br/><br/><h3 class='title'>GarageQual (Ordinal)</h3><h5 class='title'>Garage quality</h5><h5 class='title'><em>[FR] Qualité du garage</em></h5><h4>Tableau</h3><table class='table'>
 <thead>
  <tr>
   <th style="text-align:left;"> GarageQual </th>
   <th style="text-align:left;"> Libelle </th>
   <th style="text-align:right;"> Eff. train </th>
   <th style="text-align:right;"> Eff. test </th>
   <th style="text-align:right;"> % train </th>
   <th style="text-align:right;"> % test </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> No Garage </td>
   <td style="text-align:right;"> 81 </td>
   <td style="text-align:right;"> 78 </td>
   <td style="text-align:right;"> 5.55 </td>
   <td style="text-align:right;"> 5.35 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Ex </td>
   <td style="text-align:left;"> Excellent </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0.21 </td>
   <td style="text-align:right;"> 0.00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Fa </td>
   <td style="text-align:left;"> Fair </td>
   <td style="text-align:right;"> 48 </td>
   <td style="text-align:right;"> 76 </td>
   <td style="text-align:right;"> 3.29 </td>
   <td style="text-align:right;"> 5.21 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Gd </td>
   <td style="text-align:left;"> Good </td>
   <td style="text-align:right;"> 14 </td>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:right;"> 0.96 </td>
   <td style="text-align:right;"> 0.69 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Po </td>
   <td style="text-align:left;"> Poor </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 0.21 </td>
   <td style="text-align:right;"> 0.14 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TA </td>
   <td style="text-align:left;"> Average/Typical </td>
   <td style="text-align:right;"> 1311 </td>
   <td style="text-align:right;"> 1293 </td>
   <td style="text-align:right;"> 89.79 </td>
   <td style="text-align:right;"> 88.62 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Total </td>
   <td style="text-align:left;"> Total </td>
   <td style="text-align:right;"> 1460 </td>
   <td style="text-align:right;"> 1459 </td>
   <td style="text-align:right;"> 100.01 </td>
   <td style="text-align:right;"> 100.01 </td>
  </tr>
</tbody>
</table><h4>Graphiques</h3>![](01_exploration_generale_files/figure-html/test-125.png)<!-- -->![](01_exploration_generale_files/figure-html/test-126.png)<!-- --><br/><br/><h3 class='title'>GarageCond (Ordinal)</h3><h5 class='title'>Garage condition</h5><h5 class='title'><em>[FR] Etat du garage</em></h5><h4>Tableau</h3><table class='table'>
 <thead>
  <tr>
   <th style="text-align:left;"> GarageCond </th>
   <th style="text-align:left;"> Libelle </th>
   <th style="text-align:right;"> Eff. train </th>
   <th style="text-align:right;"> Eff. test </th>
   <th style="text-align:right;"> % train </th>
   <th style="text-align:right;"> % test </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> No Garage </td>
   <td style="text-align:right;"> 81 </td>
   <td style="text-align:right;"> 78 </td>
   <td style="text-align:right;"> 5.55 </td>
   <td style="text-align:right;"> 5.35 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Ex </td>
   <td style="text-align:left;"> Excellent </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0.14 </td>
   <td style="text-align:right;"> 0.07 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Fa </td>
   <td style="text-align:left;"> Fair </td>
   <td style="text-align:right;"> 35 </td>
   <td style="text-align:right;"> 39 </td>
   <td style="text-align:right;"> 2.40 </td>
   <td style="text-align:right;"> 2.67 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Gd </td>
   <td style="text-align:left;"> Good </td>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:right;"> 0.62 </td>
   <td style="text-align:right;"> 0.41 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Po </td>
   <td style="text-align:left;"> Poor </td>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:right;"> 0.48 </td>
   <td style="text-align:right;"> 0.48 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TA </td>
   <td style="text-align:left;"> Average/Typical </td>
   <td style="text-align:right;"> 1326 </td>
   <td style="text-align:right;"> 1328 </td>
   <td style="text-align:right;"> 90.82 </td>
   <td style="text-align:right;"> 91.02 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Total </td>
   <td style="text-align:left;"> Total </td>
   <td style="text-align:right;"> 1460 </td>
   <td style="text-align:right;"> 1459 </td>
   <td style="text-align:right;"> 100.01 </td>
   <td style="text-align:right;"> 100.00 </td>
  </tr>
</tbody>
</table><h4>Graphiques</h3>![](01_exploration_generale_files/figure-html/test-127.png)<!-- -->![](01_exploration_generale_files/figure-html/test-128.png)<!-- --><br/><br/><h3 class='title'>PavedDrive (Ordinal)</h3><h5 class='title'>Paved driveway</h5><h5 class='title'><em>[FR] Allée pavée</em></h5><h4>Tableau</h3><table class='table'>
 <thead>
  <tr>
   <th style="text-align:left;"> PavedDrive </th>
   <th style="text-align:left;"> Libelle </th>
   <th style="text-align:right;"> Eff. train </th>
   <th style="text-align:right;"> Eff. test </th>
   <th style="text-align:right;"> % train </th>
   <th style="text-align:right;"> % test </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> N </td>
   <td style="text-align:left;"> Dirt/Gravel </td>
   <td style="text-align:right;"> 90 </td>
   <td style="text-align:right;"> 126 </td>
   <td style="text-align:right;"> 6.16 </td>
   <td style="text-align:right;"> 8.64 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> P </td>
   <td style="text-align:left;"> Partial Pavement </td>
   <td style="text-align:right;"> 30 </td>
   <td style="text-align:right;"> 32 </td>
   <td style="text-align:right;"> 2.05 </td>
   <td style="text-align:right;"> 2.19 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Y </td>
   <td style="text-align:left;"> Paved </td>
   <td style="text-align:right;"> 1340 </td>
   <td style="text-align:right;"> 1301 </td>
   <td style="text-align:right;"> 91.78 </td>
   <td style="text-align:right;"> 89.17 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Total </td>
   <td style="text-align:left;"> Total </td>
   <td style="text-align:right;"> 1460 </td>
   <td style="text-align:right;"> 1459 </td>
   <td style="text-align:right;"> 99.99 </td>
   <td style="text-align:right;"> 100.00 </td>
  </tr>
</tbody>
</table><h4>Graphiques</h3>![](01_exploration_generale_files/figure-html/test-129.png)<!-- -->![](01_exploration_generale_files/figure-html/test-130.png)<!-- --><br/><br/><h3 class='title'>WoodDeckSF (Continuous)</h3><h5 class='title'>Wood deck area in square feet</h5><h5 class='title'><em>[FR] Surface terasse en bois en pied carre</em></h5><h4>Tableau</h3><table class='table'>
 <thead>
  <tr>
   <th style="text-align:left;"> set </th>
   <th style="text-align:right;"> Min. </th>
   <th style="text-align:right;"> 1st Qu. </th>
   <th style="text-align:right;"> Median </th>
   <th style="text-align:right;"> 3rd Qu. </th>
   <th style="text-align:right;"> Max. </th>
   <th style="text-align:right;"> NA's </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> train </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 168 </td>
   <td style="text-align:right;"> 857 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> test </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 168 </td>
   <td style="text-align:right;"> 1424 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
</tbody>
</table><h4>Graphiques</h3>![](01_exploration_generale_files/figure-html/test-131.png)<!-- -->

```
## `geom_smooth()` using method = 'gam'
```

![](01_exploration_generale_files/figure-html/test-132.png)<!-- --><br/><br/><h3 class='title'>OpenPorchSF (Continuous)</h3><h5 class='title'>Open porch area in square feet</h5><h5 class='title'><em>[FR] Surface du perron (ouvert) en pied carre</em></h5><h4>Tableau</h3><table class='table'>
 <thead>
  <tr>
   <th style="text-align:left;"> set </th>
   <th style="text-align:right;"> Min. </th>
   <th style="text-align:right;"> 1st Qu. </th>
   <th style="text-align:right;"> Median </th>
   <th style="text-align:right;"> 3rd Qu. </th>
   <th style="text-align:right;"> Max. </th>
   <th style="text-align:right;"> NA's </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> train </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 25 </td>
   <td style="text-align:right;"> 68 </td>
   <td style="text-align:right;"> 547 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> test </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 28 </td>
   <td style="text-align:right;"> 72 </td>
   <td style="text-align:right;"> 742 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
</tbody>
</table><h4>Graphiques</h3>![](01_exploration_generale_files/figure-html/test-133.png)<!-- -->

```
## `geom_smooth()` using method = 'gam'
```

![](01_exploration_generale_files/figure-html/test-134.png)<!-- --><br/><br/><h3 class='title'>EnclosedPorch (Continuous)</h3><h5 class='title'>Enclosed porch area in square feet</h5><h5 class='title'><em>[FR] Surface du perron (fermé, veranda?) en pied carre</em></h5><h4>Tableau</h3><table class='table'>
 <thead>
  <tr>
   <th style="text-align:left;"> set </th>
   <th style="text-align:right;"> Min. </th>
   <th style="text-align:right;"> 1st Qu. </th>
   <th style="text-align:right;"> Median </th>
   <th style="text-align:right;"> 3rd Qu. </th>
   <th style="text-align:right;"> Max. </th>
   <th style="text-align:right;"> NA's </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> train </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 552 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> test </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 1012 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
</tbody>
</table><h4>Graphiques</h3>![](01_exploration_generale_files/figure-html/test-135.png)<!-- -->

```
## `geom_smooth()` using method = 'gam'
```

![](01_exploration_generale_files/figure-html/test-136.png)<!-- --><br/><br/><h3 class='title'>3SsnPorch (Continuous)</h3><h5 class='title'>Three season porch area in square feet</h5><h5 class='title'><em>[FR] Surface veranda en pied carre</em></h5><h4>Tableau</h3><table class='table'>
 <thead>
  <tr>
   <th style="text-align:left;"> set </th>
   <th style="text-align:right;"> Min. </th>
   <th style="text-align:right;"> 1st Qu. </th>
   <th style="text-align:right;"> Median </th>
   <th style="text-align:right;"> 3rd Qu. </th>
   <th style="text-align:right;"> Max. </th>
   <th style="text-align:right;"> NA's </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> train </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 508 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> test </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 360 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
</tbody>
</table><h4>Graphiques</h3>![](01_exploration_generale_files/figure-html/test-137.png)<!-- -->

```
## `geom_smooth()` using method = 'gam'
```

![](01_exploration_generale_files/figure-html/test-138.png)<!-- --><br/><br/><h3 class='title'>ScreenPorch (Continuous)</h3><h5 class='title'>Screen porch area in square feet</h5><h5 class='title'><em>[FR] Surface veranda (avec moustiquaire) en pied carre</em></h5><h4>Tableau</h3><table class='table'>
 <thead>
  <tr>
   <th style="text-align:left;"> set </th>
   <th style="text-align:right;"> Min. </th>
   <th style="text-align:right;"> 1st Qu. </th>
   <th style="text-align:right;"> Median </th>
   <th style="text-align:right;"> 3rd Qu. </th>
   <th style="text-align:right;"> Max. </th>
   <th style="text-align:right;"> NA's </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> train </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 480 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> test </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 576 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
</tbody>
</table><h4>Graphiques</h3>![](01_exploration_generale_files/figure-html/test-139.png)<!-- -->

```
## `geom_smooth()` using method = 'gam'
```

![](01_exploration_generale_files/figure-html/test-140.png)<!-- --><br/><br/><h3 class='title'>PoolArea (Continuous)</h3><h5 class='title'>Pool area in square feet</h5><h5 class='title'><em>[FR] Surface de la piscine en pied carre</em></h5><h4>Tableau</h3><table class='table'>
 <thead>
  <tr>
   <th style="text-align:left;"> set </th>
   <th style="text-align:right;"> Min. </th>
   <th style="text-align:right;"> 1st Qu. </th>
   <th style="text-align:right;"> Median </th>
   <th style="text-align:right;"> 3rd Qu. </th>
   <th style="text-align:right;"> Max. </th>
   <th style="text-align:right;"> NA's </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> train </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 738 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> test </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 800 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
</tbody>
</table><h4>Graphiques</h3>![](01_exploration_generale_files/figure-html/test-141.png)<!-- -->

```
## `geom_smooth()` using method = 'gam'
```

![](01_exploration_generale_files/figure-html/test-142.png)<!-- --><br/><br/><h3 class='title'>PoolQC (Ordinal)</h3><h5 class='title'>Pool quality</h5><h5 class='title'><em>[FR] Qualité de la piscine</em></h5><h4>Tableau</h3><table class='table'>
 <thead>
  <tr>
   <th style="text-align:left;"> PoolQC </th>
   <th style="text-align:left;"> Libelle </th>
   <th style="text-align:right;"> Eff. train </th>
   <th style="text-align:right;"> Eff. test </th>
   <th style="text-align:right;"> % train </th>
   <th style="text-align:right;"> % test </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> No Pool </td>
   <td style="text-align:right;"> 1453 </td>
   <td style="text-align:right;"> 1456 </td>
   <td style="text-align:right;"> 99.52 </td>
   <td style="text-align:right;"> 99.79 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Ex </td>
   <td style="text-align:left;"> Excellent </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 0.14 </td>
   <td style="text-align:right;"> 0.14 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Fa </td>
   <td style="text-align:left;"> Fair </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0.14 </td>
   <td style="text-align:right;"> 0.00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Gd </td>
   <td style="text-align:left;"> Good </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0.21 </td>
   <td style="text-align:right;"> 0.07 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Total </td>
   <td style="text-align:left;"> Total </td>
   <td style="text-align:right;"> 1460 </td>
   <td style="text-align:right;"> 1459 </td>
   <td style="text-align:right;"> 100.01 </td>
   <td style="text-align:right;"> 100.00 </td>
  </tr>
</tbody>
</table><h4>Graphiques</h3>![](01_exploration_generale_files/figure-html/test-143.png)<!-- -->![](01_exploration_generale_files/figure-html/test-144.png)<!-- --><br/><br/><h3 class='title'>Fence (Ordinal)</h3><h5 class='title'>Fence quality</h5><h5 class='title'><em>[FR] Qualité clôture</em></h5><h4>Tableau</h3><table class='table'>
 <thead>
  <tr>
   <th style="text-align:left;"> Fence </th>
   <th style="text-align:left;"> Libelle </th>
   <th style="text-align:right;"> Eff. train </th>
   <th style="text-align:right;"> Eff. test </th>
   <th style="text-align:right;"> % train </th>
   <th style="text-align:right;"> % test </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> No Fence </td>
   <td style="text-align:right;"> 1179 </td>
   <td style="text-align:right;"> 1169 </td>
   <td style="text-align:right;"> 80.75 </td>
   <td style="text-align:right;"> 80.12 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GdPrv </td>
   <td style="text-align:left;"> Good Privacy </td>
   <td style="text-align:right;"> 59 </td>
   <td style="text-align:right;"> 59 </td>
   <td style="text-align:right;"> 4.04 </td>
   <td style="text-align:right;"> 4.04 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GdWo </td>
   <td style="text-align:left;"> Good Wood </td>
   <td style="text-align:right;"> 54 </td>
   <td style="text-align:right;"> 58 </td>
   <td style="text-align:right;"> 3.70 </td>
   <td style="text-align:right;"> 3.98 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MnPrv </td>
   <td style="text-align:left;"> Minimum Privacy </td>
   <td style="text-align:right;"> 157 </td>
   <td style="text-align:right;"> 172 </td>
   <td style="text-align:right;"> 10.75 </td>
   <td style="text-align:right;"> 11.79 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MnWw </td>
   <td style="text-align:left;"> Minimum Wood/Wire </td>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0.75 </td>
   <td style="text-align:right;"> 0.07 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Total </td>
   <td style="text-align:left;"> Total </td>
   <td style="text-align:right;"> 1460 </td>
   <td style="text-align:right;"> 1459 </td>
   <td style="text-align:right;"> 99.99 </td>
   <td style="text-align:right;"> 100.00 </td>
  </tr>
</tbody>
</table><h4>Graphiques</h3>![](01_exploration_generale_files/figure-html/test-145.png)<!-- -->![](01_exploration_generale_files/figure-html/test-146.png)<!-- --><br/><br/><h3 class='title'>MiscFeature (Nominal)</h3><h5 class='title'>Miscellaneous feature not covered in other categories</h5><h5 class='title'><em>[FR] Autres propriétés non mentionné par les autres variables</em></h5><h4>Tableau</h3><table class='table'>
 <thead>
  <tr>
   <th style="text-align:left;"> MiscFeature </th>
   <th style="text-align:left;"> Libelle </th>
   <th style="text-align:right;"> Eff. train </th>
   <th style="text-align:right;"> Eff. test </th>
   <th style="text-align:right;"> % train </th>
   <th style="text-align:right;"> % test </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> None </td>
   <td style="text-align:right;"> 1406 </td>
   <td style="text-align:right;"> 1408 </td>
   <td style="text-align:right;"> 96.30 </td>
   <td style="text-align:right;"> 96.50 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Gar2 </td>
   <td style="text-align:left;"> 2nd Garage (if not described in garage section) </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 0.14 </td>
   <td style="text-align:right;"> 0.21 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Othr </td>
   <td style="text-align:left;"> Other </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 0.14 </td>
   <td style="text-align:right;"> 0.14 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Shed </td>
   <td style="text-align:left;"> Shed (over 100 SF) </td>
   <td style="text-align:right;"> 49 </td>
   <td style="text-align:right;"> 46 </td>
   <td style="text-align:right;"> 3.36 </td>
   <td style="text-align:right;"> 3.15 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TenC </td>
   <td style="text-align:left;"> Tennis Court </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0.07 </td>
   <td style="text-align:right;"> 0.00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Total </td>
   <td style="text-align:left;"> Total </td>
   <td style="text-align:right;"> 1460 </td>
   <td style="text-align:right;"> 1459 </td>
   <td style="text-align:right;"> 100.01 </td>
   <td style="text-align:right;"> 100.00 </td>
  </tr>
</tbody>
</table><h4>Graphiques</h3>![](01_exploration_generale_files/figure-html/test-147.png)<!-- -->![](01_exploration_generale_files/figure-html/test-148.png)<!-- --><br/><br/><h3 class='title'>MiscVal (Continuous)</h3><h5 class='title'>$Value of miscellaneous feature</h5><h5 class='title'><em>[FR] Valeur monétaire des propriétés non mentionnées</em></h5><h4>Tableau</h3><table class='table'>
 <thead>
  <tr>
   <th style="text-align:left;"> set </th>
   <th style="text-align:right;"> Min. </th>
   <th style="text-align:right;"> 1st Qu. </th>
   <th style="text-align:right;"> Median </th>
   <th style="text-align:right;"> 3rd Qu. </th>
   <th style="text-align:right;"> Max. </th>
   <th style="text-align:right;"> NA's </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> train </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 15500 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> test </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 17000 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
</tbody>
</table><h4>Graphiques</h3>![](01_exploration_generale_files/figure-html/test-149.png)<!-- -->

```
## `geom_smooth()` using method = 'gam'
```

![](01_exploration_generale_files/figure-html/test-150.png)<!-- --><br/><br/><h3 class='title'>MoSold (Discrete)</h3><h5 class='title'>Month Sold (MM)</h5><h5 class='title'><em>[FR] Mois de vente</em></h5><h4>Tableau</h3><table class='table'>
 <thead>
  <tr>
   <th style="text-align:left;"> set </th>
   <th style="text-align:right;"> Min. </th>
   <th style="text-align:right;"> 1st Qu. </th>
   <th style="text-align:right;"> Median </th>
   <th style="text-align:right;"> 3rd Qu. </th>
   <th style="text-align:right;"> Max. </th>
   <th style="text-align:right;"> NA's </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> train </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:right;"> 12 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> test </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:right;"> 12 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
</tbody>
</table><h4>Graphiques</h3>![](01_exploration_generale_files/figure-html/test-151.png)<!-- -->

```
## `geom_smooth()` using method = 'gam'
```

![](01_exploration_generale_files/figure-html/test-152.png)<!-- --><br/><br/><h3 class='title'>YrSold (Discrete)</h3><h5 class='title'>Year Sold (YYYY)</h5><h5 class='title'><em>[FR] Année de vente</em></h5><h4>Tableau</h3><table class='table'>
 <thead>
  <tr>
   <th style="text-align:left;"> set </th>
   <th style="text-align:right;"> Min. </th>
   <th style="text-align:right;"> 1st Qu. </th>
   <th style="text-align:right;"> Median </th>
   <th style="text-align:right;"> 3rd Qu. </th>
   <th style="text-align:right;"> Max. </th>
   <th style="text-align:right;"> NA's </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> train </td>
   <td style="text-align:right;"> 2006 </td>
   <td style="text-align:right;"> 2007 </td>
   <td style="text-align:right;"> 2008 </td>
   <td style="text-align:right;"> 2009 </td>
   <td style="text-align:right;"> 2010 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> test </td>
   <td style="text-align:right;"> 2006 </td>
   <td style="text-align:right;"> 2007 </td>
   <td style="text-align:right;"> 2008 </td>
   <td style="text-align:right;"> 2009 </td>
   <td style="text-align:right;"> 2010 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
</tbody>
</table><h4>Graphiques</h3>![](01_exploration_generale_files/figure-html/test-153.png)<!-- -->

```
## `geom_smooth()` using method = 'gam'
```

![](01_exploration_generale_files/figure-html/test-154.png)<!-- --><br/><br/><h3 class='title'>SaleType (Nominal)</h3><h5 class='title'>Type of sale</h5><h5 class='title'><em>[FR] Type de vente</em></h5><h4>Tableau</h3><table class='table'>
 <thead>
  <tr>
   <th style="text-align:left;"> SaleType </th>
   <th style="text-align:left;"> Libelle </th>
   <th style="text-align:right;"> Eff. train </th>
   <th style="text-align:right;"> Eff. test </th>
   <th style="text-align:right;"> % train </th>
   <th style="text-align:right;"> % test </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0.00 </td>
   <td style="text-align:right;"> 0.07 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> COD </td>
   <td style="text-align:left;"> Court Officer Deed/Estate </td>
   <td style="text-align:right;"> 43 </td>
   <td style="text-align:right;"> 44 </td>
   <td style="text-align:right;"> 2.95 </td>
   <td style="text-align:right;"> 3.02 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CWD </td>
   <td style="text-align:left;"> Warranty Deed - Cash </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:right;"> 0.27 </td>
   <td style="text-align:right;"> 0.55 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Con </td>
   <td style="text-align:left;"> Contract 15% Down payment regular terms </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 0.14 </td>
   <td style="text-align:right;"> 0.21 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ConLD </td>
   <td style="text-align:left;"> Contract Low Down </td>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:right;"> 17 </td>
   <td style="text-align:right;"> 0.62 </td>
   <td style="text-align:right;"> 1.17 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ConLI </td>
   <td style="text-align:left;"> Contract Low Interest </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> 0.34 </td>
   <td style="text-align:right;"> 0.27 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ConLw </td>
   <td style="text-align:left;"> Contract Low Down payment and low interest </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 0.34 </td>
   <td style="text-align:right;"> 0.21 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> New </td>
   <td style="text-align:left;"> Home just constructed and sold </td>
   <td style="text-align:right;"> 122 </td>
   <td style="text-align:right;"> 117 </td>
   <td style="text-align:right;"> 8.36 </td>
   <td style="text-align:right;"> 8.02 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Oth </td>
   <td style="text-align:left;"> Other </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> 0.21 </td>
   <td style="text-align:right;"> 0.27 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> WD </td>
   <td style="text-align:left;"> Warranty Deed - Conventional </td>
   <td style="text-align:right;"> 1267 </td>
   <td style="text-align:right;"> 1258 </td>
   <td style="text-align:right;"> 86.78 </td>
   <td style="text-align:right;"> 86.22 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Total </td>
   <td style="text-align:left;"> Total </td>
   <td style="text-align:right;"> 1460 </td>
   <td style="text-align:right;"> 1459 </td>
   <td style="text-align:right;"> 100.01 </td>
   <td style="text-align:right;"> 100.01 </td>
  </tr>
</tbody>
</table><h4>Graphiques</h3>![](01_exploration_generale_files/figure-html/test-155.png)<!-- -->![](01_exploration_generale_files/figure-html/test-156.png)<!-- --><br/><br/><h3 class='title'>SaleCondition (Nominal)</h3><h5 class='title'>Condition of sale</h5><h5 class='title'><em>[FR] Condition de vente</em></h5><h4>Tableau</h3><table class='table'>
 <thead>
  <tr>
   <th style="text-align:left;"> SaleCondition </th>
   <th style="text-align:left;"> Libelle </th>
   <th style="text-align:right;"> Eff. train </th>
   <th style="text-align:right;"> Eff. test </th>
   <th style="text-align:right;"> % train </th>
   <th style="text-align:right;"> % test </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Abnorml </td>
   <td style="text-align:left;"> Abnormal Sale -  trade </td>
   <td style="text-align:right;"> 101 </td>
   <td style="text-align:right;"> 89 </td>
   <td style="text-align:right;"> 6.92 </td>
   <td style="text-align:right;"> 6.10 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AdjLand </td>
   <td style="text-align:left;"> Adjoining Land Purchase </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:right;"> 0.27 </td>
   <td style="text-align:right;"> 0.55 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Alloca </td>
   <td style="text-align:left;"> Allocation - two linked properties with separate deeds </td>
   <td style="text-align:right;"> 12 </td>
   <td style="text-align:right;"> 12 </td>
   <td style="text-align:right;"> 0.82 </td>
   <td style="text-align:right;"> 0.82 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Family </td>
   <td style="text-align:left;"> Sale between family members </td>
   <td style="text-align:right;"> 20 </td>
   <td style="text-align:right;"> 26 </td>
   <td style="text-align:right;"> 1.37 </td>
   <td style="text-align:right;"> 1.78 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Normal </td>
   <td style="text-align:left;"> Normal Sale </td>
   <td style="text-align:right;"> 1198 </td>
   <td style="text-align:right;"> 1204 </td>
   <td style="text-align:right;"> 82.05 </td>
   <td style="text-align:right;"> 82.52 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Partial </td>
   <td style="text-align:left;"> Home was not completed when last assessed (associated with New Homes) </td>
   <td style="text-align:right;"> 125 </td>
   <td style="text-align:right;"> 120 </td>
   <td style="text-align:right;"> 8.56 </td>
   <td style="text-align:right;"> 8.22 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Total </td>
   <td style="text-align:left;"> Total </td>
   <td style="text-align:right;"> 1460 </td>
   <td style="text-align:right;"> 1459 </td>
   <td style="text-align:right;"> 99.99 </td>
   <td style="text-align:right;"> 99.99 </td>
  </tr>
</tbody>
</table><h4>Graphiques</h3>![](01_exploration_generale_files/figure-html/test-157.png)<!-- -->![](01_exploration_generale_files/figure-html/test-158.png)<!-- --><br/><br/><h3 class='title'>SalePrice (Continuous)</h3><h5 class='title'>Sale price</h5><h5 class='title'><em>[FR] Prix de vente</em></h5><h4>Tableau</h3><table class='table'>
 <thead>
  <tr>
   <th style="text-align:left;"> set </th>
   <th style="text-align:right;"> Min. </th>
   <th style="text-align:right;"> 1st Qu. </th>
   <th style="text-align:right;"> Median </th>
   <th style="text-align:right;"> 3rd Qu. </th>
   <th style="text-align:right;"> Max. </th>
   <th style="text-align:right;"> NA's </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> train </td>
   <td style="text-align:right;"> 34900 </td>
   <td style="text-align:right;"> 129975 </td>
   <td style="text-align:right;"> 163000 </td>
   <td style="text-align:right;"> 214000 </td>
   <td style="text-align:right;"> 755000 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> test </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> -Inf </td>
   <td style="text-align:right;"> 1459 </td>
  </tr>
</tbody>
</table><h4>Graphiques</h3>![](01_exploration_generale_files/figure-html/test-159.png)<!-- -->

```
## `geom_smooth()` using method = 'gam'
```

![](01_exploration_generale_files/figure-html/test-160.png)<!-- --><br/><br/>

