-- channelsテーブル
CREATE TABLE channels (
    channel_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL
);

-- genresテーブル
CREATE TABLE genres (
    genre_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    UNIQUE KEY (name)
);

-- programsテーブル
CREATE TABLE programs (
    program_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,
    description TEXT,
    UNIQUE KEY (title)
);

-- seasonsテーブル
CREATE TABLE seasons (
    season_id INT PRIMARY KEY AUTO_INCREMENT,
    program_id INT NOT NULL,
    season_number INT,
    FOREIGN KEY (program_id) REFERENCES programs(program_id)
);

-- episodesテーブル
CREATE TABLE episodes (
    episode_id INT PRIMARY KEY AUTO_INCREMENT,
    season_id INT NOT NULL,
    episode_number INT,
    title VARCHAR(100) NOT NULL,
    description TEXT,
    duration TIME,
    release_date DATE,
    views INT DEFAULT 0,
    FOREIGN KEY (season_id) REFERENCES seasons(season_id)
);

-- program_genresテーブル
CREATE TABLE program_genres (
    program_id INT NOT NULL,
    genre_id INT NOT NULL,
    FOREIGN KEY (program_id) REFERENCES programs(program_id),
    FOREIGN KEY (genre_id) REFERENCES genres(genre_id)
);

-- channel_programsテーブル
CREATE TABLE channel_programs (
    channel_id INT NOT NULL,
    program_id INT NOT NULL,
    time_slot DATETIME,
    FOREIGN KEY (channel_id) REFERENCES channels(channel_id),
    FOREIGN KEY (program_id) REFERENCES programs(program_id)
);

-- viewsテーブル
CREATE TABLE views (
    episode_id INT NOT NULL,
    channel_id INT NOT NULL,
    time_slot DATETIME,
    view_count INT DEFAULT 0,
    FOREIGN KEY (episode_id) REFERENCES episodes(episode_id),
    FOREIGN KEY (channel_id) REFERENCES channels(channel_id)
);
