reset;
set operator;
set day;

param wage{operator};
param max_day{operator,day};
param day_time;
param min_hour_week{operator};

var Arrange{operator,day}>=0;

minimize Total_Wage: sum{o in operator,d in day} Arrange[o,d]*wage[o];

s.t. Min_hour_week{o in operator}: sum{d in day} Arrange[o,d]>=min_hour_week[o];
s.t. Max_day{o in operator,d in day}: Arrange[o,d]  <=max_day[o,d];
s.t. Day_time{d in day}: sum{o in operator} Arrange[o,d] >=day_time;


