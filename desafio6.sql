SELECT
  MIN(p.`value`) AS faturamento_minimo,
  MAX(p.`value`) AS faturamento_maximo,
  CAST(AVG(p.`value`) AS DECIMAL(3, 2)) AS faturamento_medio,
  SUM(p.`value`) AS faturamento_total
FROM
  SpotifyClone.`user` AS u
  INNER JOIN SpotifyClone.plan AS p ON u.id_plan = p.id_plan;