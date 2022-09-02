SELECT
  u.`name` AS usuario,
  IF (
    YEAR(h.status_usuario) >= 2021,
    'Usuário ativo',
    'Usuário inativo'
  ) AS status_usuario
FROM
  SpotifyClone.`user` AS u
  INNER JOIN (
    SELECT
      MAX(reproduction_date) AS status_usuario,
      id_user
    FROM
      SpotifyClone.`history`
    GROUP BY
      id_user
  ) AS h ON h.id_user = u.id_user
ORDER BY
  usuario ASC;