INSERT INTO `baseball`.`team` (`name`) VALUES ('Captain');
INSERT INTO `baseball`.`team` (`name`) VALUES ('Marvel');
INSERT INTO `baseball`.`team` (`name`) VALUES ('Twins');
INSERT INTO `baseball`.`team` (`name`) VALUES ('Tigers');
INSERT INTO `baseball`.`team` (`name`) VALUES ('Rockets');
INSERT INTO `baseball`.`team` (`name`) VALUES ('Dodgers');
INSERT INTO `baseball`.`team` (`name`) VALUES ('Heros');
INSERT INTO `baseball`.`team` (`name`) VALUES ('Pintos');



INSERT INTO `baseball`.`score` (`id`, `home_team`, `away_team`, `home_score`, `away_score`) VALUES (1, 'Marvel', 'Captain', 0, 0);
INSERT INTO `baseball`.`score` (`id`, `home_team`, `away_team`, `home_score`, `away_score`) VALUES (2, 'Tigers', 'Twins', 0, 0);
INSERT INTO `baseball`.`score` (`id`, `home_team`, `away_team`, `home_score`, `away_score`) VALUES (3, 'Dodgers', 'Rockets', 0, 0);
INSERT INTO `baseball`.`score` (`id`, `home_team`, `away_team`, `home_score`, `away_score`) VALUES (4, 'Pintos', 'Heros', 0, 0);


INSERT INTO game(id, home_team, away_team, home_score, away_score, inning, inning_status, score_id) values(1, 'Marvel', 'Captain', 0, 0, 1, 'TOP', 1);
INSERT INTO game(id, home_team, away_team, home_score, away_score, inning, inning_status, score_id) values(2, 'Marvel', 'Captain', 2, 0, 1, 'BOTTOM', 1);
INSERT INTO game(id, home_team, away_team, home_score, away_score, inning, inning_status, score_id) values(3, 'Marvel', 'Captain', 0, 1, 2, 'TOP', 1);
INSERT INTO game(id, home_team, away_team, home_score, away_score, inning, inning_status, score_id) values(4, 'Marvel', 'Captain', 3, 0, 2, 'BOTTOM', 1);
INSERT INTO game(id, home_team, away_team, home_score, away_score, inning, inning_status, score_id) values(5, 'Marvel', 'Captain', 0, 1, 3, 'TOP', 1);
INSERT INTO game(id, home_team, away_team, home_score, away_score, inning, inning_status, score_id) values(6, 'Marvel', 'Captain', 3, 0, 3, 'BOTTOM', 1);
INSERT INTO game(id, home_team, away_team, home_score, away_score, inning, inning_status, score_id) values(7, 'Marvel', 'Captain', 0, 1, 4, 'TOP', 1);
INSERT INTO game(id, home_team, away_team, home_score, away_score, inning, inning_status, score_id) values(8, 'Marvel', 'Captain', 3, 0, 4, 'BOTTOM', 1);
INSERT INTO game(id, home_team, away_team, home_score, away_score, inning, inning_status, score_id) values(9, 'Marvel', 'Captain', 0, 1, 5, 'TOP', 1);
INSERT INTO game(id, home_team, away_team, home_score, away_score, inning, inning_status, score_id) values(10, 'Marvel', 'Captain', 3, 0, 5, 'BOTTOM', 1);
INSERT INTO game(id, home_team, away_team, home_score, away_score, inning, inning_status, score_id) values(11, 'Marvel', 'Captain', 0, 1, 6, 'TOP', 1);
INSERT INTO game(id, home_team, away_team, home_score, away_score, inning, inning_status, score_id) values(12, 'Marvel', 'Captain', 3, 0, 6, 'BOTTOM', 1);
INSERT INTO game(id, home_team, away_team, home_score, away_score, inning, inning_status, score_id) values(13, 'Marvel', 'Captain', 0, 1, 7, 'TOP', 1);
INSERT INTO game(id, home_team, away_team, home_score, away_score, inning, inning_status, score_id) values(14, 'Marvel', 'Captain', 3, 0, 7, 'BOTTOM', 1);
INSERT INTO game(id, home_team, away_team, home_score, away_score, inning, inning_status, score_id) values(15, 'Marvel', 'Captain', 0, 1, 8, 'TOP', 1);
INSERT INTO game(id, home_team, away_team, home_score, away_score, inning, inning_status, score_id) values(16, 'Marvel', 'Captain', 3, 0, 8, 'BOTTOM', 1);
INSERT INTO game(id, home_team, away_team, home_score, away_score, inning, inning_status, score_id) values(17, 'Marvel', 'Captain', 0, 1, 9, 'TOP', 1);
INSERT INTO game(id, home_team, away_team, home_score, away_score, inning, inning_status, score_id) values(18, 'Marvel', 'Captain', 3, 0, 9, 'BOTTOM', 1);




INSERT INTO `baseball`.`player` (`name`, `position`, `at_bat`, `hits`, `out`, `batting_average`, `number_of_pitches`, `team_name`, `batting_order`, `is_batting`)
VALUES ('cA', 'hitter', 0, 0, 0, 0, null, 'Captain', 1, FALSE);

INSERT INTO `baseball`.`player` (`name`, `position`, `at_bat`, `hits`, `out`, `batting_average`, `number_of_pitches`, `team_name`, `batting_order`, `is_batting`)
VALUES ('cB', 'hitter', 0, 0, 0, 0.535, null, 'Captain', 2, FALSE);

