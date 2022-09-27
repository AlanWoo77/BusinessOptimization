set STAFF;

param T;
param working_time{STAFF};
param max_trainee;
param required_hours{t in 1..T};
param wage{STAFF};
param resign{t in 1..T};
param initial_crew_of_attendent;

var Crew{s in STAFF,t in 1..T}>=0 integer;

minimize Budget: sum{s in STAFF,t in 1..T} Crew[s,t]*wage[s];

s.t. Required_Hours{t in 1..T}: sum{s in STAFF} Crew[s,t]*working_time[s]>=required_hours[t];
s.t. Max_Trainee{t in 1..T}: Crew["trainee",t]<=max_trainee;
s.t. Initial_Crew: Crew["attendant",1]=initial_crew_of_attendent;
s.t. Train_and_Quit_Feb: Crew["attendant",2]=Crew["attendant",1]-resign[1];
s.t. Train_and_Quit{t in 3..T}: 
		Crew["attendant",t]=Crew["trainee",t-2]+Crew["attendant",t-1]-resign[t-1];
		
option solver gurobi;
		