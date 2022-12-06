SELECT 
    a.nome AS artista,
    alb.nome AS album
FROM
    SpotifyClone.artista AS a
        RIGHT JOIN
    SpotifyClone.album AS alb ON a.id = alb.artista_id
WHERE a.nome = 'Elis Regina'
GROUP BY a.nome , alb.nome;
