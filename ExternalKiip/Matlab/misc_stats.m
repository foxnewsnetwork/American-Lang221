%% Data-collection
% Here are the data pulled off of lolbase.com, sc2ranks.com, and
% steampowered.com

Date_vec = [ 0 ];
%% Starcraft 2 User Stats
% Here I input the data for starcraft 2 user stats
% base date at November 4, 2011

Global_players = 944+56177+138164+198060+211112+243312+273429;
SC2_games = 17523; %worldwide
SC2_US = 8152 %US players

%% Steam-Game stats
% Here I track game stats over a period of time
TF2_players = [ 53347 ];
CODBO_players = [15859];
L4D2 = [12524]

%% Data-importing
% Here I import data from the csv files
justin = importdata('uv_justin.tv_09_2010_09_2011.csv',',');
livestream = importdata('uv_livestream.com_09_2010_09_2011.csv',',');
own3d = importdata('uv_own3d.tv_09_2010_09_2011.csv',',');
twitch = importdata('uv_twitch.tv_09_2010_09_2011.csv',',');
ustream = importdata('uv_ustream.tv_09_2010_09_2011.csv',',');

justin_data = justin(5:end);
livestream_data = livestream(5:end);
own3d_data = own3d(5:end);
twitch_data = twitch(5:end);
ustream_data = ustream(5:end);