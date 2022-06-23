
function [chose_day_ind]=chose_days(chose_month, feb_day)
% chose_month = 6; % in summer June-October, covid symptons should be more obvious since no flu
if chose_month == 1
    %chose_day_2019 = 1:31;
    chose_day_2020 = 1:31;
elseif chose_month == 2
    %chose_day_2019 = 31+1 : 31+28;
    chose_day_2020 = 31+1 : 31+feb_day;
elseif chose_month == 3
    %chose_day_2019 = 31+28+1 : 31+28+31;
    chose_day_2020 = 31+feb_day+1 : 31+feb_day+31;
elseif chose_month == 4
   % chose_day_2019 = 31+28+31+1 : 31+28+31+30;
    chose_day_2020 = 31+feb_day+31+1 : 31+feb_day+31+30;
elseif chose_month == 5
    %chose_day_2019 = 31+28+31+30+1 : 31+28+31+30+31;
    chose_day_2020 = 31+feb_day+31+30+1 : 31+feb_day+31+30+31;
elseif chose_month == 6
   % chose_day_2019 = 31+28+31+30+31+1 : 31+28+31+30+31+30;
    chose_day_2020 = 31+feb_day+31+30+31+1 : 31+feb_day+31+30+31+30;
elseif chose_month == 7
    %chose_day_2019 = 31+28+31+30+31+30+1 : 31+28+31+30+31+30+31;
    chose_day_2020 = 31+feb_day+31+30+31+30+1 : 31+feb_day+31+30+31+30+31;
elseif chose_month == 8
    %chose_day_2019 = 31+28+31+30+31+30+31+1 : 31+28+31+30+31+30+31+31;
    chose_day_2020 = 31+feb_day+31+30+31+30+31+1 : 31+feb_day+31+30+31+30+31+31;
elseif chose_month == 9
    %chose_day_2019 = 31+28+31+30+31+30+31+31+1 : 31+28+31+30+31+30+31+31+30;
    chose_day_2020 = 31+feb_day+31+30+31+30+31+31+1 : 31+feb_day+31+30+31+30+31+31+30;
elseif chose_month == 10
    %chose_day_2019 = 31+28+31+30+31+30+31+31+30+1 : 31+28+31+30+31+30+31+31+30+31;
    chose_day_2020 = 31+feb_day+31+30+31+30+31+31+30+1 : 31+feb_day+31+30+31+30+31+31+30+31;
elseif chose_month == 11
    %chose_day_2019 = 31+28+31+30+31+30+31+31+30+31+1 : 31+28+31+30+31+30+31+31+30+31+30;
    chose_day_2020 = 31+feb_day+31+30+31+30+31+31+30+31+1 : 31+feb_day+31+30+31+30+31+31+30+31+30;
elseif chose_month == 12
    %chose_day_2019 = 31+28+31+30+31+30+31+31+30+31+30+1 : 31+28+31+30+31+30+31+31+30+31+30+31;
    chose_day_2020 = 31+feb_day+31+30+31+30+31+31+30+31+30+1 : 31+feb_day+31+30+31+30+31+31+30+31+30+31;
end

chose_day_ind=chose_day_2020;

end