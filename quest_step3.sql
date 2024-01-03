よく見られているエピソードを知りたいです。エピソード視聴数トップ3のエピソードタイトルと視聴数を取得してください



SELECT 
    "Episode 1" AS エピソードタイトル, view_count AS 視聴数
FROM views
JOIN episodes ON views.episode_id = episodes.episode_id
ORDER BY view_count DESC
LIMIT 3;



よく見られているエピソードの番組情報やシーズン情報も合わせて知りたいです。エピソード視聴数トップ3の番組タイトル、シーズン数、エピソード数、エピソードタイトル、視聴数を取得してください


SELECT
    programs.title AS 番組タイトル,
    seasons.season_number AS シーズン数,
COUNT(episodes.episode_id) AS エピソード数,
    episodes.title AS エピソードタイトル,
    SUM(views.view_count) AS 視聴数
FROM views
JOIN episodes ON views.episode_id = episodes.episode_id
JOIN seasons ON episodes.season_id = seasons.season_id
JOIN programs ON seasons.program_id = programs.program_id
GROUP BY programs.program_id, seasons.season_number, episodes.title
ORDER BY SUM(views.view_count) DESC
LIMIT 3;






本日の番組表を表示するために、本日、どのチャンネルの、何時から、何の番組が放送されるのかを知りたいです。本日放送される全ての番組に対して、
チャンネル名、放送開始時刻(日付+時間)、放送終了時刻、シーズン数、エピソード数、エピソードタイトル、エピソード詳細を取得してください。
なお、番組の開始時刻が本日のものを本日方法される番組とみなすものとします


SELECT
    channels.name AS チャンネル名,
    MIN(channel_programs.time_slot) AS 放送開始時刻,
    ADDTIME(MIN(channel_programs.time_slot), MAX(episodes.duration)) AS 放送終了時刻,
    seasons.season_number AS シーズン数,
COUNT(episodes.episode_id) AS エピソード数,
    MAX(episodes.title) AS エピソードタイトル,
    MAX(episodes.description) AS エピソード詳細
FROM channel_programs
JOIN channels ON channel_programs.channel_id = channels.channel_id
JOIN programs ON channel_programs.program_id = programs.program_id
JOIN seasons ON programs.program_id = seasons.program_id
JOIN episodes ON seasons.season_id = episodes.season_id
WHERE DATE(channel_programs.time_slot) = DATE(NOW())
GROUP BY channels.name, channel_programs.program_id, seasons.season_number;



ドラマというチャンネルがあったとして、ドラマのチャンネルの番組表を表示するために、本日から一週間分、何日の何時から何の番組が放送されるのかを知りたいです。
ドラマのチャンネルに対して、放送開始時刻、放送終了時刻、シーズン数、エピソード数、エピソードタイトル、エピソード詳細を本日から一週間分取得してください


SELECT 
      channels.name AS チャンネル名,
      MIN(channel_programs.time_slot) AS 放送開始時刻,
      ADDTIME(MIN(channel_programs.time_slot), 
      MAX(episodes.duration)) AS 放送終了時刻, 
      seasons.season_number AS `シ ーズ ン数`, 
COUNT(episodes.episode_id) AS エピソード数, 
      MAX(episodes.title) AS エピソードタイトル,
      MAX(episodes.description) AS エピソード詳細 FROM channel_programs 
JOIN channels ON channel_programs.channel_id = channels.channel_id 
JOIN programs ON channel_programs.program_id = programs.program_id 
JOIN seasons ON programs.program_id = seasons.program_id 
JOIN episodes ON seasons.season_id = episodes.season_id 
WHERE channels.name = 'Channel A' AND DATE(channel_programs.time_slot) BETWEEN DATE(NOW())
AND DATE_ADD(DATE(NOW()), INTERVAL 7 DAY) 
GROUP BY 
  channels.name, channel_programs.program_id, seasons.season_number, episodes.episode_id;






(advanced) 直近一週間で最も見られた番組が知りたいです。直近一週間に放送された番組の中で、エピソード視聴数合計トップ2の番組に対して、番組タイトル、視聴数を取得してください

SELECT
    programs.title AS 番組タイトル,
    SUM(views.view_count) AS 視聴数
FROM views
JOIN episodes ON views.episode_id = episodes.episode_id
JOIN seasons ON episodes.season_id = seasons.season_id
JOIN programs ON seasons.program_id = programs.program_id
WHERE DATE(views.time_slot) BETWEEN CURDATE() - INTERVAL 7 DAY AND CURDATE()
GROUP BY programs.program_id, programs.title
ORDER BY SUM(views.view_count) DESC
LIMIT 2;








(advanced) ジャンルごとの番組の視聴数ランキングを知りたいです。番組の視聴数ランキングはエピソードの平均視聴数ランキングとします。ジャンルごとに視聴数トップの番組に対して、ジャンル名、番組タイトル、エピソード平均視聴数を取得してください。


SELECT
    genres.name AS ジャンル名,
    programs.title AS 番組タイトル,
    AVG(views.view_count) AS エピソード平均視聴数
FROM views
JOIN episodes ON views.episode_id = episodes.episode_id
JOIN seasons ON episodes.season_id = seasons.season_id
JOIN programs ON seasons.program_id = programs.program_id
JOIN program_genres ON programs.program_id = program_genres.program_id
JOIN genres ON program_genres.genre_id = genres.genre_id
GROUP BY genres.genre_id, programs.program_id
ORDER BY AVG(views.view_count) DESC;




