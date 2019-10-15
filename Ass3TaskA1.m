
%Assignment 3 Task A.1
% p(blue|red U blond) = p(blue|red) U p(blue|blond)= p(blue|red)+ p(blue|blond)
clc;
clear;
t = readtable('ColorTable.xlsx');

vars = {'probabilityTable','blackHair','brunetteHair','redHair','blondHair','marginalEyeColor'};

t = t(1:5,vars);
%Create a table UI component, and specify t as the data.

fig = uifigure;
uit = uitable(fig,'Data',t);

BrownEyes=1; BlueEyes=2; HazelEyes=3; GreenEyes=4; MarginalHairColor=5;
BlackHair=2; BrunetteHair=3;RedHair=4; BlondHair=5; MarginalEyeColor=6;

s1 = uistyle;
s1.FontColor = 'red';
s1.FontWeight = 'bold';
addStyle(uit,s1,'cell',[BlueEyes,RedHair]);
addStyle(uit,s1,'cell',[BlueEyes,BlondHair]);


s2 = uistyle;
s2.FontColor = 'cyan';
s2.FontWeight = 'bold';
addStyle(uit,s2,'cell',[MarginalHairColor,RedHair]);
addStyle(uit,s2,'cell',[MarginalHairColor,BlondHair]);