## Kaggle challenge

### House Prices : Advanced Regression Techniques

_Playground challenge, turned to getting started challenge_

**Final position : top 2% in private LB.**


#### Exploration

* `To_share/00_format_donnees.R` : create data.table structure with correct variables classes.

* `To_share/01_exploration_generale.rmd` : rmarkdown to visualise each variable. French version [here](http://prise6.deblan.org/KaggleHousePrices/01_exploration_generale.html).


#### Modelisation

* `To_share/02_creation_base_modelisation.R` : modelisation dataset creation (features).

* `To_share/03_modelisation.R` : lasso + gbm stacking with rf method.


#### Bonus

Because datas are public, after challenge ended, i built the test set : `R_in/test_set_complete.csv`