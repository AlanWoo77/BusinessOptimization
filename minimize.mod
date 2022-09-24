reset;

# define parameters
param price{1..6};
param calories{1..6};
param protein{1..6};
param calcium{1..6};
param vitamin{1..6};

# define variable
var Buy{1..6} >=0;

# objective function
minimize BUDGET: sum{i in 1..6} Buy[i]*price[i];

# strings
s.t. Calories: sum{i in 1..6} Buy[i]*calories[i]>=3000;
s.t. Protein: sum{i in 1..6} Buy[i]*protein[i]>=70;
s.t. Calcium: sum{i in 1..6} Buy[i]*calcium[i]>=800;
s.t. Vitamin: sum{i in 1..6} Buy[i]*vitamin[i]>=500;