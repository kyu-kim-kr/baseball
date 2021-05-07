INSERT INTO game(id, home_team, away_team, home_score, away_score, inning, inning_status) values(1, 'Captain', 'Marvel', 0, 0, 1, 'TOP');
INSERT INTO game(id, home_team, away_team, home_score, away_score) values(2, 'twins', 'tigers', 0, 0);
-- INSERT INTO game(id, home_team, away_team, home_score, away_score) values(3, 'twins', 'tigers', 0, 0);
-- INSERT INTO game(id, home_team, away_team, home_score, away_score, hit) values(3, 'twins', 'tigers', 0, 0, 1);



INSERT INTO `baseball`.`team` (`name`) VALUES ('Captain');
INSERT INTO `baseball`.`team` (`name`) VALUES ('Marvel');

INSERT INTO `baseball`.`player` (`name`, `position`, `at_bat`, `hits`, `out`, `batting_average`, `number_of_pitches`, `team_name`, `batting_order`, `is_batting`)
VALUES ('Tree', 'hitter', 1, 2, 1, 0.535, null, 'Captain', 1, TRUE);

INSERT INTO `baseball`.`player` (`name`, `position`, `at_bat`, `hits`, `out`, `batting_average`, `number_of_pitches`, `team_name`, `batting_order`, `is_batting`)
VALUES ('Kyu', 'pitcher', null, null, null, null, '35', 'Captain', null, FALSE);

INSERT INTO `baseball`.`player` (`name`, `position`, `at_bat`, `hits`, `out`, `batting_average`, `number_of_pitches`, `team_name`, `batting_order`, `is_batting`)
VALUES ('Branch', 'hitter', '1', 2, 1, 0.535, '35', 'Captain', 1, TRUE);

INSERT INTO `baseball`.`player` (`name`, `position`, `at_bat`, `hits`, `out`, `batting_average`, `number_of_pitches`, `team_name`, `batting_order`, `is_batting`)
VALUES ('Q', 'pitcher', null, null, null, null, '35', 'Marvel', null, FALSE);


INSERT INTO `baseball`.`score` (`id`, `home_team`, `away_team`, `home_score`, `away_score`) VALUES (1, 'Captain', 'Marvel', 1, 2);

INSERT INTO `baseball`.`ball_count` (`id`, `ball`, `is_hit`, `game_id`) VALUES (1, 'STRIKE', TRUE, 1);
