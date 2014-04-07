function [ taup ] = tauslowpot( taumax, V )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
taup=(taumax)/(3.3*(exp((V+35)/40)+exp(-(V+35)/20)));
end

 