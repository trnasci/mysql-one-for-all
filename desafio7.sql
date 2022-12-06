SELECT 
    a.nome AS artista,
    alb.nome AS album,
    COUNT(seg.artista_id) AS seguidores
FROM
    SpotifyClone.artista AS a
        RIGHT JOIN
    SpotifyClone.album AS alb ON a.id = alb.artista_id
        INNER JOIN
    SpotifyClone.seguindo_artista AS seg ON alb.artista_id = seg.artista_id
GROUP BY a.nome , alb.nome
ORDER BY COUNT(seg.artista_id) DESC , a.nome , alb.nome;
