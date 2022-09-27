reset;
set PROD;
set MACHINE;

param T;
param contribution{PROD};
param time{MACHINE,PROD};
param available_machine{MACHINE,i in 1..T};
param market_limit{i in 1..T,PROD};
param max_store;
param cost_store;
param desire_store;
param working_days;
param working_hour;

var Production{PROD,i in 1..T}>=0 integer;
var Sale{PROD,i in 1..T}>=0 integer;
var Inventory{PROD,i in 1..T}>=0 integer;

maximize Total_Revenue: 
	sum{i in PROD,j in 1..T} contribution[i]*Sale[i,j] - sum{i in PROD,j in 1..T} Inventory[i,j]*cost_store;
	
s.t. Market_Limit{j in 1..T,i in PROD}:
	Sale[i,j]<=market_limit[j,i];
s.t. Store_Limit{i in PROD,j in 1..T}:
	Inventory[i,j]<=max_store;
s.t. Time_Limit{t in 1..T,i in MACHINE}: 
	sum{j in PROD} Production[j,t]*time[i,j] <= available_machine[i,t]*working_days*working_hour;
s.t. First_Month{i in PROD}:
	Production[i,1]-Sale[i,1]=Inventory[i,1];
s.t. Other_Month{i in PROD,j in 2..T}:
	Production[i,j]-Sale[i,j]+Inventory[i,j-1]=Inventory[i,j];
s.t. Final_Month{i in PROD}:
	Inventory[i,6]=desire_store;
	
option solver gurobi;
