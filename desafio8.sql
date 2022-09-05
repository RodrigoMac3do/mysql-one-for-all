SELECT
  ar.name AS artista,
  al.name AS album
FROM
  SpotifyClone.album AS al
  INNER JOIN SpotifyClone.artist AS ar ON ar.id_artist = al.id_artist
WHERE
  ar.name = 'Elis Regina';