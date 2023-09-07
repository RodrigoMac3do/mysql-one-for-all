SELECT
  cancao,
  COUNT(h.id_song) AS reproducoes
FROM
  SpotifyClone.`history` AS h
  INNER JOIN(
    SELECT
      id_song,
      `name` AS cancao
    FROM
      SpotifyClone.`songs`
  ) AS s ON h.id_song = s.id_song
GROUP BY
  h.id_song
ORDER BY
  reproducoes DESC,
  cancao ASC
LIMIT
  2;