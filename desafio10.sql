SELECT
  s.`name` AS nome,
  COUNT(h.reproduction_date) AS reproducoes
FROM
  SpotifyClone.`history` AS h
  INNER JOIN SpotifyClone.`user` AS u ON u.id_user = h.id_user
  INNER JOIN SpotifyClone.plan AS p ON u.id_plan = p.id_plan
  INNER JOIN SpotifyClone.song AS s ON s.id_song = h.id_song
WHERE
  type = 'gratuito'
  OR type = 'pessoal'
GROUP BY
  nome
ORDER BY
  nome ASC;