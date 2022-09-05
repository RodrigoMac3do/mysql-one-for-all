SELECT
  COUNT(*) AS quantidade_musicas_no_historico
FROM
  SpotifyClone.`history` AS h
  INNER JOIN SpotifyClone.user AS u ON u.id_user = h.id_user
WHERE
  `name` = 'Barbara Liskov';