SELECT
  ar.`name` AS artista,
  album,
  COUNT(f_ar.id_user) AS seguidores
FROM
  SpotifyClone.artist AS ar
  INNER JOIN (
    SELECT
      id_artist,
      id_album,
      `name` AS album
    FROM
      SpotifyClone.album
  ) AS al ON al.id_artist = ar.id_artist
  INNER JOIN SpotifyClone.following_artist AS f_ar ON f_ar.id_artist = ar.id_artist
GROUP BY
  artista,
  album
ORDER BY
  seguidores DESC,
  artista ASC,
  album ASC;