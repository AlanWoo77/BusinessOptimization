reset;

set FOOD;
set NUTR;
# define parameters
param price{FOOD}>=0;
param portion{NUTR,FOOD}>=0;
param require{NUTR}>=0;

# define variable
var Buy{FOOD} >=0 integer;

# objective function
minimize BUDGET: sum{i in FOOD} Buy[i]*price[i];

# strings
s.t. Require{i in NUTR}: sum{j in FOOD} Buy[j]*portion[i,j]  >=require[i];

option solver gurobi;