INSERT INTO `baseball`.`player` (`name`, `position`, `at_bat`, `hits`, `out`, `batting_average`, `number_of_pitches`, `team_name`, `batting_order`, `is_batting`)
VALUES ('cC', 'hitter', 0, 0, 0, 0, null, 'Captain', 3, FALSE );

INSERT INTO `baseball`.`player` (`name`, `position`, `at_bat`, `hits`, `out`, `batting_average`, `number_of_pitches`, `team_name`, `batting_order`, `is_batting`)
VALUES ('cD', 'hitter', 0, 0, 0, 0,  null, 'Captain', 4, FALSE );

INSERT INTO `baseball`.`player` (`name`, `position`, `at_bat`, `hits`, `out`, `batting_average`, `number_of_pitches`, `team_name`, `batting_order`, `is_batting`)
VALUES ('cE', 'hitter', 0, 0, 0, 0,  null, 'Captain', 5, FALSE );

INSERT INTO `baseball`.`player` (`name`, `position`, `at_bat`, `hits`, `out`, `batting_average`, `number_of_pitches`, `team_name`, `batting_order`, `is_batting`)
VALUES ('cF', 'hitter', 0, 0, 0, 0,  null, 'Captain', 6, FALSE );

INSERT INTO `baseball`.`player` (`name`, `position`, `at_bat`, `hits`, `out`, `batting_average`, `number_of_pitches`, `team_name`, `batting_order`, `is_batting`)
VALUES ('cG', 'hitter', 0, 0, 0, 0,  null, 'Captain', 7, FALSE );

INSERT INTO `baseball`.`player` (`name`, `position`, `at_bat`, `hits`, `out`, `batting_average`, `number_of_pitches`, `team_name`, `batting_order`, `is_batting`)
VALUES ('cH', 'hitter', 0, 0, 0, 0,  null, 'Captain', 8, FALSE );

INSERT INTO `baseball`.`player` (`name`, `position`, `at_bat`, `hits`, `out`, `batting_average`, `number_of_pitches`, `team_name`, `batting_order`, `is_batting`)
VALUES ('captainP', 'pitcher', null, null, null, null, 0, 'Captain', null, FALSE);
---------
INSERT INTO `baseball`.`player` (`name`, `position`, `at_bat`, `hits`, `out`, `batting_average`, `number_of_pitches`, `team_name`, `batting_order`, `is_batting`)
VALUES ('mA', 'hitter', 0, 0, 0, 0, null, 'Marvel', 1, FALSE);

INSERT INTO `baseball`.`player` (`name`, `position`, `at_bat`, `hits`, `out`, `batting_average`, `number_of_pitches`, `team_name`, `batting_order`, `is_batting`)
VALUES ('mB', 'hitter', 0, 0, 0, 0.535, null, 'Marvel', 2, FALSE);

INSERT INTO `baseball`.`player` (`name`, `position`, `at_bat`, `hits`, `out`, `batting_average`, `number_of_pitches`, `team_name`, `batting_order`, `is_batting`)
VALUES ('mC', 'hitter', 0, 0, 0, 0, null, 'Marvel', 3, FALSE );

INSERT INTO `baseball`.`player` (`name`, `position`, `at_bat`, `hits`, `out`, `batting_average`, `number_of_pitches`, `team_name`, `batting_order`, `is_batting`)
VALUES ('mD', 'hitter', 0, 0, 0, 0,  null, 'Marvel', 4, FALSE );

INSERT INTO `baseball`.`player` (`name`, `position`, `at_bat`, `hits`, `out`, `batting_average`, `number_of_pitches`, `team_name`, `batting_order`, `is_batting`)
VALUES ('mE', 'hitter', 0, 0, 0, 0,  null, 'Marvel', 5, FALSE );

INSERT INTO `baseball`.`player` (`name`, `position`, `at_bat`, `hits`, `out`, `batting_average`, `number_of_pitches`, `team_name`, `batting_order`, `is_batting`)
VALUES ('mF', 'hitter', 0, 0, 0, 0,  null, 'Marvel', 6, FALSE );

INSERT INTO `baseball`.`player` (`name`, `position`, `at_bat`, `hits`, `out`, `batting_average`, `number_of_pitches`, `team_name`, `batting_order`, `is_batting`)
VALUES ('mG', 'hitter', 0, 0, 0, 0,  null, 'Marvel', 7, FALSE );

INSERT INTO `baseball`.`player` (`name`, `position`, `at_bat`, `hits`, `out`, `batting_average`, `number_of_pitches`, `team_name`, `batting_order`, `is_batting`)
VALUES ('mH', 'hitter', 0, 0, 0, 0,  null, 'Marvel', 8, FALSE );

INSERT INTO `baseball`.`player` (`name`, `position`, `at_bat`, `hits`, `out`, `batting_average`, `number_of_pitches`, `team_name`, `batting_order`, `is_batting`)
VALUES ('marvelP', 'pitcher', null, null, null, null, 0, 'Marvel', null, FALSE);


-- INSERT INTO `baseball`.`ball_count` (`id`, `player_name`, `ball`, `game_id`) VALUES (1, 'Tree', 'BALL', 1);
-- INSERT INTO `baseball`.`ball_count` (`id`, `player_name`, `ball`, `game_id`) VALUES (2, 'Tree', 'BALL', 1);
-- INSERT INTO `baseball`.`ball_count` (`id`, `player_name`, `ball`, `game_id`) VALUES (3, 'Tree', 'BALL' , 1);
-- INSERT INTO `baseball`.`ball_count` (`id`, `player_name`, `ball`, `game_id`) VALUES (4, 'Tree', 'BALL' , 1);
