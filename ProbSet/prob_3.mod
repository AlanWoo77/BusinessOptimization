reset;
set INVESTMENT;

param yield{INVESTMENT};
param initial;
param risk_control_rate;

var Distribution{INVESTMENT}>=0;

maximize Yields: sum{i in INVESTMENT} yield[i]*Distribution[i];

s.t. Total: sum{i in INVESTMENT} Distribution[i] <= initial;
s.t. person:	Distribution['PERSONAL_LOANS']<=initial*risk_control_rate;
s.t. cp1:	Distribution['PERSONAL_LOANS']<=Distribution['HOME_MORTGAGES'];
s.t. cp2:	Distribution['PERSONAL_LOANS']<=Distribution['BONDS'];