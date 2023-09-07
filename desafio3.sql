SELECT
    u.`name` AS usuario,
    COUNT(h.id_user) AS qt_de_musicas_ouvidas,
    ROUND(SUM(s.duration_time) / 60, 2) AS total_minutos
FROM
    SpotifyClone.`history` AS h
    INNER JOIN SpotifyClone.`user` AS u ON h.id_user = u.id_user
    INNER JOIN SpotifyClone.`songs` AS s ON h.id_song = s.id_song
GROUP BY
    h.id_user
ORDER BY
    u.`name` ASC;