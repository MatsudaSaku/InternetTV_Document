-- channelsテーブル
INSERT INTO channels (channel_id, name) VALUES
(1, 'Channel A'),
(2, 'Channel B'),
(3, 'Channel C');

-- genresテーブル
INSERT INTO genres (genre_id, name) VALUES
(1, 'Genre 1'),
(2, 'Genre 2'),
(3, 'Genre 3');

-- programsテーブル
INSERT INTO programs (program_id, title, description) VALUES
(1, 'Program 1', 'Description for Program 1'),
(2, 'Program 2', 'Description for Program 2'),
(3, 'Program 3', 'Description for Program 3');

-- seasonsテーブル
INSERT INTO seasons (season_id, program_id, season_number) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1);

-- episodesテーブル
INSERT INTO episodes (episode_id, season_id, episode_number, title, description, duration, release_date) VALUES
(1, 1, 1, 'Episode 1', 'Description for Episode 1', '00:30:00', '2023-01-01'),
(2, 1, 2, 'Episode 2', 'Description for Episode 2', '00:30:00', '2023-01-08'),
(3, 2, 1, 'Episode 1', 'Description for Episode 1', '00:25:00', '2023-01-05'),
(4, 3, 1, 'Episode 1', 'Description for Episode 1', '00:40:00', '2023-01-10');


-- program_genresテーブル
INSERT INTO program_genres (program_id, genre_id) VALUES
(1, 1),
(1, 2),
(2, 2),
(3, 3);

-- channel_programsテーブル
INSERT INTO channel_programs (channel_id, program_id, time_slot) VALUES
(1, 1, '2023-01-01 20:00:00'),
(2, 1, '2023-01-05 21:30:00'),
(3, 1, '2023-01-10 19:45:00'),
(1, 2, '2023-01-02 22:00:00'),
(2, 2, '2023-01-08 23:00:00'),
(3, 2, '2023-01-12 19:45:00'),
(1, 3, '2023-01-03 18:00:00'),
(2, 3, '2023-01-07 20:30:00'),
(3, 3, '2023-01-15 22:45:00');

-- viewsテーブル
INSERT INTO views (episode_id, channel_id, time_slot, view_count) VALUES
(1, 1, '2023-01-01 20:00:00', 100),
(2, 2, '2023-01-08 23:00:00', 150),
(3, 3, '2023-01-10 19:45:00', 80),
(1, 1, '2023-01-02 22:00:00', 120),
(2, 2, '2023-01-05 21:30:00', 180),
(3, 3, '2023-01-12 19:45:00', 90),
(1, 1, '2023-01-03 18:00:00', 80),
(2, 2, '2023-01-07 20:30:00', 120),
(3, 3, '2023-01-15 22:45:00', 70);
