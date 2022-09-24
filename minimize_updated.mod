reset;

set FOOD;
set NUTR;
# define parameters
param price{FOOD};
param portion{NUTR,FOOD};
param require{NUTR};

# define variable
var Buy{FOOD} >=0;

# objective function
minimize BUDGET: sum{i in FOOD} Buy[i]*price[i];

# strings
s.t. Require{i in NUTR}: sum{j in FOOD} Buy[j]*portion[i,j]  >=require[i];
