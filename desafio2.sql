SELECT
    COUNT(`name`) AS cancoes,
    COUNT(DISTINCT id_artist) AS artistas,
    COUNT(DISTINCT id_album) AS albuns
FROM
    SpotifyClone.songs;