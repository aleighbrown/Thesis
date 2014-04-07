function [ p ] = slowpot( V )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
p= 1/(1+(exp(-(V+35)/10)));

end

