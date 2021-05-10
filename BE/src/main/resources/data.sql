INSERT INTO `baseball`.`team` (`name`) VALUES ('Captain');
INSERT INTO `baseball`.`team` (`name`) VALUES ('Marvel');

INSERT INTO `baseball`.`score` (`id`, `home_team`, `away_team`, `home_score`, `away_score`) VALUES (1, 'Marvel', 'Captain', 0, 0);

INSERT INTO game(id, home_team, away_team, home_score, away_score, inning, inning_status, score_id) values(1, 'Marvel', 'Captain', 0, 0, 1, 'TOP', 1);
INSERT INTO game(id, home_team, away_team, home_score, away_score, inning, inning_status, score_id) values(2, 'Marvel', 'Captain', 2, 0, 1, 'BOTTOM', 1);
INSERT INTO game(id, home_team, away_team, home_score, away_score, inning, inning_status, score_id) values(3, 'Marvel', 'Captain', 0, 1, 2, 'TOP', 1);
INSERT INTO game(id, home_team, away_team, home_score, away_score, inning, inning_status, score_id) values(4, 'Marvel', 'Captain', 3, 0, 2, 'BOTTOM', 1);
-- INSERT INTO game(id, home_team, away_team, home_score, away_score, inning. inning_status, score_id) values(2, 'twins', 'tigers', 0, 0, 1, 'TOP', 1);
-- INSERT INTO game(id, home_team, away_team, home_score, away_score, inning. inning_status, score_id) values(3, 'twins', 'tigers', 0, 0, 1, 'TOP', 1);
-- INSERT INTO game(id, home_team, away_team, home_score, away_score, hit, inning. inning_status, score_id) values(3, 'twins', 'tigers', 0, 0, 1 'BOTTOM', 1);





INSERT INTO `baseball`.`player` (`name`, `position`, `at_bat`, `hits`, `out`, `batting_average`, `number_of_pitches`, `team_name`, `batting_order`, `is_batting`)
VALUES ('Tree', 'hitter', 1, 2, 1, 0.535, null, 'Captain', 1, FALSE);

INSERT INTO `baseball`.`player` (`name`, `position`, `at_bat`, `hits`, `out`, `batting_average`, `number_of_pitches`, `team_name`, `batting_order`, `is_batting`)
VALUES ('Branch', 'hitter', 1, 2, 1, 0.535, null, 'Captain', 2, FALSE);

INSERT INTO `baseball`.`player` (`name`, `position`, `at_bat`, `hits`, `out`, `batting_average`, `number_of_pitches`, `team_name`, `batting_order`, `is_batting`)
VALUES ('chanho', 'hitter', 1, 2, 1, 0.9, null, 'Captain', 3, FALSE );

INSERT INTO `baseball`.`player` (`name`, `position`, `at_bat`, `hits`, `out`, `batting_average`, `number_of_pitches`, `team_name`, `batting_order`, `is_batting`)
VALUES ('sinsu', 'hitter', 1, 2, 1, 0.535,  null, 'Captain', 4, FALSE );

INSERT INTO `baseball`.`player` (`name`, `position`, `at_bat`, `hits`, `out`, `batting_average`, `number_of_pitches`, `team_name`, `batting_order`, `is_batting`)
VALUES ('Q', 'pitcher', null, null, null, null, '35', 'Marvel', null, FALSE);

INSERT INTO `baseball`.`player` (`name`, `position`, `at_bat`, `hits`, `out`, `batting_average`, `number_of_pitches`, `team_name`, `batting_order`, `is_batting`)
VALUES ('Kyu', 'pitcher', null, null, null, null, '35', 'Captain', null, FALSE);


-- INSERT INTO `baseball`.`ball_count` (`id`, `player_name`, `ball`, `game_id`) VALUES (1, 'Tree', 'BALL', 1);
-- INSERT INTO `baseball`.`ball_count` (`id`, `player_name`, `ball`, `game_id`) VALUES (2, 'Tree', 'BALL', 1);
-- INSERT INTO `baseball`.`ball_count` (`id`, `player_name`, `ball`, `game_id`) VALUES (3, 'Tree', 'BALL' , 1);
-- INSERT INTO `baseball`.`ball_count` (`id`, `player_name`, `ball`, `game_id`) VALUES (4, 'Tree', 'BALL' , 1);
